import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Dashboard/expert/other_profile_view/other_profile_screen.dart';

import 'package:recess/core/cache.service.dart';
import 'package:recess/service/home_screen.service.dart';

import '../Dashboard/home/book_session_screen.dart';
import '../app_constants/app_colors.dart';
import '../models/home_screen_model/approve_expert_profiles.model.dart';
import '../models/home_screen_model/booking_session.dart';
import '../models/home_screen_model/category_model.dart';
import '../models/home_screen_model/sub_category_model.dart';
import '../models/settings_model/getmysubject_model.dart';

enum typeOfSession { chat, call, video }

enum typeViewSession { Chat, Call, Video }

class HomeController extends GetxController {
  final String subject = Get.arguments as String? ?? "";

  final CacheService _cacheSerivce = CacheService();

  Rx<typeOfSession> viewType = typeOfSession.chat.obs;
  Rx<typeViewSession> typeView = typeViewSession.Chat.obs;

  changeTypeViewSession(typeViewSession type) {
    typeView.value = type;
    filterProfilesBySessionType();
  }

  changetypeOfSession(typeOfSession type) {
    viewType.value = type;
  }

  void updateSessionTypeFromApi(String sessionType) {
    if (sessionType == 'chat') {
      changetypeOfSession(typeOfSession.chat);
    } else if (sessionType == 'call') {
      changetypeOfSession(typeOfSession.call);
    } else if (sessionType == 'video') {
      changetypeOfSession(typeOfSession.video);
    }
  }

  final TextEditingController messageController = TextEditingController();
  var selectedIndices = <int>{}.obs;
  Rx<ApprovedExpertProfileModel> otherProfile =
      ApprovedExpertProfileModel().obs;
  RxList<ApprovedExpertProfileModel> profiles =
      <ApprovedExpertProfileModel>[].obs;

  final options = ['Beginner', 'Intermediate', 'Expert'];
  var selectedOption = "Beginner".obs; // Variable to hold the selected option

  bool isOptionSelected(String option) {
    return selectedOption.value == option;
  }

  void selectOption(String option) {
    selectedOption.value = option;
  }

  RxList<ApprovedExpertProfileModel> filteredProfiles =
      <ApprovedExpertProfileModel>[].obs;

  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  Rx<BookingModel?> bookingFlow = BookingModel().obs;

  // RxList<MySubjectResponse> mySubjectlist = <MySubjectResponse>[].obs;
  RxList<UserData> mySubjectlist = <UserData>[].obs;

  Rx<String?> selectedName = Rx<String?>(null);
  Rx<String?> selectedImage = Rx<String?>(null);
  final selectedSubject = Rx<List<String>>([]);

  late PageController pageController;
  var currentTab = 0.obs;
  late PageController pagesTabController;
  var currentTabs = 0.obs;
  var isLoading = false.obs;
  var isBookmarked = false.obs;
  var bookmarkedSubjects = <String, bool>{}.obs;

  RxList<bool> isExpertBookmarkedList = <bool>[].obs;
  RxList<bool> isExpertBookmarkedListuser = <bool>[].obs;

  var addSubject = ''.obs;

  var isSelected = "".obs;

  final userId = Rx<String?>(null);

  var sortBy = "featured".obs;

  RxBool searchActive = false.obs;

  final CacheService _cacheService = CacheService();

  var selectedCategory = Rx<String?>("All");

  void filterProfilesBySessionType() {
    filteredProfiles.value = profiles.where((profile) {
      return profile.preferredSessionType!.contains(
          typeView.value.name); // Assuming profile has a 'type' property
    }).toList();
    print("jjjjjj-----${filteredProfiles.value}");
  }

  void onChangeNameAndImage(String? name, String? image) {
    selectedName.value = name;
    selectedImage.value = image;
  }

  void selectCategory(String? value) {
    selectedCategory.value = value;
  }

  void onChange(String? id) {
    userId.value = id;
  }

  void toggleSelection(String? value) {
    if (value != null) {
      sortBy.value = value;
      applyFilter();
    }
  }

  final selectedSubCategory = Rx<String?>(null);

  void subcategorySelector(String? subject) {
    selectedSubCategory.value =
        subject ?? ""; // Update the selected subcategory
  }

  isSubjectSelected(String? subject) {
    return selectedSubCategory.value == subject;
  }

  bool isSubjectBookmarked(String subjectId) {
    return bookmarkedSubjects[subjectId] ?? false;
  }

