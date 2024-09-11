import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:recess/Utility/get_prefs.dart';
import 'package:recess/core/cache.service.dart';
import 'package:recess/core/url.dart';
import 'package:recess/network_services/app_consts.dart';
import 'package:recess/service/expert_profile_service.dart';
import '../../models/view_expert_profile_model.dart';

class ViewExpertProfileController extends GetxController {
  RxBool addLangEnabled = false.obs;
  RxBool changeSubEnabled = false.obs;
  RxList<String> langArr = <String>[].obs;
  RxList<PlatformFile> docArr = <PlatformFile>[].obs;
  Rx<XFile> userImage = XFile('').obs;
  RxBool showPickerOptions = false.obs;
  RxList<String> selectedSubject = <String>[].obs;
  RxBool isValidUrl = true.obs;
  RxBool loadingState = false.obs;
  Rx<ExpertProfileResponse> expertProfile = ExpertProfileResponse().obs;

  var languagesList = <LanguageData>[].obs;
  var subjectsList = <SubjectData>[].obs;
  var selectedLanguages = <String, List<String>>{}.obs;
  var selectedlanguage = ''.obs;
  var searchText = ''.obs;
  var selectedLanguageId = Rx<String?>(null);
  var filteredSubjectsList = <SubjectData>[].obs;
  var searchQuery = ''.obs; // Holds the current search query
  var selectedSubjects = <String>{}.obs; // Set of selected subject IDs
  String? preferredSessionType;
  String? area;
  String? socialmedialinks;

  TextEditingController bioTxtController = TextEditingController();
  TextEditingController priceTxtController = TextEditingController();
  TextEditingController linkTxtController = TextEditingController();
  TextEditingController nameTxtController = TextEditingController();
  TextEditingController oneLineBioTxtController = TextEditingController();

  void validateUrl(String link) {
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
  }

  // From Gallery
  Future<void> getFromGallery() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    print('image${image?.path}');
    if (image == null) return;
    userImage.value = image;
  }

  // Through Camera
  Future<void> getFromCamera() async {
    final XFile? image = await ImagePicker().pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);
    if (image == null) return;
    userImage.value = image;
  }

  // get allExpertProfile
  Future<void> getExpertProfile() async {
    String? userId = await CacheService().getUserId();
    String? authToken = await CacheService().getAuthToken();
    print('userIduserIduserIduserId: $userId');
    loadingState.value = true;
    try {
      var headers = {
        'Content-Type': 'application/json',
        "Authorization": 'Bearer $authToken'
      };
      var request = http.Request('POST', Uri.parse(Url.getpxpertprofile));
      request.body = json.encode({
        "user_id": userId,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        print("Responsebdy: $responseBody");
        expertProfile.value =
            ExpertProfileResponse.fromJson(jsonDecode(responseBody));
        preferredSessionType =
            expertProfile.value.data!.profile!.preferredSessionType;
        area = expertProfile.value.data!.profile!.area;
        if (expertProfile.value.data?.profile == null) {
          print("No expert profile found in the response");
          GetPrefs.setBool(AppConst.isExpert, false);
          return;
        }
        print("Expert profile found, updating UI...");
        if (expertProfile.value.data != null &&
            expertProfile.value.data!.profile != null &&
            expertProfile.value.data!.profile!.languages != null) {
          // Split the languages string by comma and trim each language
          List<String> languages = expertProfile.value.data!.profile!.languages!
              .split(',')
              .map((lang) => lang.trim())
              .toList();
          langArr.addAll(languages);
        }

        if (expertProfile.value.data != null &&
            expertProfile.value.data!.profile != null &&
            expertProfile.value.data!.profile!.mySubject != null) {
          selectedSubject.addAll(expertProfile.value.data!.profile!.mySubject!);
        }

        if (expertProfile.value.data != null &&
            expertProfile.value.data!.profile != null &&
            expertProfile.value.data!.profile!.attachmentIDProof != null) {
          docArr.clear(); // Clear the existing list before adding new files
          for (String fileName
              in expertProfile.value.data!.profile!.attachmentIDProof!) {
            PlatformFile file = PlatformFile(
              name: fileName,
              size: 0,
              path: '${Url.imageUrl}$fileName',
            );
            docArr.add(file);
          }
        }
        userImage.refresh();
        setupUI();
      } else {
        print("Failed to fetch profile: ${response.reasonPhrase}");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      loadingState.value = false;
    }
  }

  // get allLanguages
  Future<void> getAllLanguage() async {
    debugPrint('hhhhhhhhhhhhhh${languagesList.value}');

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

  Future<void> updateExpertProfile() async {
    String? userId = await CacheService().getUserId();
    Map<String, dynamic> mapData = {
      "user_id": userId,
    };

    // Add fields conditionally based on comparison
    if (expertProfile.value.data?.profile!.name != nameTxtController.text) {
      mapData["name"] = nameTxtController.text;
    }
    if (expertProfile.value.data?.profile!.bio != bioTxtController.text) {
      mapData["bio"] = bioTxtController.text;
    }
    if (langArr.value.isNotEmpty) {
      mapData["languages"] = selectedlanguage.value;
    }
    if (expertProfile.value.data?.profile!.yourOneLiner !=
        oneLineBioTxtController.text) {
      mapData["yourOneLiner"] = oneLineBioTxtController.text;
    }
    if (expertProfile.value.data?.profile!.linkToYourBio !=
        linkTxtController.text) {
      mapData["linkToYourBio"] = linkTxtController.text;
    }
    mapData["preferredSessionType"] = preferredSessionType;
    mapData["socialMediaLinks"] = socialmedialinks;
    mapData["area"] = area;

    if (userImage.value.path.isNotEmpty) {
      mapData["image"] = userImage.value.path;
    }

    // Add documents if they exist
    if (docArr.value.isNotEmpty) {
      mapData["attachmentIDProof"] =
          docArr.value.map((doc) => doc.path).toList();
    }

    debugPrint('Prepared Data: $mapData');

    try {
      Map<String, dynamic>? updateExpert =
          await ExpertProfileService().updateExpertProfile(mapData);

      if (updateExpert != null && updateExpert['Status'] == true) {
        getExpertProfile();
        debugPrint('Profile updated successfully.');
        Get.snackbar(
          'Success',
          updateExpert["message"] ?? 'Profile updated successfully.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.back(); // Close the current screen
        Future.delayed(Duration(seconds: 1), () {
          Get.back();
        });
      } else {
        debugPrint('Failed to update profile: ${updateExpert?["message"]}');
        Get.snackbar(
          'Error',
          updateExpert?["message"] ?? 'Failed to update profile.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      debugPrint('An error occurred: $e');
      Get.snackbar(
        'Error',
        'An unexpected error occurred.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onInit() {
    getAllLanguage();
    getAllSubjects();
    getExpertProfile();
    super.onInit();
  }

  void setupUI() {
    final profile = expertProfile.value.data?.profile;
    if (profile != null) {
      nameTxtController.text = profile.name ?? "";
      oneLineBioTxtController.text = profile.yourOneLiner ?? "";
      bioTxtController.text = profile.bio ?? "";
      linkTxtController.text = profile.linkToYourBio ?? "";
    }
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

  // Toggle selection logic for a language
  void toggleLanguageSelection(String id, List<String> languages) {
    selectedlanguage.value = languages[0];
    if (selectedLanguages.containsKey(id)) {
      selectedLanguages.remove(id);
    } else {
      selectedLanguages[id] = languages;
    }

    print("Selected Language: ${languages[0]}");
  }

  // Method to update the search query
  void searchLanguages(String query) {
    searchText.value = query;
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
}
