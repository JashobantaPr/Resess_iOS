import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:recess/core/cache.service.dart';
import 'package:recess/models/expertSettingModule.dart';

import '../../Utility/get_prefs.dart';
import '../../network_services/app_consts.dart';
import 'package:http/http.dart' as http;

class ExpertSettingController extends GetxController {
  RxBool isSwitched = false.obs;
  RxBool isSwitched1 = false.obs;
  RxBool isSwitched2 = false.obs;
  RxBool isSwitched3 = false.obs;
  RxBool isVisible = false.obs;

  RxBool isEditingSubject = false.obs;

  var expertSettings = Rxn<ExpertSetting>();

  TextEditingController priceTxtController1 = TextEditingController();
  TextEditingController priceTxtController2 = TextEditingController();
  TextEditingController priceTxtController3 = TextEditingController();

  RxList<bool> selectedTabs = [true, false, false].obs;
  final List<String> daysOfWeek = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];

  final Map<String, String> dayMap = {
    'Sun': 'Sunday',
    'Mon': 'Monday',
    'Tue': 'Tuesday',
    'Wed': 'Wednesday',
    'Thu': 'Thursday',
    'Fri': 'Friday',
    'Sat': 'Saturday',
  };
  RxInt selectedIndex = (-1).obs;

  final List<String> time = [
    '15min',
    '30min',
    '60min',
  ];
  RxInt selectedIndex1 = (-1).obs;

  void updateIndex(int index) {
    selectedIndex.value = index;
    print('isVisible${isVisible.value}');
  }

  void updateIndex1(int index) {
    selectedIndex1.value = index;
  }

  List<String> sessionTypeArr = [];
  var timeSlots = <List<String>>[
    ['09:00am', '09:00am'], // Initial time slot
  ].obs;

  var previousIndex = 0.obs;
  // Method to add a new time slot
  void addTimeSlot() {
    timeSlots.add(['09:00am', '09:00am']); // Default start and end times
  }

  // Method to remove a specific time slot
  void removeTimeSlot(int index) {
    if (timeSlots.length > 1) {
      timeSlots.removeAt(index);
    }
  }

  @override
  void onInit() {
    getExpertSettingById();
    super.onInit();
  }

  List<Map<String, dynamic>> generateNewTiming() {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    // Example start date (you can make this dynamic)
    DateTime startDate = DateTime.now();

    // Loop through the days of the week
    return daysOfWeek.asMap().entries.map((entry) {
      int index = entry.key;
      String day = entry.value;

      // Calculate the date for each day of the week
      DateTime date = startDate.add(Duration(days: index));
      String formattedDate = dateFormat.format(date);

      // Create the slots for each day based on the timeSlots array
      List<Map<String, dynamic>> slots = timeSlots.map((slot) {
        return {"timing": "${slot[0]} - ${slot[1]}", "isBooked": false};
      }).toList();

      return {"date": "${formattedDate}T00:00:00.000Z", "slots": slots};
    }).toList();
  }

  void selectTab(int page) {
    // Loop through the selectedTabs list and set all to false
    for (int i = 0; i < selectedTabs.length; i++) {
      selectedTabs[i] = false;
    }

    // Set the selected tab to true
    selectedTabs[page] = true;

    // Define session type labels
    List<String> sessionTypes = ["Chat", "Call", "Video"];

    // Clear the sessionTypeArr and add the newly selected session type
    sessionTypeArr.clear();
    sessionTypeArr.add(sessionTypes[page]);

    // Save the updated session type in preferences
    GetPrefs.setString(AppConst.sessionTypes, sessionTypeArr.toString());
  }

  String? getSelectedSession() {
    if (selectedIndex1.value >= 0 && selectedIndex1.value < time.length) {
      return time[selectedIndex1.value];
    }
    return null;
  }

  Future<void> createExpertSettings() async {
    String? userId = await CacheService().getUserId();
    String? authToken = await CacheService().getAuthToken();

    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $authToken'
    };

    String preferredSessionTypes = sessionTypeArr.join(',');
    String? selectedSession = getSelectedSession();

    if (selectedSession == null) {
      print('Error: No session selected');
      Get.snackbar(
        'Error',
        'Please select a valid session duration.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    var request = http.Request(
      'POST',
      Uri.parse('http://103.119.171.89:7001/updateExpertSetting'),
    );

    Map<String, dynamic> requestBody = {
      "user_id": userId,
      "newTiming": generateNewTiming(),
      "pricePerMinute": priceTxtController1.text,
      "preferredSessionType": preferredSessionTypes,
      "teacherStatus": "pending",
      "selectYourSession": "30min",
      "setYourFeeForPreBookedSession": priceTxtController2.text,
      "setYourFeeForPreBooked": priceTxtController3.text,
      "profileVisible": isSwitched.value,
      "vedioCallRecordings": isSwitched1.value,
      "preBookedSessions": isSwitched2.value,
      "voiceCallRecordings": isSwitched3.value
    };

    print('Request Body: ${json.encode(requestBody)}');

    request.body = json.encode(requestBody);
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();
      print('Response status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        final jsonResponse = jsonDecode(responseBody);
        print('Response: $jsonResponse');

        Get.snackbar(
          'Success',
          'Expert profile updated successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.back();
        Future.delayed(Duration(seconds: 1), () {
          Get.back();
        });
      } else {
        String errorResponse = await response.stream.bytesToString();
        print('Error: ${response.reasonPhrase}');
        print('Error Response Body: $errorResponse');

        Get.snackbar(
          'Error',
          'Failed to update profile: ${response.reasonPhrase}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Exception: $e');
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<ExpertSetting?> getExpertSettingById() async {
    String? userId = await CacheService().getUserId();
    String? authToken = await CacheService().getAuthToken();

    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $authToken'
    };

    var request = http.Request(
        'POST', Uri.parse('http://103.119.171.89:7001/getExpertSettingById'));

    request.body = json.encode({"expert_id": userId});
    request.headers.addAll(headers);
    print('body${request.body}');
    try {
      http.StreamedResponse response = await request.send();
      print('response$response');
      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        print('responseBody$responseBody');
        ApiResponse apiResponse = ApiResponse.fromJson(responseBody);
        fetchAndDisplayUI();
        if (apiResponse.status) {
          expertSettings.value = apiResponse
              .data; // Directly assign the single ExpertSetting object
          return expertSettings.value;
        } else {
          print('Error1 : ${apiResponse.message}');
          return null;
        }
      } else {
        print('Error2: ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Exception: $e');
      return null;
    }
  }

  void fetchAndDisplayUI() {
    final settings = expertSettings.value;
    if (settings != null) {
      //  preferredSessionTypes = settings.preferredSessionType;
      //priceTxtController1.text= settings
      isSwitched1.value = settings.vedioCallRecordings;
      isSwitched3.value = settings.voiceCallRecordings;
      isSwitched.value = settings.preBookedSessions;
//generateNewTiming() = settings.newTiming;
      // "30min"= settings.selectYourSession;
      priceTxtController2.text = settings.setYourFeeForPreBookedSession;

      // Optionally, you can process the newTiming if needed
      processNewTiming(settings.newTiming);
    }
  }

  void processNewTiming(List<NewTiming> newTiming) {
    // Process and display newTiming data in your UI
    for (var timing in newTiming) {
      print('Date: ${timing.date}');
      for (var slot in timing.slots) {
        print('Slot Timing: ${slot.timing}, Is Booked: ${slot.isBooked}');
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    priceTxtController1.clear();
    priceTxtController2.clear();
    priceTxtController3.clear();
    isSwitched.value = false;
    isSwitched2.value = false;
    isSwitched3.value = false;

    super.dispose();
  }
}
