import 'package:get/get.dart';
import 'package:recess/controllers/settings/privacypolicy_controller.dart';

import '../../controllers/settings/change_password_controller.dart';

class PrivacyPolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrivacyPolicyController());
    Get.lazyPut(() => ChangePasswordController());
  }
}
