import 'package:recess/Utility/util.dart';
import 'package:recess/core/api_client.dart';
import 'package:recess/core/cache.service.dart';
import 'package:recess/core/url.dart';

import 'package:recess/models/onboarding_model/forget_password_model.dart';

import '../models/onboarding_model/onboarding_model.dart';

import 'dart:io';

class OnboardingService {
  final CacheService _cacheService = CacheService();
  Future<UserData?> userRegistration(
    String? emailId,
  ) async {
    final String? deviceId = await Util.getDeviceId();

    try {
      Map<String, dynamic> body = {
        "email": emailId,
        "token": "hihihih",
        "device_id": deviceId,
      };
      String url = Url.registration;
      final response = await ApiService().post(url, body);
      if (response["Status"] == true) {
        UserData? result = UserData.fromJson(response['data']);

        return result;
      } else {
        throw HttpException(response["message"]);
        // throw HttpException();
        //  response["message"];
      }
    } catch (e) {
      if (e is HttpException) {
        rethrow;
      }
      return null;
    }
  }

  //otp Verify

  Future<UserData?> userOtpVerify(String? emailId, String? emailOtp) async {
    try {
      Map<String, dynamic> body = {
        "email": emailId,
        "emailotp": emailOtp,
      };
      String url = Url.userOtp;
      final response = await ApiService().authPost(url, body);
      if (response["Status"] == true) {
        UserData result = UserData.fromJson(response["data"]);
        return result;
      }
    } catch (e) {
      return null;
    }
  }

  //createpassword

  Future<bool?> userCreatePassword(String? password, String? name) async {
    try {
      String? userId = await CacheService().getUserId();

      Map<String, dynamic> body = {
        "user_id": userId,
        "password": password,
        "confirmpassword": "",
        "name": name,
      };
      String url = Url.createPassword;
      final response = await ApiService().authPost(url, body);
      if (response["Status"] == true) {
        bool profile = (response["data"]["profile"]);
        _cacheService.setProfile(profile);

        return response["Status"] == true;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool?> forgetuserCreatePassword(String? password) async {
    try {
      String? userId = await CacheService().getUserId();

      Map<String, dynamic> body = {
        "user_id": userId,
        "password": password,
      };
      String url = Url.createPassword;
      final response = await ApiService().authPost(url, body);
      if (response["Status"] == true) {
        bool profile = (response["data"]["profile"]);
        _cacheService.setProfile(profile);
        String? userName = (response["data"]["name"]);
        _cacheService.setUserName(userName);

        return response["Status"] == true;
      }
    } catch (e) {
      return null;
    }
  }

  //user Login

  Future<bool?> userLogin(String? emailId, String? password) async {
    try {
      final String? deviceId = await Util.getDeviceId();
      Map<String, dynamic> body = {
        "email": emailId,
        "password": password,
        "token": "hihihih",
        "device_id": deviceId,
      };
      String? url = Url.userLogin;
      final response = await ApiService().authPost(url, body);
      if (response["Status"] == true) {
        String? userId = (response["data"]["_id"]);
        _cacheService.setUserId(userId ?? "");
        bool profile = (response["data"]["profile"]);
        _cacheService.setProfile(profile);

        String token = (response["data"]["tokens"]["accessToken"]);
        _cacheService.setAuthToken(token);

        String? userName = (response["data"]["name"]);
        _cacheService.setUserName(userName);

        return response["Status"] == true;
      }
    } on HttpException catch (e) {
      rethrow;
    } catch (e) {
      print(e);
    }
  }

  //Service

  Future<forgetData?> forgetEmail(String? emailId) async {
    try {
      Map<String, dynamic> body = {
        "email": emailId,
      };
      String url = Url.forgetPassword;
      final response = await ApiService().post(url, body);
      if (response["Status"] == true) {
        forgetData? result = forgetData.fromJson(response['data']);
      }
    } on HttpException catch (e) {
      rethrow;
    } catch (e) {
      return null;
    }
  }

  //userForgetotp verify

  Future<bool?> userForgetOtpVerify(String? emailId, String? emailOtp) async {
    try {
      Map<String, dynamic> body = {
        "email": emailId,
        "emailotp": emailOtp,
      };
      String url = Url.userOtp;
      final response = await ApiService().authPost(url, body);
      return (response["Status"] == true);
    } catch (e) {
      return null;
    }
  }
}
