import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:recess/controllers/auth/forgot_email_controller.dart';
import 'package:recess/service/onboarding.service.dart';

import '../../Auth/forgot_create_password_screen.dart';
import '../../Auth/login_options_screen.dart';
import '../../models/onboarding_model/forget_password_model.dart';

class ForgetEmailVerificationController extends GetxController {
  final forgetEmailController = Get.find<ForgotEmailController>();
  Rx<forgetData?> userData = forgetData().obs;

  var errorMessage = ''.obs;
  Rx<bool> isButtonEnabled = true.obs;
  final TextEditingController textEditingController = TextEditingController();

  forgetEmailOtp() async {
    try {
      if (textEditingController.text.isEmpty ||
          textEditingController.text.length < 6) {
        errorMessage.value = 'Please enter a valid OTP';
      } else {
        bool? result = await OnboardingService().userForgetOtpVerify(
            forgetEmailController.forgotEmailController.text,
            textEditingController.text);
        if (result == true) {
          Get.offAll(() => ForgotCreatePasswordScreen());
        } else {
          errorMessage.value = 'Please enter the correct OTP';
        }
      }
    } catch (e) {
      errorMessage.value = 'An error occurred. Please try again.';
    }
  }

  resendOtp() async {
    forgetData? result = await OnboardingService()
        .forgetEmail(forgetEmailController.forgotEmailController.text);
    if (result != null) {
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
