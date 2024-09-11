import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:recess/core/cache.service.dart';

import 'package:recess/service/onboarding.service.dart';

import '../../Auth/fotget_email_verification_screen.dart';
import '../../models/onboarding_model/forget_password_model.dart';

class ForgotEmailController extends GetxController {
  final CacheService _cacheService = CacheService();
  final TextEditingController forgotEmailController = TextEditingController();
  RxString emailError = ''.obs;

  Rx<bool> isButtonEnable = true.obs;

  Rx<forgetData> userData = forgetData().obs;

  //validatemeaagae
  var validationMessage = ''.obs;

  void setValidationMessage(String message) {
    validationMessage.value = message;
  }

  void clearValidationMessage() {
    validationMessage.value = '';
  }

  var isEmailValid = true.obs;

  Future<void> validateEmail() async {
    isEmailValid.value = GetUtils.isEmail(forgotEmailController.text.trim());
  }

  forgotEmailId() async {
    try {
      isButtonEnable.value = false;

      forgetData? result =
          await OnboardingService().forgetEmail(forgotEmailController.text);
      if (result != null) {
        userData.value = result;
        String? userId = userData.value.sId;
        _cacheService.setUserId(userId ?? "");
        String? token = userData.value.tokens?.accessToken;
        _cacheService.setAuthToken(token ?? "");
        if (userData.value.otpVerified == false) {
          Get.to(() => ForgetVerifyEmailScreen(
                email: forgotEmailController.text,
              ));
        }
        isButtonEnable.value = true;
      }
    } on HttpException catch (e) {
      setValidationMessage(e.message);
      isButtonEnable.value = true;
    } catch (e) {
      isButtonEnable.value = true;
    }
  }

  @override
  void onClose() {
    forgotEmailController.dispose();
    super.onClose();
  }
}
