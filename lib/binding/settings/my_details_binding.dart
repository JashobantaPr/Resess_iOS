import 'package:get/get.dart';
import 'package:recess/controllers/settings/my_details_controller.dart';

import '../../controllers/settings/change_password_controller.dart';

class MyDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyDetailsController());
    Get.lazyPut(() => ChangePasswordController());
  }
}
