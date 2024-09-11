// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:recess/Utility/get_prefs.dart';

import 'package:recess/network_services/app_consts.dart';

import '../Auth/enter_email_screen.dart';

import '../core/cache.service.dart';

import '../models/exper_model/admin_status_model.dart';

import '../service/become_an_expertprofile_service.dart';

class MainDashboardController extends GetxController {
  final CacheService _cacheService = CacheService();
  Rx<LoadingState> loadingState = LoadingState.Loaded.obs;
  RxList<AdminStatusModel> adminStatus = <AdminStatusModel>[].obs;
  late PageController pageController;

  RxInt currentPage = 0.obs;

  RxBool expertPageChange = false.obs;

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }

  Widget? getExpertWidget() {
    // if (adminStatus.value == 'submitted') {
    //   return GetPrefs.getBool(AppConst.showExpertProfile)
    //       ? ExpertProfile()
    //       : VerificationStatusPendingScreen();
    // } else if (adminStatus.value == 'pending') {
    //   return GetPrefs.getBool(AppConst.showExpertProfile)
    //       ? ExpertProfile()
    //       : VerificationStatusPendingScreen();
    // } else if (adminStatus.value == 'approved') {
    //   return GetPrefs.getBool(AppConst.showExpertProfile)
    //       ? ExpertProfile()
    //       : VerificationScuccessScreen();
    // } else if (adminStatus.value == 'rejected') {
    //   return VerificationRejectedScreen();
    // } else {
    //   return null;
    // }
  }

  @override
  void onInit() {
    // getExpertProfile();

    getAdminResponse();

    pageController =
        PageController(initialPage: GetPrefs.getInt(AppConst.homePageNumber));
    GetPrefs.setInt(AppConst.homePageNumber, 0);
    super.onInit();
    // getExpertSettingById();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  getAdminResponse() async {
    try {
      String? userId = await _cacheService.getUserId();
      Map<String, dynamic> body = {"expert_id": userId};
      List<AdminStatusModel>? data =
          await BecomeAnExpertProfileService().adminStatus(body);
      if (data != null) {
        adminStatus.value = data;
      }
    } catch (e) {
      return null;
    }
  }
}
