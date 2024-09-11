import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:recess/core/api_client.dart';
import 'package:recess/core/cache.service.dart';
import 'package:recess/core/url.dart';

class UserOnlineOfflineService {
  CacheService _cacheService = CacheService();
  Future<Map<String, dynamic>?> setuserOnlineOffline(
      Map<String, dynamic> data) async {
    String? authToken = await CacheService().getAuthToken();
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $authToken'
    };

    try {
      String url = Url.useronlineoffline;
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

  Future<Map<String, dynamic>?> getuserOnlineOffline(
      Map<String, dynamic> data) async {
    String? authToken = await CacheService().getAuthToken();

    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $authToken'
    };
    try {
      String url = Url.getuseronlineoffline;
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
}
