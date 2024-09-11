import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';

import 'package:get/get.dart';
import 'package:recess/core/cache.service.dart';

import '../../core/video_call_ids.dart';
import '../expert/expert_profile_controller.dart';

class CallController extends GetxController {
  final expertProfileController = Get.find<ExpertProfileController>();
  final CacheService _cacheSerivce = CacheService();

  final RxBool speakerOn = false.obs;
  RxInt myremoteUid = 123456.obs;
  RxBool localUserJoined = false.obs;
  RxBool muted = false.obs;
  RxBool videoPaused = false.obs;
  RxBool switchMainView = false.obs;
  RxBool mutedVideo = false.obs;
  RxBool reConnectingRemoteView = false.obs;
  RxBool isFront = false.obs;
  late RtcEngine engine;

  @override
  void onInit() {
    super.onInit();
    initialize();
    init();
  }

  @override
  void onClose() {
    super.onClose();
    clear();
  }

  void onSpeakerToggle() {
    speakerOn.value = !speakerOn.value;
    engine.setEnableSpeakerphone(speakerOn.value);
  }

  Future<void> clear() async {
    await engine.leaveChannel();
    await engine.stopPreview();
    await engine.disableAudio();
    await engine.disableVideo();
    await engine.release(); // Release Agora engine resources
    isFront.value = false;
    reConnectingRemoteView.value = false;
    videoPaused.value = false;
    muted.value = false;
    mutedVideo.value = false;
    switchMainView.value = false;
    localUserJoined.value = false;
  }

  Future<void> initialize() async {
    await _initAgoraRtcEngine();
    _addAgoraEventHandlers();
    await engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    VideoEncoderConfiguration configuration = const VideoEncoderConfiguration();
    await engine.setVideoEncoderConfiguration(configuration);

    print("Token : ${expertProfileController.token.value}");
    print("ChannelId: ${expertProfileController.channelId.value}");
    print("UID: ${myremoteUid.value}");
    await engine.joinChannel(
      token: token,
      channelId: channgeId,
      // token: expertProfileController.token.value!,
      // channelId: expertProfileController.channelId.value!,
      uid: myremoteUid.value,
      options: const ChannelMediaOptions(),
    );
    await engine.enableVideo();
    await engine.enableAudio();
    refresh();
  }

  int stringToInteger(String id) {
    var bytes = utf8.encode(id); // Convert string to bytes
    var digest = sha256.convert(bytes); // Hash the bytes
    return int.parse(digest.toString().substring(0, 8),
        radix: 16); // Convert the hash to an integer
  }

  init() async {
    String? userId = await _cacheSerivce.getUserId();
    int userIdAsInt = stringToInteger(userId ?? "");
    myremoteUid.value = userIdAsInt;
    print(userIdAsInt);
  }

  Future<void> _initAgoraRtcEngine() async {
    engine = createAgoraRtcEngine();
    await engine.initialize(const RtcEngineContext(
        appId: appId,
        channelProfile: ChannelProfileType.channelProfileLiveBroadcasting));
  }

  void _addAgoraEventHandlers() {
    engine.registerEventHandler(
      RtcEngineEventHandler(
        onError: (type, error) {
          print("Error Type : ${type.name}");
          print("On JOin Error : ${error.length}");
        },
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          localUserJoined.value = true;

          print(
              "On Join Channel ${connection.channelId}, ${connection.localUid} ");

          refresh();
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          myremoteUid.value = remoteUid;
          refresh();
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          myremoteUid.value = 0;
          onCallEnd();
          refresh();
        },
        onRemoteVideoStats:
            (RtcConnection connection, RemoteVideoStats remoteVideoStats) {
          videoPaused.value = remoteVideoStats.receivedBitrate == 0;
          refresh();
        },
        onLeaveChannel: (RtcConnection connection, stats) {
          clear();
          onCallEnd();
          refresh();
        },
      ),
    );
  }

  void onVideoOff() {
    mutedVideo.value = !mutedVideo.value;
    engine.muteLocalVideoStream(mutedVideo.value);
    refresh();
  }

  void onCallEnd() async {
    await engine.leaveChannel(); // Leave the channel
    await engine.release(); // Release resources
    Get.back();
  }

  void onToggleMute() async {
    muted.value = !muted.value;
    await engine.muteLocalAudioStream(muted.value);
    refresh();
  }

  void onToggleMuteVideo() {
    mutedVideo.value = !mutedVideo.value;
    engine.muteLocalVideoStream(mutedVideo.value);
    refresh();
  }

  void onSwitchCamera() {
    engine.switchCamera().then((value) => {}).catchError((err) {});
  }

  @override
  void dispose() {
    engine.leaveChannel();
    engine.release();

    super.dispose();
  }
}
