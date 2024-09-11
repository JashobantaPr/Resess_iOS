import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:recess/Auth/login_options_screen.dart';

import '../../Auth/create_password_screen.dart';
import '../../Auth/enter_email_screen.dart';

import '../../models/onboarding_model/onboarding_model.dart';

import '../../service/onboarding.service.dart';
import 'enter_email_controller.dart';

class EmailVerificationController extends GetxController {
  final emailController = Get.find<EnterEmailController>();

  TextEditingController textEditingController = TextEditingController();
  Rx<LoadingState> loadingState = LoadingState.Loading.obs;
  Rx<UserData> otpStatus = UserData().obs;
  Rx<UserData?> userData = UserData().obs;

  RxString emailError = ''.obs;
  Rx<bool> isButtonEnabled = true.obs;
  RxString otp = ''.obs;
  var errorMessage = ''.obs;

  Future continueTapped(String email) async {
    Get.to(() => CreatePasswordScreen());
    return;
  }

  otpVerify() async {
    try {
      isButtonEnabled.value = false;
      if (textEditingController.text.isEmpty ||
          textEditingController.text.length < 6) {
        errorMessage.value = 'Please enter a valid OTP';
      } else {
        UserData? result = await OnboardingService().userOtpVerify(
            emailController.emailTxtController.text,
            textEditingController.text);
        if (result != null) {
          if (result.emailotp == textEditingController.text) {
            Get.offAll(() => CreatePasswordScreen());
          } else {
            errorMessage.value = 'Wrong OTP, please enter the correct OTP';
          }
        } else {
          errorMessage.value = 'Verification failed, please try again';
        }
      }
    } catch (e) {
      errorMessage.value = 'An error occurred, please try again';
    } finally {
      isButtonEnabled.value = true;
    }
  }

  resendOtp() async {
    UserData? result = await OnboardingService()
        .userRegistration(emailController.emailTxtController.text);
    if(result != null) {
      _showOtpResendDialog();
    }
  }

  void _showOtpResendDialog() {
    Get.defaultDialog(
      title: "OTP Resent",
      titleStyle: GetAppFont.getInstance().addStyle(
          name: AppFont.Recoleta,
          fs: 32,
          fontType: AppFont.Bold,
          color: Colors.black),
      middleText: "Resend OTP sent successfully. Please check your email.",
      middleTextStyle: GetAppFont.getInstance().addStyle(
          name: AppFont.Recoleta,
          fs: 14,
          fontType: AppFont.Bold,
          color: Colors.black),

      textCancel: "OK",
      onCancel: () {
        // Close the dialog
      },
      barrierDismissible:
          false, // Ensure the dialog is not dismissible by tapping outside
    );
  }
}