  void goToTab(int page) {
    if (page == 3) {
      searchActive.value = true;
      pageController.jumpToPage(3);
    } else {
      searchActive.value = false;
      currentTab.value = page;
      pageController.jumpToPage(currentTab.value);
    }
  }

  void goToTabs(int page) {
    if (page == 3) {
      searchActive.value = true;
      pagesTabController.jumpToPage(3);
    } else {
      searchActive.value = false;
      currentTabs.value = page;
      pagesTabController.jumpToPage(currentTab.value);
    }
  }

  var addsubject = ''.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
    pagesTabController = PageController(initialPage: 0);

    init();
  }

  init() {
    getProfiles();
    getCategory();
    cacheData();
  }

  cacheData() async {
    String? _id = await _cacheSerivce.getUserId();
    userId.value = _id;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  getProfiles() async {
    List<ApprovedExpertProfileModel>? result =
        await HomeService().getAllApprovedExpertProfile();

    if (result != null) {
      profiles.value = result;

      // print('result${result}');
      filteredProfiles.value = result;
      initializeBookmarkList(result.length ?? 0);
      for (int i = 0; i < (result.length ?? 0); i++) {
        isExpertBookmarkedList[i] = result?[i].isBookmarked ?? false;
      }
    }
  }

  void initializeBookmarkList(int length) {
    isExpertBookmarkedList.clear();
    isExpertBookmarkedList.addAll(List<bool>.filled(length, false));
  }

  void initializeBookmarkListUser(int length) {
    isExpertBookmarkedListuser.clear();
    isExpertBookmarkedListuser.addAll(List<bool>.filled(length, false));
  }

  List<CategoryModel> formatCategory(
      List<CategoryModel> categories, List<SubCategoryModel> subCategories) {
    try {
      if (categories.isEmpty) return categories;
      if (subCategories.isEmpty) return categories;

      for (var category in categories) {
        category.subCategories = [];
        for (var subCategory in subCategories) {
          if (subCategory.categoryId == category.sId) {
            category.subCategories!.add(subCategory);
          }
        }
      }
      return categories;
    } catch (e) {
      return [];
    }
  }

  getCategory() async {
    List<CategoryModel> categoryList =
        await HomeService().getCategoryList() ?? [];

    List<SubCategoryModel> subCategoryList =
        await HomeService().getSubcategoryList() ?? [];

    categories.value = formatCategory(categoryList, subCategoryList);

    CategoryModel all = CategoryModel()..categoryText = "All";

    categories.insert(0, all);
  }

  final List<Color> colors = [
    AppColors.pink,
    AppColors.white,
    AppColors.green,
    AppColors.sandle,
  ];

  Color getRandomColor() {
    final random = Random();
    return colors[random.nextInt(colors.length)];
  }

  void toggleMutiSelection(int index) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index);
    } else {
      selectedIndices.add(index);
    }
  }

  void toggleCategorySelection(int index) {
    var category = categories[index];
    if (category.isSelected != null) {
      category.isSelected = !category.isSelected!;
    } else {
      // Handle the case where isSelected is null if needed
      category.isSelected = true; // Or some default value
    }
    update();
  }

// Sort by name A-Z
  List<ApprovedExpertProfileModel> sortByNameAZ(
      List<ApprovedExpertProfileModel> users) {
    final sortedList = List<ApprovedExpertProfileModel>.from(users);
    sortedList.sort((a, b) => (a.name ?? '').compareTo(b.name ?? ''));
    return sortedList;
  }

// Sort by name Z-A
  List<ApprovedExpertProfileModel> sortByNameZA(
      List<ApprovedExpertProfileModel> users) {
    final sortedList = List<ApprovedExpertProfileModel>.from(users);
    sortedList.sort((a, b) => (b.name ?? '').compareTo(a.name ?? ''));
    return sortedList;
  }

// Sort by amount ascending
  List<ApprovedExpertProfileModel> sortByAmountLowToHigh(
      List<ApprovedExpertProfileModel> users) {
    final sortedList = List<ApprovedExpertProfileModel>.from(users);
    sortedList.sort((a, b) => (a.amount ?? "").compareTo(b.amount ?? ""));
    return sortedList;
  }

