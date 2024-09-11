import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import 'package:recess/Auth/enter_email_screen.dart';
import 'package:recess/Auth/enter_password_screen.dart';
import 'package:recess/Auth/verify_email_screen.dart';

import 'package:recess/core/cache.service.dart';

import 'package:recess/service/onboarding.service.dart';

import '../../models/onboarding_model/onboarding_model.dart';

class EnterEmailController extends GetxController {
  final CacheService _cacheService = CacheService();
  Rx<LoadingState> loadingState = LoadingState.Loaded.obs;
  Rx<bool> isButtonEnabled = true.obs;

  RxString emailError = ''.obs;

  TextEditingController emailTxtController = TextEditingController();
  Rx<UserData> userData = UserData().obs;

  Future continueTapped() async {
    Get.to(() => EnterPasswordScreen());
    return;
    //  Call email signup api
  }

  userRegistrationWithEmail() async {
    try {
      isButtonEnabled.value = false;
      UserData? result =
          await OnboardingService().userRegistration(emailTxtController.text);
      if (result != null) {
        userData.value = result;
        String? userId = userData.value.sId;
        _cacheService.setUserId(userId ?? "");
        String? token = userData.value.tokens?.accessToken;
        print('fjf $token');
        _cacheService.setAuthToken(token ?? "");

        Get.to(() => VerifyEmailScreen(
              email: emailTxtController.text,
            ));

        isButtonEnabled.value = true;
      }
    } on HttpException catch (e) {
      isButtonEnabled.value = true;

      if (e.message == "Email already registered") {
        Get.to(() => EnterPasswordScreen());
      }
    } catch (e) {
      isButtonEnabled.value = true;
      print(e);
    }
  }

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
    isEmailValid.value = GetUtils.isEmail(emailTxtController.text.trim());
  }

  @override
  void onInit() {
    super.onInit();

    emailTxtController.clear();
  }

  @override
  void onClose() {
    Get.delete();
    emailTxtController.dispose();
    super.onClose();
  }
}
