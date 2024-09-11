import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recess/core/cache.service.dart';
import 'package:recess/service/home_screen.service.dart';
import 'package:recess/service/users_bookmark_service.dart';

import '../../models/settings_model/experts_bookmark_model.dart';

class FavouritesExpertController extends GetxController {
  late PageController pageController;
  RxInt currentTab = 0.obs;
  RxBool searchActive = false.obs;
  var isLoading = false.obs;
  var bookmarkedExperts = <BookmarkedExpert>[].obs;
  RxList<bool> isExpertBookmarkedList = <bool>[].obs;

  void goToTab(int page) {
    if (page == 2) {
      searchActive.value = true;
      pageController.jumpToPage(2);
    } else {
      searchActive.value = false;
      currentTab.value = page;
      pageController.jumpToPage(currentTab.value);
    }
  }

  void initializeBookmarkList(int length) {
    isExpertBookmarkedList.clear();
    isExpertBookmarkedList.addAll(List<bool>.filled(length, false));
  }

  Future<void> getBookmarkedUserById() async {
    String? userId = await CacheService().getUserId();
    var requestPayload = {
      "user_id": userId ?? '',
    };

    print('sdfghj$requestPayload');

    isLoading.value = true;
    var response =
        await BookMarkExpertService().getBookmarkedUserById(requestPayload);

    /// response.refresh();

    isLoading.value = false;
    if (response != null) {
      bookmarkedExperts.value = response;

      initializeBookmarkList(response.length ?? 0);
      for (int i = 0; i < (response.length ?? 0); i++) {
        isExpertBookmarkedList[i] = response[i].isBookmarked ?? false;
      }
      update();
      print('Bookmarked expert loaded successfully');
    } else {
      print('Failed to load bookmarked expert');
    }
  }

// bookMarkForUser
  Future<void> bookMarkForUser(
    String? expertUserId,
    int position,
  ) async {
    String? userId = await CacheService().getUserId();

    Map<String, dynamic> mapdata = {
      "user_id": userId,
      "expert_id": expertUserId
    };
    print('Usermapdata$mapdata');
    try {
      Map<String, dynamic>? response =
          await HomeService().bookMarkForUser(mapdata);

      debugPrint('responseresponseresponse$response');

      if (response != null && response.isNotEmpty) {
        if (response["Status"] == true) {
          isExpertBookmarkedList[position] = !isExpertBookmarkedList[position];
          // Remove the item from the list
          bookmarkedExperts.value.removeAt(position);
          isExpertBookmarkedList.removeAt(position);

          // Update the UI immediately
          bookmarkedExperts.refresh();
          isExpertBookmarkedList.refresh();
          print('API bookMarkForUser successful: ${response["message"]}');
        } else {
          String message =
              response?["message"] ?? "Failed to update privacy settings";
          print('API call failed: $message');
          isExpertBookmarkedList[position] = false;
        }
      } else {
        print('API call failed:');
        isExpertBookmarkedList[position] = false;
      }
    } catch (e) {
      isLoading.value = false;
      print('An error occurred: $e');
      isExpertBookmarkedList[position] = false;
    }
  }

  @override
  void onInit() {
    currentTab.value = 0;
    pageController = PageController(initialPage: 0);
    getBookmarkedUserById();
    isExpertBookmarkedList.addAll(List<bool>.filled(10, false));
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
