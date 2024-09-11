import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:recess/core/cache.service.dart';

class ApiService {
  Future<Map<String, dynamic>> post(
      String url, Map<String, dynamic> body) async {
    try {
      final response = await http.post(Uri.parse(url),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        final data = jsonDecode(response.body);
        if (data['status'] == false || data['Status'] == false) {
          print('data${data['message']}');
          throw HttpException(data['message']);
        } else {
          throw HttpException("Something went wrong!");
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future authPost(String url, Map<String, dynamic> body) async {
    try {
      String? authToken = await CacheService().getAuthToken();

      final response = await http.post(Uri.parse(url),
          body: jsonEncode(body),
          headers: {
            "Content-Type": "application/json",
            "Authorization": 'Bearer $authToken'
          });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('ggggggg$data');
        return data;
      } else {
        throw const HttpException("Something went wrong!");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> delete(
      String url, Map<String, dynamic>? body) async {
    try {
      String? authToken = await CacheService().getAuthToken();
      final response = await http.delete(Uri.parse(url),
          body: jsonEncode(body),
          headers: {
            "Content-Type": "application/json",
            "Authorization": 'Bearer $authToken'
          });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data as Map<String, dynamic>;
      } else {
        throw const HttpException("Something went wrong!");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future put(String url, Map<String, dynamic>? body) async {
    try {
      final response = await http.put(Uri.parse(url),
          body: jsonEncode(body),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        return data;
      } else {
        throw const HttpException("Something went wrong!");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> get(String url,
      [Map<String, dynamic> body = const {}]) async {
    try {
      final response = await http
          .get(Uri.parse(url), headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data as Map<String, dynamic>;
      } else {
        throw const HttpException("Something went wrong!");
      }
    } catch (e) {
      rethrow;
    }
  }
}
