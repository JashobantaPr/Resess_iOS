import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recess/Auth/welcome_back_screen.dart';

import 'package:recess/core/cache.service.dart';
import 'package:recess/service/onboarding.service.dart';

class ForgotCreatePasswordController extends GetxController {
  final CacheService _cacheService = CacheService();
  TextEditingController txtPwdController = TextEditingController();
  RxBool isObscure = true.obs;

  var validationMessage = ''.obs;

  void setValidationMessage(String message) {
    validationMessage.value = message;
  }

  void clearValidationMessage() {
    validationMessage.value = '';
  }

  var isCreatePassword = true.obs;

  void validateEmail() {
    isCreatePassword.value = GetUtils.isEmail(txtPwdController.text.trim());
  }

  var errorMessage = ''.obs;

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  UserCreatePassword() async {
    if (txtPwdController.text.isEmpty) {
      errorMessage.value = "Please Enter Password";
    } else {
      bool? result = await OnboardingService()
          .forgetuserCreatePassword(txtPwdController.text);
      if (result == true) {
        String? userName = await _cacheService.getUserName();
        Get.offAll(() => WelcomeBackScreen(userName: userName));
      }
    }
  }
}
