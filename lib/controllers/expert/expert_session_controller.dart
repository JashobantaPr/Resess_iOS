import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:recess/core/video_call_ids.dart';
import 'package:recess/models/video_audio_model/get_tocken.model.dart';
import 'package:recess/service/expert_serivice.dart';

import '../../core/cache.service.dart';
import '../../models/exper_model/expert_session_upcoming_model.dart';
import '../../routes/app_routes.dart';
import '../../service/video_audio_chat_serivce/call_services.dart';

enum LeraningSessionViewType { upcoming, past }

class ExpertSessionController extends GetxController {
  final CacheService _cacheService = CacheService();
  Rx<LeraningSessionViewType> viewType = LeraningSessionViewType.upcoming.obs;
  RxList<ExpertSessionUpcomingModel?> expertUpcomingData =
      <ExpertSessionUpcomingModel>[].obs;
  RxList<ExpertSessionUpcomingModel?> expertpastData =
      <ExpertSessionUpcomingModel>[].obs;
  Rx<getTockens?> channel = getTockens().obs;
  Rx<String?> channelId = ''.obs;
  Rx<String?> token = "".obs;

  changeProfileViewType(LeraningSessionViewType type) {
    viewType.value = type;
  }

  @override
  void onInit() {
    super.onInit();
    expertSessionUpcomingData();
    pastSessionUpcomingData();
  }

  expertSessionUpcomingData() async {
    try {
      List<ExpertSessionUpcomingModel>? result =
          await ExpertSerivice().ExpertUpcomingSession();
      if (result != null) {
        expertUpcomingData.value = result;
      }
    } catch (e) {
      expertUpcomingData.value = [];
    }
  }

  pastSessionUpcomingData() async {
    try {
      List<ExpertSessionUpcomingModel>? result =
          await ExpertSerivice().ExpertPastSession();
      if (result != null) {
        expertpastData.value = result;
      }
    } catch (e) {
      expertpastData.value = [];
    }
  }

  getTocken(String? channelName, String? type) async {
    try {
      String? userid = await _cacheService.getUserId();
      List<String?> userIdList = userid != null ? [userid] : [];
      Map<String, dynamic> body = {
        "user_ids": userIdList,
        "channelName": channelName
      };

      getTockens? data = await CallServices().getTocken(body);
      if (data != null) {
        channel.value = data;
        channelId.value = channel.value!.channelName;
        token.value = channel.value!.tokens!.first.token;
        if (type == "Call") {
          return onJoin();
        } else if (type == "Video") {
          return onJoin();
        } else if (type == "Chat") {
          return null;
        } else {
          return null;
        }
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> onJoin() async {
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);

    // Navigate to VideoCall page with the channelId
    await Get.toNamed(
      AppRoutes.videoCallScreen,
      arguments: {
        "channelId": channgeId
        // 'channelId': channelId.value,
      },
    );
  }

  Future<void> onJoinAudioCall() async {
    await _handleCameraAndMic(Permission.microphone);

    // Navigate to VideoCall page with the channelId
    await Get.toNamed(
      AppRoutes.audioCallScreen,
      arguments: {
        "channelId": channgeId
        // 'channelId': channelId.value,
      },
    );
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
}
