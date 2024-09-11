import 'package:get/get.dart';
import 'package:recess/controllers/auth/login_options_controller.dart';

class LoginOptionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginOptionsController());
  }
}
