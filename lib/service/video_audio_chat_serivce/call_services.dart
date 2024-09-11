import 'package:recess/core/api_client.dart';
import 'package:recess/core/url.dart';

import '../../models/video_audio_model/get_tocken.model.dart';

class CallServices {
  Future<getTockens?> getTocken(Map<String, dynamic> body) async {
    try {
      String url = Url.createChannel;
      final response = await ApiService().authPost(url, body);
      getTockens? result = getTockens.fromJson(response["data"]);
      return result;
    } catch (e) {
      return null;
    }
  }
}
