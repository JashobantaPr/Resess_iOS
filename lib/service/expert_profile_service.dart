import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:recess/core/cache.service.dart';
import 'package:recess/core/url.dart';

class ExpertProfileService {
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

      request.headers.addAll(headers);

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
      request.headers.addAll(headers);

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

  // update Expert Profile

  Future<Map<String, dynamic>?> updateExpertProfile(
      Map<String, dynamic> mapData) async {
    String? authToken = await CacheService().getAuthToken();
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken'
    };

    try {
      String url = Url.updateexpertprofile;
      var request = http.Request('POST', Uri.parse(url));

      // Encode the mapData to JSON format correctly
      request.body = json.encode(mapData);
      request.headers.addAll(headers);

      print('Sending request to: $url');
      print('Request body: ${request.body}');

      // Send the request and get the response
      http.StreamedResponse streamedResponse = await request.send();
      http.Response response = await http.Response.fromStream(streamedResponse);

      // Decode the response body
      Map<String, dynamic> responseBody = json.decode(response.body);
      print('Response received: ${response.body}');

      if (responseBody["Status"] == true) {
        print('API returned success');
        return responseBody;
      } else {
        print('API returned failure: ${responseBody["message"]}');
        return {"Status": false, "message": responseBody["message"]};
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

  // create become a  Expert Profile
  Future<Map<String, dynamic>?> becomeExpertProfile(
      Map<String, dynamic> mapData) async {
    String? authToken = await CacheService().getAuthToken();

    try {
      String url = Url.becomeexpertprofile;
      var headers = {
        'Content-Type': 'application/json',
        "Authorization": 'Bearer $authToken'
      };
      var request = http.Request('POST', Uri.parse(url));

      request.body = json.encode(mapData);
      request.headers.addAll(headers);

      // Send the request and get the response
      http.StreamedResponse streamedResponse = await request.send();
      http.Response response = await http.Response.fromStream(streamedResponse);

      // Decode the response body
      Map<String, dynamic> responseBody = json.decode(response.body);
      print('Response received: ${response.body}');

      if (responseBody["Status"] == true) {
        print('API returned success');
        return responseBody;
      } else {
        print('API returned failure: ${responseBody["message"]}');
        return {"Status": false, "message": responseBody["message"]};
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
}

// MODEL-----------------------MoDEL-------------------------MODEL-----------------MODEL------------------------MODEL------------------------------------

// Language Model
class LanguagesResponse {
  final bool? status;
  final String? message;
  final List<LanguageData>? data;

  LanguagesResponse({this.status, this.message, this.data});

  factory LanguagesResponse.fromJson(Map<String, dynamic> json) {
    return LanguagesResponse(
      status: json['Status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List?)
          ?.map((item) => item == null
              ? null
              : LanguageData.fromJson(item as Map<String, dynamic>))
          .whereType<LanguageData>() // Ensures non-nullable list elements
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Status': status,
      'message': message,
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }
}

class LanguageData {
  final String? id;
  final String? adminId;
  final List<String>? languages;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  LanguageData({
    this.id,
    this.adminId,
    this.languages,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory LanguageData.fromJson(Map<String, dynamic> json) {
    return LanguageData(
      id: json['_id'] as String?,
      adminId: json['admin_id'] as String?,
      languages:
          (json['languages'] as List?)?.map((item) => item as String).toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'admin_id': adminId,
      'languages': languages,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v,
    };
  }
}

// Subject Model
class SubjectsResponse {
  bool? status;
  String? message;
  List<SubjectData>? data;

  SubjectsResponse({this.status, this.message, this.data});

  SubjectsResponse.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SubjectData>[];
      json['data'].forEach((v) {
        data!.add(SubjectData.fromJson(v));
      });
    }
  }
}

class SubjectData {
  String? id;
  String? adminId;
  String? subject;
  String? createdAt;
  String? updatedAt;

  SubjectData(
      {this.id, this.adminId, this.subject, this.createdAt, this.updatedAt});

  SubjectData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    adminId = json['admin_id'];
    subject = json['subject'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
