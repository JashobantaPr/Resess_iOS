import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recess/core/api_client.dart';
import 'package:recess/core/url.dart';
import 'package:recess/service/settings_service.dart';

import '../../models/settings_model/terms&conditions_model.dart';

class TermsandConditionsController extends GetxController {
  TextEditingController bioTxtController = TextEditingController();
  RxBool loadingState = false.obs;
  RxList<Term> termsList = <Term>[].obs;

  Future<void> getAllTerms() async {
    loadingState.value = true;
    try {
      final response = await SettingsService().getAlltermsandPrivacy(Url.termsandconditions, {});
      if (response["Status"] == true) {
        TermsAndConditionsResponse termsResponse =
            TermsAndConditionsResponse.fromJson(response);
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
    getAllTerms();
    super.onInit();
  }
}
