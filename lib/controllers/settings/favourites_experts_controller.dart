import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recess/core/cache.service.dart';
import 'package:recess/service/home_screen.service.dart';
import 'package:recess/service/subjects_bookmark_service.dart';
import '../../models/subjects_bookmark_model.dart';

class FavouritesSubjectController extends GetxController {
  late PageController pageController;
  RxInt currentTab = 0.obs;
  RxBool searchActive = false.obs;
  var isLoading = false.obs;
  var bookmarkSubjectResponse = Rxn<BookMarkSubjectResponse>();
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

// getBookMarkSubjectById
  Future<void> getBookMarkSubjectById() async {
    print('Fetching bookmark subjects');
    String? userId = await CacheService().getUserId();
    print('UserId: $userId');
    var requestPayload = {
      "user_id": userId ?? '',
    };

    isLoading.value = true;
    print('sowjanya');
    var response =
        await BookMarkSubjectService().getBookMarkSubjectById(requestPayload);
    isLoading.value = false;
    if (response != null) {
      bookmarkSubjectResponse.value = response;
      print('Response data: ${response.data?.bookmarks}');

      bookmarkSubjectResponse.value = response;
      initializeBookmarkList(response.data?.bookmarks?.length ?? 0);
      for (int i = 0; i < (response.data?.bookmarks?.length ?? 0); i++) {
        isExpertBookmarkedList[i] =
            response.data?.bookmarks?[i].isSubjectBookedMark ?? false;
      }
    } else {
      String message =
          response?.message ?? "Failed to fetch bookmarks of subjects";
      print('Error: $message');
    }
  }

// bookMarkForSubject
  // Future<void> addbookMarkForSubject(String value, int position) async {
  //   String? userId = await CacheService().getUserId();
  //   Map<String, dynamic> mapdata = {"user_id": userId, "mySubject": value};
  //   Map<String, dynamic>? response =
  //       await HomeService().addbookMarkForSubject(mapdata);
  //   if (response != null && response["Status"] == true) {
  //     print('API call successful: ${response["message"]}');
  //     isExpertBookmarkedList[position] = !isExpertBookmarkedList[position];
  //     update(); // Update the UI
  //   } else {
  //     String message =
  //         response?["message"] ?? "Failed to update privacy settings";
  //     print('API call failed: $message');
  //     isExpertBookmarkedList[position] = false;
  //   }
  // }

  Future<void> addbookMarkForSubject(String value, int position) async {
    String? userId = await CacheService().getUserId();
    Map<String, dynamic> mapdata = {"user_id": userId, "mySubject": value};
    Map<String, dynamic>? response =
        await HomeService().addbookMarkForSubject(mapdata);

    if (response != null && response["Status"] == true) {
      print('API call successful: ${response["message"]}');

      // Remove the item from the list
      bookmarkSubjectResponse.value?.data?.bookmarks?.removeAt(position);
      isExpertBookmarkedList.removeAt(position);

      // Update the UI immediately
      bookmarkSubjectResponse.refresh();
      isExpertBookmarkedList.refresh();
      update();
    } else {
      String message =
          response?["message"] ?? "Failed to update privacy settings";
      print('API call failed: $message');
    }
  }

  @override
  void onInit() {
    getBookMarkSubjectById();
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
