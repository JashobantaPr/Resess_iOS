import 'package:recess/core/api_client.dart';
import 'package:recess/models/notification/get_notification_model.dart';

import '../core/url.dart';

class NotificationService {
  Future<List<GetNotificationModel>?> getNotification(
      Map<String, dynamic> body) async {
    try {
      String? url = Url.getNotification;
      final response = await ApiService().authPost(url, body);
      if (response["status"] == true) {
        List<GetNotificationModel> result = response["response"]
            .map<GetNotificationModel>(
                (json) => GetNotificationModel.fromJson(json))
            .toList();
        return result;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  //Accept session

  Future<bool?> acceptSession(Map<String, dynamic> body) async {
    try {
      String url = Url.approveSession;
      final response = await ApiService().authPost(url, body);
      return response["Status"] == true;
    } catch (e) {
      return null;
    }
  }

  //reject

  Future<bool?> cancelSession(Map<String, dynamic> body) async {
    try {
      String url = Url.cancelSession;
      final response = await ApiService().authPost(url, body);
      return response["Status"] == true;
    } catch (e) {
      return null;
    }
  }
}
