import 'package:get/get.dart';
import 'package:recess/controllers/settings/learning_session_controller.dart';

import '../../controllers/settings/change_password_controller.dart';

class LearningSessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LearningSessionController());
    Get.lazyPut(() => ChangePasswordController());
    // TODO: implement dependencies
  }
}
