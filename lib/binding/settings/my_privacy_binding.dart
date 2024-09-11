import 'package:get/get.dart';
import 'package:recess/controllers/settings/my_privacy_controller.dart';

import '../../controllers/settings/change_password_controller.dart';

class MyPrivacyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyPrivacyController());
    Get.lazyPut(() => ChangePasswordController());
  }
}
