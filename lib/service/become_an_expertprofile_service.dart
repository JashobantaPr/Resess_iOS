import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:recess/core/api_client.dart';
import 'package:recess/core/cache.service.dart';
import 'package:recess/core/url.dart';

import '../models/exper_model/admin_status_model.dart';

class BecomeAnExpertProfileService {
  // become an expert

  // get allLanguages
  Future<Map<String, dynamic>?> getAllLanguages() async {
    String? authToken = await CacheService().getAuthToken();
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $authToken'
    };
    try {
      String url = Url.getallaanguages;
      var request = http.Request('POST', Uri.parse(url));

      http.StreamedResponse streamedResponse = await request.send();
      final responseString = await streamedResponse.stream.bytesToString();
      final response = json.decode(responseString) as Map<String, dynamic>;

      if (response["Status"] == true) {
        print('Responseggggggggggg: $response');
        return response;
      } else {
        return {"Status": false, "message": response["message"]};
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

  // get allSubjects
  Future<Map<String, dynamic>?> getAllSubjects() async {
    String? authToken = await CacheService().getAuthToken();
    var headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $authToken'
    };
    try {
      String url = Url.getallsubjects;
      var request = http.Request('POST', Uri.parse(url));

      http.StreamedResponse streamedResponse = await request.send();
      final responseString = await streamedResponse.stream.bytesToString();
      final response = json.decode(responseString) as Map<String, dynamic>;

      if (response["Status"] == true) {
        print('Responsebbbbbbbbbbbbb: $response');
        return response;
      } else {
        return {"Status": false, "message": response["message"]};
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

  //Upload Image

  Future<String?> uploadImageOrDocuments(String imagePath) async {
    try {
      String url = Url.uploadImageOrDocuments;
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add headers
      String? authToken = await CacheService().getAuthToken();
      var headers = {"Authorization": 'Bearer $authToken'};
      request.headers.addAll(headers);

      // Add the file to the request
      request.files.add(await http.MultipartFile.fromPath('image', imagePath));

      // Send the request
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var resbody = await response.stream.bytesToString();
        var data = jsonDecode(resbody);

        if (data["status"] == true) {
          if (data["attachmentDetails"] != null &&
              data["attachmentDetails"].length > 0) {
            return data["attachmentDetails"][0]["filename"];
          }
        }
      } else {
        print('Failed to update group: ${response.reasonPhrase}');
        return null;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool?> addExpertProfile(Map<String, dynamic> body) async {
    try {
      String? url = Url.addExpertProfile;
      final response = await ApiService().authPost(url, body);
      return response["Status"] == true;
    } catch (e) {
      return null;
    }
  }

  //admine Status

  Future<List<AdminStatusModel>?> adminStatus(Map<String, dynamic> body) async {
    try {
      String? url = Url.adminStatus;
      final response = await ApiService().authPost(url, body);
      if (response["Status"] == true) {
        List<AdminStatusModel>? result = response["data"]
            .map<AdminStatusModel>((json) => AdminStatusModel.fromJson(json))
            .toList();
        return result;
      }
    } catch (e) {
      return null;
    }
  }

  //sucess Status

  Future<bool?> sendContinue(Map<String, dynamic> body) async {
    try {
      String? url = Url.status;
      final response = await ApiService().authPost(url, body);
      return (response["Status"] == true);
    } catch (e) {
      return null;
    }
  }
}
