import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/state_manager.dart';

import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Dashboard/home/balance_top_up_screen.dart';
import 'package:recess/Dashboard/settings/favourites/favourites_screen.dart';
import 'package:recess/Dashboard/settings/learningsession/learning_scession_screen.dart';
import 'package:recess/Dashboard/settings/my_details_screen.dart';
import 'package:recess/Dashboard/settings/my_privacy_screen.dart';
import 'package:recess/Dashboard/settings/notification_screen.dart';
import 'package:recess/Dashboard/settings/privacypolicy_screen.dart';
import 'package:recess/Dashboard/settings/terms&conditions_screen.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/Utility/app_routes.dart';
import 'package:recess/Utility/delete_modal.dart';

import 'package:recess/core/cache.service.dart';
import 'package:recess/popup_model.dart';
import 'package:recess/routes/app_routes.dart';
import 'package:recess/service/settings_service.dart';

class SettingsModel {
  String id;
  String icon;
  String text;

  SettingsModel({required this.id, required this.icon, required this.text});
}

class ChangePasswordController extends GetxController {
  CacheService _cacheService = CacheService();

  final userId = Rx<String?>(null);
  final userProfileStatus = Rx<bool>(false);

  void onChange(String? id) {
    userId.value = id;
  }

  void onChangeProfileStatus(bool value) {
    userProfileStatus.value = value;
  }

  List<SettingsModel> settingsList = [
    SettingsModel(
        id: "notifications", icon: AppImages.bellIcon, text: "Notifications"),
    SettingsModel(
        id: "my_details", icon: AppImages.profileIcon, text: "My details"),
    SettingsModel(
        id: "learning_sessions",
        icon: AppImages.chatIcon,
        text: "Learning sessions"),
    SettingsModel(
        id: "favourites", icon: AppImages.favIcon, text: "Favourites"),
    SettingsModel(id: "wallet", icon: AppImages.walletIcon, text: "Wallet"),
    SettingsModel(
        id: "my_privacy", icon: AppImages.lockIcon, text: "My privacy"),
    SettingsModel(
        id: "Contact_support",
        icon: AppImages.supportIcon,
        text: "Contact support"),
    SettingsModel(
        id: "terms_conditions",
        icon: AppImages.termsIcon,
        text: "Terms & conditions"),
    SettingsModel(
        id: "privacy_policy",
        icon: AppImages.privacyIcon,
        text: "Privacy policy"),
  ];

  onTapSetting(String settingId) {
    switch (settingId) {
      case "notifications":
        Get.toNamed(AppRoutes.notificationScreen);
        break;
      case "favourites":
        Get.to(FavouritesScreen());
        break;
      case "wallet":
        Get.to(BalanceTopUpScreen());
        break;
      case "terms_conditions":
        Get.to(TermsandConditionsScreen());
        break;
      case "privacy_policy":
        Get.to(PrivacyPolicyScreen());
        break;
      case "my_privacy":
        Get.to(MyPrivacyScreen());
        break;
      case "my_details":
        Get.to(MyDetailsScreen());
        break;
      case "learning_sessions":
        Get.toNamed(AppRoutes.learningSessionScreen);
        break;
      case "delete_account":
        showDeleteAccountDialog();
        break;
      case "log_out":
        _showLogoutDialog();
        break;
    }
  }

  void showDeleteAccountDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Container(
          width: 330,
          height: 230,
          child: DeleteAccountModalPopUp(),
        ),
      ),
      barrierDismissible: true,
    );
  }

  void _showLogoutDialog() {
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
              child: DeleteAccountModal(),
            ),
          );
        });
  }

  RxBool isObscurePassword = true.obs;
  RxBool isObscureConfirmPassword = true.obs;
  var isLoading = false.obs;

  TextEditingController txtPwdController = TextEditingController();
  TextEditingController txtConPwdController = TextEditingController();
  var errorMessage = ''.obs;
  var errorOldMessage = ''.obs;
  var email = ''.obs;
  String? currentpassword;

  onTapPasswordEye(bool obscure) {
    isObscurePassword.value = obscure;
  }

  onTapConfirmPasswordEye(bool obscure) {
    isObscureConfirmPassword.value = obscure;
  }

  logout() async {
    _cacheService.removeAll();
    Get.offAll(LoginOptionsScreen());
  }

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
    init();
  }

  init() async {
    userId.value = await _cacheService.getUserId();
    userProfileStatus.value = await _cacheService.getProfileStatus() ?? false;

    if (userId.value != null && userProfileStatus.value == true) {
      List<SettingsModel> tempList = [
        SettingsModel(
            id: "log_out", icon: AppImages.logoutIcon, text: "Log out"),
        SettingsModel(
            id: "delete_account",
            icon: AppImages.deleteIcon,
            text: "Delete account"),
      ];
      settingsList.addAll(tempList);
    }
  }

  void clearTextFields() {
    txtPwdController.clear();
    txtConPwdController.clear();
    errorMessage = ''.obs;
    errorOldMessage = ''.obs;
  }

  Future<void> changePassword() async {
    print('Attempting to change password');
    String? userId = await CacheService().getUserId();
    String? mypastpassword = await CacheService().getPassWord();

    print('mypastpassword: $mypastpassword');

    if (txtPwdController.text.isEmpty) {
      errorMessage.value = 'Please fill the current password';
      return;
    } else if (mypastpassword != txtPwdController.text) {
      errorMessage.value = 'Please enter a valid current password';
      return;
    }

    if (txtConPwdController.text.isEmpty) {
      errorOldMessage.value = 'Please fill the new password';
      return;
    }

    Map<String, dynamic> mapdata = {
      "user_id": userId ?? "",
      "oldPassword": txtPwdController.text,
      "newPassword": txtConPwdController.text
    };
    isLoading.value = true;
    Map<String, dynamic>? response =
        await SettingsService().changePassword(mapdata);
    isLoading.value = false;
    if (response != null && response["Status"] == true) {
      print('Password change successful: ${response.toString()}');
      clearTextFields();
      Get.back();
    } else {
      String message = response?["message"] ?? "Failed to update password";
      print('Password change failed: $message');
      clearTextFields();
      Get.back();

      // Get.snackbar("Error", message);
    }
  }

  Future<void> fetchUserDetails() async {
    String? userId = await CacheService().getUserId();
    try {
      print('Fetching user details...');
      final userProfileResponse =
          await SettingsService().getUserDetails(userId!);

      if (userProfileResponse != null && userProfileResponse.status) {
        final profile = userProfileResponse.data?.profile;
        if (profile != null) {
          email.value = profile.email;
          currentpassword = profile.password;

          print('User details fetched successfully');
        } else {
          // Handle case where profile is null
          print('No profile data found');
        }
      } else {
        // Handle API response status false
        print('Failed to fetch user details: ${userProfileResponse?.message}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
