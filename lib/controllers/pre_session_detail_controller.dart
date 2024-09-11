import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PreSessionDetailController extends GetxController {

  List<ExperienceLevel> expLevel = [
    ExperienceLevel("Beginner", RxBool(false)),
    ExperienceLevel("Intermediate", RxBool(false)),
    ExperienceLevel("Advanced", RxBool(false)),
    // LanguageModel("తెలుగు", false,"hi"),
    // LanguageModel("தமிழ்", false,"hi"),
  ];
  RxInt currentTab = 0.obs;

  void goToTab(int page) {
    currentTab.value = page;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

class ExperienceLevel {
  String title = '';
  RxBool isSelected;
  ExperienceLevel(this.title,this.isSelected);
}