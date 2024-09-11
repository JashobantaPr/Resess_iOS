import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recess/Dashboard/expert/onboard/become_expert_step2.dart';
import 'package:recess/Utility/get_prefs.dart';
import 'package:recess/core/cache.service.dart';

import 'package:recess/network_services/app_consts.dart';

import 'package:recess/service/expert_profile_service.dart';

import '../../service/become_an_expertprofile_service.dart';

enum typeOfSession { chat, call, video }

class BecomeExpertStep1Controller extends GetxController {
  var selected = <String>{}.obs;

  final CacheService _cacheService = CacheService();
  var languagesList = <LanguageData>[].obs;
  var subjectsList = <SubjectData>[].obs;
  var selectedLanguages = <String, List<String>>{}.obs;
  var selectedSessions =
      <String>[].obs; // RxList<String> for storing selected session names

  // var selectedSessions =
  //     <typeOfSession>{}.obs; // Set to store selected sessions

  final options = ['Call', 'Chat', 'Video'];

  void toggleSession(typeOfSession session) {
    String sessionString = session.toString();
    if (selectedSessions.contains(sessionString)) {
      selectedSessions.remove(sessionString); // Deselect if already selected
    } else {
      selectedSessions.add(sessionString); // Select if not selected
    }
  }

  var selectedlanguage = ''.obs;
  var searchText = ''.obs;
  var selectedLanguageId = Rx<String?>(null);
  var filteredSubjectsList = <SubjectData>[].obs;
  var searchQuery = ''.obs; // Holds the current search query
  var selectedSubjects = <String>{}.obs; // Set of selected subject IDs
  Rx<XFile> userImage = XFile('').obs;

  File? imageFile;

  Rx<typeOfSession> viewType = typeOfSession.chat.obs;

  changetypeOfSession(typeOfSession type) {
    viewType.value = type;
  }

  RxBool loadingState = false.obs;

  RxBool showPickerOptions = false.obs;

  RxBool isEditingSubject = false.obs;

  RxBool isEditingLanguage = false.obs;

  RxString selectedSubject = ''.obs;

  final selectedImagePath = Rx<String?>(null);
  final imagePath = Rx<String?>(null);

  // RxList selectedLanguages = [].obs;

  FocusNode nameFocus = FocusNode();

  RxBool isValidUrl = true.obs;

  TextEditingController subjectTxtController = TextEditingController();
  TextEditingController langTxtController = TextEditingController();
  TextEditingController nameTxtController = TextEditingController();
  TextEditingController oneLineBioTxtController = TextEditingController();
  TextEditingController bioTxtController = TextEditingController();
  TextEditingController priceTxtController = TextEditingController();
  TextEditingController linkTxtController = TextEditingController();

  RxInt currentTab = 0.obs;

  RxList<bool> selectedTabs = [true, false, false].obs;
  List<String> sessionTypeArr = [];
  // void goToTab(int page) {
  //   currentTab.value = page;
  // }