// Sort by amount descending
  List<ApprovedExpertProfileModel> sortByAmountHighToLow(
      List<ApprovedExpertProfileModel> users) {
    final sortedList = List<ApprovedExpertProfileModel>.from(users);
    sortedList.sort((a, b) => (b.amount ?? "").compareTo(a.amount ?? ""));
    return sortedList;
  }

  void applyFilter() {
    List<ApprovedExpertProfileModel> list = [];

    //Filter by Category

    //Filetr by Subject

    //Sorting
    switch (sortBy.value) {
      case "atoz":
        list = sortByNameAZ(filteredProfiles);
        break;
      case "ztoa":
        list = sortByNameZA(filteredProfiles);
        break;
      case "highToLow":
        list = sortByAmountHighToLow(filteredProfiles);
        break;
      case "lowToHigh":
        list = sortByAmountLowToHigh(filteredProfiles);
        break;
      case "featured":
        list.assignAll(filteredProfiles);
        break;
      default:
        list.assignAll(filteredProfiles);
    }

    // Update the Rx variable with the sorted or filtered list
    filteredProfiles.value = list;
  }

  var showNoDataMessage = false.obs;

  Future<void> resetSubjectFilter() async {
    if (selectedSubCategory.value?.isNotEmpty ?? false) {
      List<ApprovedExpertProfileModel>? data =
          await HomeService().subCategoryFilter(selectedSubCategory.value);

      if (data == null || data.isEmpty) {
        filteredProfiles.value = [];
        // Set a flag or state to show "No Data" message
        showNoDataMessage.value =
            true; // Assume showNoDataMessage is an observable variable
      } else {
        filteredProfiles.value = data;
        showNoDataMessage.value =
            false; // Hide "No Data" message if data is available
      }
    }
  }

  Future<void> categoryFilter(String? category) async {
    selectCategory(category);

    if (category == "All") {
      filteredProfiles.value = profiles.value;
      showNoDataMessage.value =
          filteredProfiles.isEmpty; // Show No Data if empty
    } else {
      List<ApprovedExpertProfileModel>? data =
          await HomeService().categoryFilter(category);

      if (data == null || data.isEmpty) {
        filteredProfiles.value = [];
        showNoDataMessage.value = true; // Show No Data message
      } else {
        filteredProfiles.value = data;
        showNoDataMessage.value = false; // Hide No Data message
      }
    }
  }

  Future<void> otherProfiledata(String? expertId) async {
    try {
      String? userId = await _cacheSerivce.getUserId();

      if (userId == null) {
        Get.to(LoginOptionsScreen());
        return;
      }

      ApprovedExpertProfileModel? data =
          await HomeService().otherProfile(expertId);

      if (data != null) {
        otherProfile.value = data;
        Get.to(OtherProfilePage());
      }
    } catch (e) {
      print('Error fetching profile data: $e');
    }
  }

  bookingData() async {
    try {
      BookingModel? data =
          await HomeService().bookingSession(otherProfile.value.userId);
      if (data != null) {
        bookingFlow?.value = data;
        Get.to(BookSessionScreen());
      }
    } catch (e) {
      print("ggggg----${e}");
      return null;
    }
  }

  Color getColor(String product) {
    switch (product) {
      case 'Technology':
        return AppColors.pink;
      case 'Business':
        return AppColors.lightblue;
      case 'Creativity':
        return AppColors.lightGreen;
      case 'Health':
        return AppColors.bluelight;
      case 'Lifestyle':
        return AppColors.lightred;
      case 'Emerging Technology':
        return AppColors.darkPink;
      case 'Culture':
        return AppColors.lightBulelight;
      case "Self-Development":
        return AppColors.lightOrange;
      default:
        return AppColors.white;
    }
  }

