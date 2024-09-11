import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:recess/controllers/auth/enter_email_controller.dart';
import 'package:recess/core/cache.service.dart';

import 'package:recess/service/onboarding.service.dart';

import '../../Auth/enter_email_screen.dart';
import '../../Auth/welcome_back_screen.dart';

class UserLoginController extends GetxController {
  UserLoginController();

  CacheService _cacheService = CacheService();

  final emailController = Get.find<EnterEmailController>();

  Rx<LoadingState> loadingState = LoadingState.Loaded.obs;

  RxString emailError = ''.obs;

  var passwordError = ''.obs; // Observable for error message

  TextEditingController pwdTxtController = TextEditingController();

  RxBool isObscure = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future continueTapped() async {}

  userLogin() async {
    try {
      bool? result = await OnboardingService().userLogin(
          emailController.emailTxtController.text, pwdTxtController.text);
      if (result == true) {
        String? userName = await _cacheService.getUserName();

        Get.offAll(() => WelcomeBackScreen(
              userName: userName,
            ));
      }
    } on HttpException catch (e) {
      passwordError.value = e.message; // Set error message
    } catch (e) {
      print(e);
    }
  }

  var validationMessage = ''.obs;

  void setValidationMessage(String message) {
    validationMessage.value = message;
  }

  void clearValidationMessage() {
    validationMessage.value = '';
  }

  var isEnterPassword = true.obs;
}