  validateUrl(String link) {
    if (link.isEmpty) {
      isValidUrl.value = true;
      return;
    }
    String pattern =
        r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';
    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(link)) {
      isValidUrl.value = false;
    } else {
      isValidUrl.value = true;
    }
    // regex  = pattern("((http|https)://)(www.)?[a-zA-Z0-9@:%._\\+~#?&//=]{2,256}\\.[a-z]{2,6}\\b([-a-zA-Z0-9@:%._\\+~#?&//=]*)");
    // final Uri? uri = Uri.tryParse(link);
    // if (!uri!.isAbsolute) {
    //   isValidUrl.value = false;
    // } else {
    //   isValidUrl.value = true;
    // }
  }

  void tappedContinue() {
    if (subjectTxtController.text.isEmpty ||
        langTxtController.text.isEmpty ||
        nameTxtController.text.isEmpty ||
        oneLineBioTxtController.text.isEmpty ||
        oneLineBioTxtController.text.isEmpty ||
        priceTxtController.text.isEmpty ||
        linkTxtController.text.isEmpty) {
      Get.snackbar(
          "Validation Error", "Please fill all the details to proceed");
      return;
    }
    GetPrefs.setString(AppConst.subject, subjectTxtController.text);
    GetPrefs.setString(AppConst.spokenLanguages, langTxtController.text);
    GetPrefs.setString(AppConst.oneLineBio, oneLineBioTxtController.text);
    GetPrefs.setString(AppConst.pricePerMinute, priceTxtController.text);
    GetPrefs.setString(AppConst.bio, bioTxtController.text);
    GetPrefs.setString(AppConst.bioLink, linkTxtController.text);
    GetPrefs.setString(AppConst.userName, nameTxtController.text);

    // final sessionArr =
    //     sessionTypeArr.reduce((value, element) => value + ',' + element);
    // GetPrefs.setString(AppConst.sessionTypes, sessionArr);
    Get.to(BecomeExpertStep2());
  }

  // get allLanguages
  Future<void> getAllLanguage() async {
    loadingState.value = true;
    try {
      final response = await ExpertProfileService().getAllLanguages();
      if (response != null && response["Status"] == true) {
        LanguagesResponse languagesResponse =
            LanguagesResponse.fromJson(response);
        if (languagesResponse.data != null) {
          languagesList.value = languagesResponse.data ?? [];
          debugPrint('vvvvvvvvvvvvvvvvvvvv${languagesList.value}');
        }
      } else {
        Get.snackbar("Error", response?["message"] ?? "Unknown error occurred");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      loadingState.value = false;
    }
  }

  // get allSubjects
  Future<void> getAllSubjects() async {
    loadingState.value = true;
    try {
      final response = await ExpertProfileService().getAllSubjects();
      if (response != null && response["Status"] == true) {
        SubjectsResponse subjectsResponse = SubjectsResponse.fromJson(response);
        if (subjectsResponse.data != null) {
          subjectsList.value = subjectsResponse.data!;
        } else {
          subjectsList.clear();
        }
      } else {
        Get.snackbar("Error", response?["message"] ?? "Unknown error occurred");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      loadingState.value = false;
    }
  }

  // Search subjects based on the query
  void searchSubjects(String query) {
    searchQuery.value = query;

    if (query.isNotEmpty) {
      filteredSubjectsList.value = subjectsList.where((subject) {
        return subject.subject?.toLowerCase().contains(query.toLowerCase()) ??
            false;
      }).toList();
    } else {
      filteredSubjectsList.value = subjectsList;
    }
  }

  // Toggle selection logic for a subject
  void toggleSubjectSelection(String id, String subjectName) {
    if (selectedSubjects.contains(id)) {
      selectedSubjects.remove(id);
    } else {
      selectedSubjects.add(id);
    }

    print("Selected Subject: $subjectName");
  }

  // Check if a subject is selected
  bool isSubjectSelected(String id) {
    return selectedSubjects.contains(id);
  }

  // Method to filter languages based on the search query
  List<LanguageData> get filteredLanguages {
    if (searchText.value.isEmpty) {
      return languagesList;
    }
    return languagesList
        .where((languageData) =>
            languageData.languages?.any((language) => language
                .toLowerCase()
                .contains(searchText.value.toLowerCase())) ??
            false)
        .toList();
  }

  void toggleLanguageSelection(String id, List<String> languages) {
    if (selectedLanguages.containsKey(id)) {
      selectedLanguages.remove(id);
    } else {
      selectedLanguages[id] = languages;
    }
    // Update the selected language display
    selectedlanguage.value = languages.first;
    langTxtController.text = languages.first;
    print("Selected Language: ${languages.first}");
  }

  // Method to update the search query
  void searchLanguages(String query) {
    searchText.value = query;
  }

  @override
  void onInit() {
    getAllLanguage();
    getAllSubjects();
    super.onInit();
  }

  void chooseImage({required ImageSource source}) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage == null) return;

    String? path = await BecomeAnExpertProfileService()
        .uploadImageOrDocuments(pickedImage.path);
    if (path != null) {
      selectedImagePath.value = pickedImage.path;
      imagePath.value = path;
    }
  }

  addExpertProfile() async {
    String? userId = await _cacheService.getUserId();
    Map<String, dynamic> body = {
      "user_id": userId,
      "name": nameTxtController.text,
      "area": subjectTxtController.text,
      "languages": langTxtController.text,
      "yourOneLiner": oneLineBioTxtController.text,
      "amount": priceTxtController.text,
      "bio": bioTxtController.text,
      "socialMediaLinks": linkTxtController.text,
      "preferredSessionType": viewType.value,
      "linkToYourBio": "rerrereerererer",
      "image": imagePath.value,
      "attachmentProof": [
        "attachmentIDProof_1721820378522.png",
        "attachmentIDProof_1721820378522.png"
      ],
      "attachmentIDProof": [
        "attachmentIDProof_1721820378522.png",
        "attachmentIDProof_1721820378522.png"
      ]
    };
  }
}
