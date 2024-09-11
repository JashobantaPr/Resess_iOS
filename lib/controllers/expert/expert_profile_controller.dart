import 'package:get/state_manager.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/cache.service.dart';
import 'package:get/get.dart';
import 'package:recess/service/useronlineoffline_service.dart';

import '../../core/video_call_ids.dart';
import '../../models/exper_model/expert_profile_model.dart';
import '../../models/exper_model/expert_session_upcoming_model.dart';
import '../../models/exper_model/past_booking_expert_model.dart';
import '../../models/video_audio_model/get_tocken.model.dart';
import '../../routes/app_routes.dart';
import '../../service/expert_serivice.dart';
import '../../service/video_audio_chat_serivce/call_services.dart';

class ExpertProfileController extends GetxController {
  final CacheService _cacheService = CacheService();

  Rx<ExpertProfileModel> expertProfile = ExpertProfileModel().obs;

  RxList<ExpertSessionUpcomingModel?> expertUpcomingData =
      <ExpertSessionUpcomingModel>[].obs;

  RxList<getPastExpertBookingsModel?> upcomingPastData =
      <getPastExpertBookingsModel>[].obs;

  Rx<getTockens?> channel = getTockens().obs;
  var isLoading = false.obs;
  RxBool isOfflineonline = false.obs;
  RxBool isSwitched = false.obs;
  Rx<String?> channelId = ''.obs;
  Rx<String?> token = "".obs;

  void tappedSwitch(bool switched) async {
    isOfflineonline.value = switched;
    // Call the API when the switch is toggled
    await setuserOnlineOffline();
  }

  Future<void> setuserOnlineOffline() async {
    print('API call initiated');
    String? userId = await CacheService().getUserId();
    print('UserId: $userId');

    Map<String, dynamic> mapdata = {
      "user_id": userId,
      "onlineOffline": isOfflineonline.value
    };
    isLoading.value = true;
    Map<String, dynamic>? response =
        await UserOnlineOfflineService().setuserOnlineOffline(mapdata);
    isLoading.value = false;

    if (response != null && response["Status"] == true) {
      print('API call successful: ${response["message"]}');
    } else {
      // Show error message
      String message =
          response?["message"] ?? "Failed to update privacy settings";
      print('API call failed: $message');
      // Get.snackbar("Error", message);
    }
  }

  Future<void> getuserOnlineOffline() async {
    print('Fetching user onlineOffline status');
    String? userId = await CacheService().getUserId();
    print('UserId: $userId');
    Map<String, dynamic> mapdata = {
      "user_id": userId ?? "",
    };
    isLoading.value = true;
    Map<String, dynamic>? response =
        await UserOnlineOfflineService().getuserOnlineOffline(mapdata);
    isLoading.value = false;

    if (response != null && response["Status"] == true) {
      print('Response data: ${response['data']}');

      expertProfile.refresh();

      // Update the isOffline variable based on the fetched onlineOffline status
      isOfflineonline.value = response['data']['onlineOffline'] ?? false;
    } else {
      // Show error message or handle the error
      String message =
          response?["message"] ?? "Failed to fetch onlineOffline status";
      print('Error: $message');
    }
  }

  @override
  void onInit() {
    expertSessionUpcomingData();
    expertProfileData();

    getuserOnlineOffline();

    super.onInit();
  }

  //upcoming data

  upcomingData() async {
    try {
      String? userId = await _cacheService.getUserId();
      Map<String, dynamic> body = {
        "expert_id": userId,
      };
      List<getPastExpertBookingsModel>? data =
          await ExpertSerivice().upcomingPastBookingList(body);
      if (data != null) {
        upcomingPastData.value = data;
      }
    } catch (e) {
      return null;
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

  expertSessionUpcomingData() async {
    try {
      List<ExpertSessionUpcomingModel>? result =
          await ExpertSerivice().ExpertUpcomingSession();
      if (result != null) {
        expertUpcomingData.value = result;
        expertUpcomingData.refresh();
      }
    } catch (e) {
      expertUpcomingData.value = [];
    }
  }

  expertProfileData() async {
    try {
      String? userId = await _cacheService.getUserId();
      Map<String, dynamic> body = {
        "user_id": userId,
      };
      ExpertProfileModel? data = await ExpertSerivice().experProfile(body);
      if (data != null) {
        expertProfile.value = data;
      }
    } catch (e) {
      return;
    }
  }
}
