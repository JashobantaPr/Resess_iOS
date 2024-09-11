import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:recess/service/onboarding.service.dart';

import '../../Auth/enter_email_screen.dart';
import '../../Auth/welcome_screen.dart';

import 'create_password_controller.dart';

class CompleteOnboardController extends GetxController {
  final passwordController = Get.find<CreatePasswordController>();
  Rx<LoadingState> loadingState = LoadingState.Loading.obs;

  var errorMessage = ''.obs;

  TextEditingController txtController = TextEditingController();

  Future continueTapped() async {
    Get.to(() => WelcomeScreen(userName: ""));
    return;
    //  Call email signup api
  }

  UserCreatePassword() async {
    if (txtController.text.isEmpty) {
      errorMessage.value = "Please Enter Name";
    } else {
      bool? result = await OnboardingService().userCreatePassword(
          passwordController.txtPwdController.text, txtController.text);
      if (result == true) {
        Get.offAll(() => WelcomeScreen(userName: txtController.text));
      }
    }
  }
}
