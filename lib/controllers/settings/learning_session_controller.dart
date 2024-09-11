import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:recess/core/cache.service.dart';
import 'package:recess/service/settings_service.dart';

import '../../Dashboard/home/home_screen.dart';
import '../../components/error_booking_popup.dart';

import '../../core/video_call_ids.dart';
import '../../models/settings_model/learner_past_session.dart';
import '../../models/settings_model/upcomming_user_profile.model.dart';
import '../../models/video_audio_model/get_tocken.model.dart';
import '../../routes/app_routes.dart';
import '../../service/home_screen.service.dart';
import '../../service/video_audio_chat_serivce/call_services.dart';

enum LeraningSessionViewType { upcoming, past }

class LearningSessionController extends GetxController {
  var selectedRating = 0.obs;
  TextEditingController reviewController = TextEditingController();
  final CacheService _cacheService = CacheService();
  Rx<LeraningSessionViewType> viewType = LeraningSessionViewType.upcoming.obs;
  late PageController pageController;
  RxInt currentTab = 0.obs;
  RxBool searchActive = false.obs;
  Rx<getTockens?> channel = getTockens().obs;
  Rx<String?> channelId = ''.obs;
  Rx<String?> token = "".obs;
  RxList<UpcomingUserBookingsModel?> upComingUserBookingData =
      <UpcomingUserBookingsModel>[].obs;
  RxList<LearnerPassSessionsModel?> pastdata = <LearnerPassSessionsModel>[].obs;

  changeProfileViewType(LeraningSessionViewType type) {
    viewType.value = type;
  }

  void updateRating(int rating) {
    if (selectedRating.value == rating) {
      selectedRating.value = 0;
    } else {
      selectedRating.value = rating;
    }
  }

  bool get isClinicView => viewType.value == LeraningSessionViewType.past;

  void goToTab(int page) {
    if (page == 2) {
      searchActive.value = true;
      pageController.jumpToPage(2);
    } else {
      searchActive.value = false;
      currentTab.value = page;
      pageController.jumpToPage(currentTab.value);
    }
  }

  @override
  void onInit() async {
    pageController = PageController(initialPage: 0);
    super.onInit();
    await userUpcomingBookingData();
    await userPastBookingData();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  userUpcomingBookingData() async {
    try {
      List<UpcomingUserBookingsModel>? result =
          await SettingsService().upComingUserBookingList();
      if (result != null) {
        upComingUserBookingData.value = result;
        upComingUserBookingData.refresh();
      }
    } catch (e) {
      upComingUserBookingData.value = [];
    }
  }

  userPastBookingData() async {
    try {
      List<LearnerPassSessionsModel>? result =
          await SettingsService().PastUserBookingList();
      if (result != null) {
        pastdata.value = result;
      }
    } catch (e) {
      pastdata.value = [];
    }
  }

  String formatDate(String isoDate) {
    final date = DateTime.parse(isoDate);

    final now = DateTime.now();

    final startOfToday = DateTime(now.year, now.month, now.day);
    final startOfTomorrow = startOfToday.add(Duration(days: 1));

    final formatter = DateFormat('d MMM yyyy');

    if (date.isAtSameMomentAs(startOfToday)) {
      return 'Today';
    } else if (date.isAtSameMomentAs(startOfTomorrow)) {
      return 'Tomorrow';
    } else {
      return formatter.format(date);
    }
  }

  bookingCancel() async {
    String? userId = await _cacheService.getUserId();
    Map<String, dynamic> body = {
      "user_id": userId,
      "booking_id": upComingUserBookingData.first?.sId
    };
    try {
      bool? result = await HomeService().cancelBooking(body);
      if (result == true) {
        Get.to(HomeScreen());
      }
    } catch (e) {
      return null;
    }
  }

  void showPopUpDialog() {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(
              width: 330,
              height: 230,
              child: CancelBookingPopUp(),
            ),
          );
        });
  }

  //addratings

  addRatings() async {
    try {
      double expertIdAsDouble = double.parse(pastdata.first!.expertId!);
      String? userId = await _cacheService.getUserId();
      Map<String, dynamic> body = {
        "user_id": userId,
        "expert_id": expertIdAsDouble,
        "rating": selectedRating.value,
        "description": reviewController.text
      };
      bool? result = await SettingsService().addRatings(body);
      if (result == true) {
        pastdata.refresh();
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

  getTocken(String? channelName, String? type) async {
    try {
      String? userid = await _cacheService.getUserId();
      List<String?> userIdList =
          userid != null ? [userid] : []; // Convert userid to a list
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
}
