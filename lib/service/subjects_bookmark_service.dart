import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recess/core/api_client.dart';
import 'package:recess/core/cache.service.dart';
import 'package:recess/core/url.dart';
import '../models/subjects_bookmark_model.dart';

class BookMarkSubjectService {
  final CacheService _cacheService = CacheService();

  Future<BookMarkSubjectResponse?> getBookMarkSubjectById(
      Map<String, dynamic> data) async {
    String? authToken = await _cacheService.getAuthToken();
    final headers = {
      'Content-Type': 'application/json',
      "Authorization": 'Bearer $authToken'
    };

    try {
      String url = Url.getbookmarksubjectbyid;
      final response = await ApiService().authPost(url, data);

      if (response != null) {
        print('Response received: $response');
        BookMarkSubjectResponse data =
            BookMarkSubjectResponse.fromJson(response);
        return data;
      } else {
        print('Empty response received');
        return null;
      }
    } catch (e) {
      print('An error occurred subjectbookmark service: $e');
      return null;
    }
  }
}