// bookMarkForSubject
  // Future<void> addbookMarkForSubject(String value) async {
  //   print('gggggggggggggggg$value');
  //   String? userId = await CacheService().getUserId();
  //   Map<String, dynamic> mapdata = {"user_id": userId, "mySubject": value};
  //   print('the mapdata is:$userId');
  //   Map<String, dynamic>? response =
  //       await HomeService().addbookMarkForSubject(mapdata);

  //   if (response != null && response["Status"] == true) {
  //     print('API call successful: ${response["message"]}');
  //     isBookmarked.value = !isBookmarked.value;
  //   } else {
  //     String message =
  //         response?["message"] ?? "Failed to update privacy settings";
  //     print('API call failed: $message');
  //     isBookmarked.value = false; // Reset bookmark status on failure
  //   }
  // }
  Future<void> addbookMarkForSubject(String subjectId) async {
    print('Processing bookmark for subject: $subjectId');
    String? userId = await CacheService().getUserId();
    Map<String, dynamic> mapdata = {"user_id": userId, "mySubject": subjectId};

    print('Request data: $mapdata');

    Map<String, dynamic>? response =
        await HomeService().addbookMarkForSubject(mapdata);

    if (response != null && response["Status"] == true) {
      print('API call successful: ${response["message"]}');

      // Update the bookmark status based on API response
      bool isBookmarked = response["data"]["isSubjectBookedMark"];
      bookmarkedSubjects[subjectId] = isBookmarked;
    } else {
      String message =
          response?["message"] ?? "Failed to update bookmark status";
      print('API call failed: $message');
      bookmarkedSubjects[subjectId] = false; // Reset bookmark status on failure
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

    try {
      Map<String, dynamic>? response =
          await HomeService().bookMarkForUser(mapdata);

      debugPrint('responseresponseresponse$response');

      if (response != null && response.isNotEmpty) {
        if (response["Status"] == true) {
          isExpertBookmarkedList[position] = !isExpertBookmarkedList[position];
          // isExpertBookmarkedListuser[position] =
          //     !isExpertBookmarkedListuser[position];

          // Remove the item from the list
          // filteredProfiles.value.removeAt(position);
          // isExpertBookmarkedList.removeAt(position);

          // Update the UI immediately
          filteredProfiles.refresh();
          isExpertBookmarkedList.refresh();
          // isExpertBookmarkedListuser.refresh();

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

  // bookMarkForSubjectUser
  Future<void> bookMarkForSubjectUser(
    String? expertUserId,
    int position,
  ) async {
    String? userId = await CacheService().getUserId();

    Map<String, dynamic> mapdata = {
      "user_id": userId,
      "expert_id": expertUserId
    };

    try {
      Map<String, dynamic>? response =
          await HomeService().bookMarkForUser(mapdata);

      debugPrint('responseresponseresponse$response');

      if (response != null && response.isNotEmpty) {
        if (response["Status"] == true) {
          isExpertBookmarkedListuser[position] =
              !isExpertBookmarkedListuser[position];

          // Update the UI immediately
          filteredProfiles.refresh();
          isExpertBookmarkedListuser.refresh();
          print('API bookMarkForUser successful: ${response["message"]}');
        } else {
          String message =
              response?["message"] ?? "Failed to update privacy settings";
          print('API call failed: $message');
          isExpertBookmarkedListuser[position] = false;
        }
      } else {
        print('API call failed:');
        isExpertBookmarkedListuser[position] = false;
      }
    } catch (e) {
      isLoading.value = false;
      print('An error occurred: $e');
      isExpertBookmarkedListuser[position] = false;
    }
  }

// getMySubject
  Future<void> getMySubject(String receivedSubject) async {
    String? userId = await CacheService().getUserId();

    Map<String, dynamic> mapdata = {
      "user_id": userId,
      "mySubject": receivedSubject
    };
    isLoading.value = true;
    try {
      // Fetch the data from the API
      MySubjectResponse? response = await HomeService().getMySubject(mapdata);
      print('API Response: $response');

      if (response != null && response.status == true) {
        print('API call successful: ${response.message}');
        // Assuming response.data contains a list of subjects
        mySubjectlist.value = response.data ?? []; // Update the RxList

        bookmarkedSubjects[receivedSubject] = response.isSubjectBookedMark!;
        initializeBookmarkListUser(response.data?.length ?? 0);
        for (int i = 0; i < (response.data?.length ?? 0); i++) {
          isExpertBookmarkedListuser[i] =
              response.data?[i].isBookedMark ?? false;
        }
        print('sowjanya${response.isSubjectBookedMark}');
      } else {
        String message = response?.message ?? "Failed to fetch subjects";
        print('API call failed: $message');
        mySubjectlist.clear(); // Clear the list if the API call fails
      }
    } catch (e) {
      print('Error fetching subjects: $e');
      mySubjectlist.clear(); // Clear the list if an error occurs
    } finally {
      isLoading.value = false;
    }
  }

  void onOptionSelected(String option) {
    switch (option) {
      case 'Call':
        print('Call selected');
        break;
      case 'Chat':
        print('Chat selected');
        break;
      case 'Video':
        print('Video selected');
        break;
      default:
        print('Unknown option selected');
    }
  }
}
