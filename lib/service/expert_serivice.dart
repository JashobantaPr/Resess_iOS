import 'package:recess/core/api_client.dart';
import 'package:recess/core/cache.service.dart';
import 'package:recess/core/url.dart';

import '../models/exper_model/expert_profile_model.dart';
import '../models/exper_model/expert_session_upcoming_model.dart';
import '../models/exper_model/past_booking_expert_model.dart';

class ExpertSerivice {
  final CacheService _cacheService = CacheService();
  Future<List<ExpertSessionUpcomingModel>?> ExpertUpcomingSession() async {
    try {
      String? userId = await _cacheService.getUserId();
      Map<String, dynamic> body = {"expert_id": userId};

      String url = Url.getUpcomingExpertBookings;
      final response = await ApiService().authPost(url, body);
      if (response["Status"] == true) {
        List<ExpertSessionUpcomingModel> result = response["data"]
            .map<ExpertSessionUpcomingModel>(
                (json) => ExpertSessionUpcomingModel.fromJson(json))
            .toList();
        return result;
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<ExpertSessionUpcomingModel>?> ExpertPastSession() async {
    try {
      String? userId = await _cacheService.getUserId();
      Map<String, dynamic> body = {"expert_id": userId};

      String url = Url.getPastExpertBookings;
      final response = await ApiService().authPost(url, body);
      if (response["Status"] == true) {
        List<ExpertSessionUpcomingModel> result = response["data"]
            .map<ExpertSessionUpcomingModel>(
                (json) => ExpertSessionUpcomingModel.fromJson(json))
            .toList();
        return result;
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<getPastExpertBookingsModel>?> upcomingPastBookingList(
      Map<String, dynamic> body) async {
    try {
      String url = Url.upcomingData;
      final response = await ApiService().authPost(url, body);
      if (response["Status"] == true) {
        List<getPastExpertBookingsModel> result = response["data"]
            .map<getPastExpertBookingsModel>(
                (json) => getPastExpertBookingsModel.fromJson(json))
            .toList();
        return result;
      }
    } catch (e) {
      return null;
    }
  }

  Future<ExpertProfileModel?> experProfile(Map<String, dynamic> body) async {
    try {
      String url = Url.expertProfile;
      final response = await ApiService().authPost(url, body);
      if (response["Status"] == true) {
        ExpertProfileModel result =
            ExpertProfileModel.fromJson(response["data"]["profile"]);
        return result;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
