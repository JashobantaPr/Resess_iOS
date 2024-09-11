import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:recess/core/api_client.dart';
import 'package:recess/core/cache.service.dart';
import 'package:recess/core/url.dart';
import 'package:recess/models/settings_model/mydetails_model.dart';

import '../models/settings_model/learner_past_session.dart';
import '../models/settings_model/upcomming_user_profile.model.dart';

class SettingsService {
  CacheService _cacheService = CacheService();

// Terms and Privacy Policy
  Future<Map<String, dynamic>> getAlltermsandPrivacy(
      String url, Map<String, dynamic> body) async {
    String? authToken = await CacheService().getAuthToken();
    print('Auth Token: $authToken');
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        "Authorization": 'Bearer $authToken'
      },
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      print('vbnm${json.decode(response.body)}');
      return json.decode(response.body);
    } else {
      throw HttpException('Failed to load terms and conditions');
    }
  }

// Delete Account
  Future<Map<String, dynamic>> deleteAccount(String? userId) async {
    String? authToken = await CacheService().getAuthToken();

    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $authToken'
    };
    print('userid: $userId');
    try {
      String url = Url.deleteaccount;
      Map<String, dynamic> body = {"user_id": userId ?? ''};
      final response = await ApiService().post(url, body);

      if (response["Status"] == true) {
        return response;
      } else {
        return {
          "Status": false,
          "message": response["message"] ?? "Unknown error."
        };
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

// My Privacy
  Future<Map<String, dynamic>?> setPrivacy(Map<String, dynamic> data) async {
    String? authToken = await CacheService().getAuthToken();
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $authToken'
    };

    try {
      String url = Url.myPrivacy;
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

  Future<Map<String, dynamic>?> getmyprivacy(Map<String, dynamic> data) async {
    String? authToken = await CacheService().getAuthToken();

    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $authToken'
    };
    try {
      String url = Url.getmyPrivacy;
      final response = await ApiService().authPost(url, data);
      if (response["Status"] == true) {
        return response;
      } else {
        return {"message": response["message"]};
      }
    } catch (e) {
      return {"message": "An error occurred."};
    }
  }

// My Details
  Future<UserProfileResponse?> getUserDetails(String userId) async {
    String? authToken = await CacheService().getAuthToken();
    print('kdff ${authToken}');

    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $authToken'
    };
    print('headers$headers');
    var request = http.Request('POST', Uri.parse(Url.getUsers));
    request.body = json.encode({"_id": userId});
    request.headers.addAll(headers);

    try {
      print('Sending request...');
      http.StreamedResponse response = await request.send();
      print('Response received');

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        print('Response body: $responseBody');
        final Map<String, dynamic> jsonMap = json.decode(responseBody);
        final userProfileResponse = UserProfileResponse.fromJson(jsonMap);
        return userProfileResponse;
      } else {
        print('Failed to load user details: ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

// Change Password
  Future<Map<String, dynamic>?> changePassword(
      Map<String, dynamic> data) async {
    String? authToken = await CacheService().getAuthToken();
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $authToken'
    };
    print('ifgfyf $headers');
    try {
      String url = Url.changepassword;
      print('dgf $url');
      print('ssghfk $data');
      final response = await ApiService().authPost(url, data);
      print('dsjfgfhf $response');
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

// Update Details
// Future<void> updateUserDetails() async {
//    var headers = {
//   'Content-Type': 'application/json'
// };
// var request = http.Request('POST', Uri.parse('http://103.119.171.89:7001/updateDetails'));
// request.body = json.encode({
//   "user_id": "66ab300c388a0d35508f30b0",
//   "name": "Maheshaababu",
//   "email": "Maheshaaababu@gmail.com"
// });
// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }

//   }

  Future<bool?> DeleteAccount() async {
    try {
      Future<String?> userId = _cacheService.getUserId();
      Map<String, dynamic> body = {
        "user_id": userId,
      };
      String url = Url.deleteaccount;
      final respose = await ApiService().post(url, body);
      return (respose["Status"] == true);
    } catch (e) {
      return false;
    }
  }

  //upcoming

  Future<List<UpcomingUserBookingsModel>?> upComingUserBookingList() async {
    try {
      String? userId = await _cacheService.getUserId();
      Map<String, dynamic> body = {"user_id": userId};
      String url = Url.UpcomingUserBookings;
      final response = await ApiService().authPost(url, body);
      if (response["Status"] == true) {
        List<UpcomingUserBookingsModel> result = response["data"]
            .map<UpcomingUserBookingsModel>(
                (json) => UpcomingUserBookingsModel.fromJson(json))
            .toList();
        return result;
      }
      return null;
    } catch (e) {
      return [];
    }
  }

  //past

  Future<List<LearnerPassSessionsModel>?> PastUserBookingList() async {
    try {
      String? userId = await _cacheService.getUserId();
      Map<String, dynamic> body = {"user_id": userId};
      String url = Url.getPastUserBookings;
      final response = await ApiService().authPost(url, body);
      if (response["Status"] == true) {
        List<LearnerPassSessionsModel> result = response["data"]
            .map<LearnerPassSessionsModel>(
                (json) => LearnerPassSessionsModel.fromJson(json))
            .toList();
        return result;
      }
    } catch (e) {
      return [];
    }
  }

  Future<bool?> addRatings(Map<String, dynamic> body) async {
    try {
      String url = Url.addRating;
      final response = await ApiService().authPost(url, body);
      return response["Status"] == true;
    } catch (e) {
      return null;
    }
  }
}
