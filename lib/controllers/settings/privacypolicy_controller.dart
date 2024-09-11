import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recess/core/url.dart';
import 'package:recess/models/settings_model/privacypolicy_model.dart';
import 'package:recess/service/settings_service.dart';

class PrivacyPolicyController extends GetxController {
  TextEditingController bioTxtController = TextEditingController();
  RxBool loadingState = false.obs;
  RxList<Privacy> termsList = <Privacy>[].obs;

  Future<void> getAllPrivacy() async {
    loadingState.value = true;
    try {
      final response = await SettingsService().getAlltermsandPrivacy(Url.privacypolicy, {});
      if (response["Status"] == true) {
        PrivacyResponse termsResponse =
            PrivacyResponse.fromJson(response);
        print('TermsandPrivacyPolicy$termsResponse');
        if (termsResponse.data != null) {
          termsList.value = termsResponse.data!;
        } else {
          termsList.clear();
        }
      } else {
        Get.snackbar("Error", response["message"]);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      loadingState.value = false;
    }
  }

  @override
  void onInit() {
    getAllPrivacy();
    super.onInit();
  }
  }

 