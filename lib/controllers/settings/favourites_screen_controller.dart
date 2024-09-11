import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FavouritesSubjectsController extends GetxController {
  var currentTab = 0.obs;
  PageController pageController = PageController(initialPage: 0);

  @override
  void onInit() {
    super.onInit();
    // Ensure the initial tab is always set to "Experts"
    // when navigating to the screen
    currentTab.value = 0;
    pageController = PageController(initialPage: 0);
    goToTab(0);
  }

  void goToTab(int index) {
    currentTab.value = index;
    pageController.jumpToPage(index);
  }
}
