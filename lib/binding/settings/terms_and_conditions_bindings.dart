import 'package:get/get.dart';
import 'package:recess/controllers/settings/terms&conditions_controller.dart';

import '../../controllers/settings/change_password_controller.dart';

class TermsAndConditionsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TermsandConditionsController());
    Get.lazyPut(() => ChangePasswordController());
  }
}
