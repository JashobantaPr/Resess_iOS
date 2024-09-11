import 'package:recess/Utility/AppImages.dart';

import '../../controllers/expert/become_expert_step1_controller.dart';

class SessionHelper {
  static Map<String, String> getSessionInfo(typeOfSession sessionType) {
    switch (sessionType) {
      case typeOfSession.chat:
        return {'label': 'Chat', 'imagePath': AppImages.chatIcon};
      case typeOfSession.call:
        return {'label': 'Call', 'imagePath': AppImages.callIcon};
      case typeOfSession.video:
        return {'label': 'Video', 'imagePath': AppImages.videoIcon};
      default:
        return {'label': '', 'imagePath': ''};
    }
  }
}
