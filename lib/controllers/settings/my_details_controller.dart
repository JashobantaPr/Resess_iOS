import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:recess/Dashboard/settings/change_password_screen.dart';
import 'package:recess/core/cache.service.dart';
import 'package:recess/service/settings_service.dart';

import '../../core/url.dart';

class MyDetailsController extends GetxController {
  final CacheService _cacheService = CacheService();

  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  RxBool isObscure = true.obs;
  var errorMessage = ''.obs;
  var useremail = ''.obs;
  var username = ''.obs;
  var showUpdateButton = false.obs;

  @override
  void onInit() {
    super.onInit();
    print('onInit called');
    print('onInit calledszdxfcgvh');
    fetchUserDetails();
  }

  void onTapEye(bool obscure) {
    isObscure.value = obscure;
  }

  void onTapChangePassword() {
    Get.to(ChangePasswordScreen())!.then((_) {
      fetchUserDetails();
    });
  }

  Future<void> fetchUserDetails() async {
    String? userId = await CacheService().getUserId();
    try {
      print('Fetching user details...');
      final userProfileResponse =
          await SettingsService().getUserDetails(userId!);

      if (userProfileResponse != null && userProfileResponse.status) {
        final profile = userProfileResponse.data?.profile;
        if (profile != null) {
          username.value = profile.name;
          useremail.value = profile.email;
          nameController.text = profile.name;
          emailController.text = profile.email;
          passwordController.text = profile.password;
          _cacheService.setPassWord(profile.password);
          print('User details fetched successfully');
        } else {
          // Handle case where profile is null
          print('No profile data found');
        }
      } else {
        // Handle API response status false
        print('Failed to fetch user details: ${userProfileResponse?.message}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> updateUserDetails() async {
    String? userId = await CacheService().getUserId();
    String? authToken = await CacheService().getAuthToken();

    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $authToken'
    };
    print('headers$headers');
    var request = http.Request('POST', Uri.parse(Url.updatedetails));

    if (useremail == emailController.text) {
      errorMessage.value = 'This Email Is Already exists';
      return;
    }

    Map<String, dynamic> requestBody = {
      "user_id": userId,
    };

    if (username.value != nameController.text) {
      requestBody['name'] = nameController.text;
    }

    if (useremail.value != emailController.text) {
      requestBody['email'] = emailController.text;
    }

    request.body = json.encode(requestBody);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      print('vbnm$responseBody');
      var jsonResponse = json.decode(responseBody);
      if (jsonResponse["Status"] == true) {
        // Handle success
        // Get.snackbar('Success', 'Details updated successfully');
        clearterrortext();

        Get.back();
      } else {
        // Handle error
        //Get.snackbar('Error', jsonResponse["message"]);
        clearterrortext();

        Get.back();
      }
    } else {
      Get.snackbar('Error', response.reasonPhrase ?? 'An error occurred');
      clearterrortext();
      Get.back();
    }
  }

  clearterrortext() {
    errorMessage.value = '';
  }
}
