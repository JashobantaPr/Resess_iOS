import 'package:recess/core/api_client.dart';

import '../core/url.dart';

class ConnectNowService {
  Future<bool?> preBookSession(Map<String, dynamic> body) async {
    try {
      String? url = Url.preBookSession;
      final response = await ApiService().authPost(url, body);
      return (response["Status"] == true);
    } catch (e) {
      return null;
    }
  }
}
