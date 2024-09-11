import 'dart:io';

import 'package:recess/core/api_client.dart';
import 'package:recess/core/cache.service.dart';
import 'package:recess/core/url.dart';
import 'package:recess/models/settings_model/getmysubject_model.dart';

import '../models/home_screen_model/approve_expert_profiles.model.dart';
import '../models/home_screen_model/booking_session.dart';
import '../models/home_screen_model/category_model.dart';
import '../models/home_screen_model/sub_category_model.dart';
import '../models/user_booking_model.dart';

class HomeService {
  final CacheService _cacheSerivce = CacheService();
  Future<List<ApprovedExpertProfileModel>?>
      getAllApprovedExpertProfile() async {
    String? userId = await _cacheSerivce.getUserId();

    try {
      Map<String, dynamic> body = {"user_id": userId};
      String url = Url.getAllApprovedExpertProfile;
      final response = await ApiService().authPost(url, body);
      if (response["Status"] == true) {
        List<ApprovedExpertProfileModel>? result = response["data"]
            .map<ApprovedExpertProfileModel>(
                (json) => ApprovedExpertProfileModel.fromJson(json))
            .toList();

        return result;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<CategoryModel>?> getCategoryList() async {
    try {
      Map<String, dynamic> body = {};
      String? url = Url.getAllCategory;
      final response = await ApiService().authPost(url, body);
      if (response["Status"] == true) {
        List<CategoryModel> result = response["data"]
            .map<CategoryModel>((json) => CategoryModel.fromJson(json))
            .toList();
        return result;
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<SubCategoryModel>?> getSubcategoryList() async {
    try {
      Map<String, dynamic> body = {};
      String? url = Url.getAllSubCategory;
      final response = await ApiService().post(url, body);
      if (response["Status"] == true) {
        List<SubCategoryModel> result = response["data"]
            .map<SubCategoryModel>((json) => SubCategoryModel.fromJson(json))
            .toList();
        return result;
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<ApprovedExpertProfileModel>?> subCategoryFilter(
      String? subject) async {
    try {
      Map<String, dynamic> body = {
        "mySubject": subject,
      };
      String url = Url.getMySubject;
      final response = await ApiService().post(url, body);
      if (response["Status"] == true) {
        List<ApprovedExpertProfileModel>? result = response["data"]
            .map<ApprovedExpertProfileModel>(
                (json) => ApprovedExpertProfileModel.fromJson(json))
            .toList();
        return result;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<List<ApprovedExpertProfileModel>?> categoryFilter(
      String? category) async {
    try {
      Map<String, dynamic> body = {
        "categoryText": category,
      };
      String url = Url.getCategoryFilter;
      final response = await ApiService().post(url, body);
      if (response["Status"] == true) {
        List<ApprovedExpertProfileModel>? result = response["data"]
            .map<ApprovedExpertProfileModel>(
                (json) => ApprovedExpertProfileModel.fromJson(json))
            .toList();
        return result;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  //viewOtherprofile

  Future<ApprovedExpertProfileModel?> otherProfile(String? expertId) async {
    try {
      String? userId = await _cacheSerivce.getUserId();
      Map<String, dynamic> body = {
        "user_id": userId,
        "expert_id": expertId,
      };
      String url = Url.userOtherProfile;
      final response = await ApiService().authPost(url, body);
      if (response["Status"] == true) {
        ApprovedExpertProfileModel result =
            ApprovedExpertProfileModel.fromJson(response["data"]);
        return result;
      }
    } catch (e) {
      return null;
    }
  }

  //Booking Flow
  Future<BookingModel?> bookingSession(String? expertId) async {
    try {
      Map<String, dynamic> body = {
        "expert_id": expertId,
      };
      String url = Url.getExpertSettingById;
      final response = await ApiService().authPost(url, body);
      if (response["Status"] == true) {
        BookingModel result = BookingModel.fromJson(response["data"]);
        return result;
      }
      return null;
    } catch (e) {
      
      return null;
    }
  }

  //Booking

  Future<BookingData?> userBookingSession(Map<String, dynamic> body) async {
    try {
      String url = Url.bookingSession;
      final response = await ApiService().authPost(url, body);
      if (response["Status"] == true) {
        BookingData result = BookingData.fromJson(response["data"]["booking"]);
        return result;
      }
    } catch (e) {
      return null;
    }
  }

  //cancel Booking
  Future<bool?> cancelBooking(Map<String, dynamic> body) async {
    try {
      String url = Url.cancelBooking;
      final response = await ApiService().authPost(url, body);

      return response["Status"] == true;
    } catch (e) {
      return null;
    }
  }

//bookMarkForSubject
  Future<Map<String, dynamic>?> addbookMarkForSubject(
      Map<String, dynamic> data) async {
    try {
      String url = Url.bookmarkforsubject;
      final response = await ApiService().authPost(url, data);
      if (response["Status"] == true) {
        return response;
      } else {
        return {"message": response["message"]};
      }
    } on HttpException catch (e) {
      print('HttpException: ${e.message}');
      return {"Status": false, "message": e.message};
    } catch (e, stackTrace) {
      print('Error: $e');
      print('StackTrace: $stackTrace');
      return {"Status": false, "message": "An error occurred."};
    }
  }

  //bookMarkForUser
  Future<Map<String, dynamic>?> bookMarkForUser(
      Map<String, dynamic> data) async {
    try {
      String url = Url.bookmarkforuser;
      final response = await ApiService().authPost(url, data);
      if (response["Status"] == true) {
        return response;
      } else {
        return {"message": response["message"]};
      }
    } on HttpException catch (e) {
      print('HttpException: ${e.message}');
      return {"Status": false, "message": e.message};
    } catch (e, stackTrace) {
      print('Error: $e');
      print('StackTrace: $stackTrace');
      return {"Status": false, "message": "An error occurred."};
    }
  }

  //getMySubject
  Future<MySubjectResponse?> getMySubject(Map<String, dynamic> data) async {
    try {
      String url = Url.getMySubject;
      final response = await ApiService().authPost(url, data);

      if (response["Status"] == true) {
        print('shyshyshy$response');
        return MySubjectResponse.fromJson(response);
      } else {
        return MySubjectResponse(
          status: false,
          message: response["message"],
        );
      }
    } on HttpException catch (e) {
      print('HttpException: ${e.message}');
      return MySubjectResponse(
        status: false,
        message: e.message,
      );
    } catch (e, stackTrace) {
      print('Error: $e');
      print('StackTrace: $stackTrace');
      return MySubjectResponse(
        status: false,
        message: "An error occurred.",
      );
    }
  }
}
