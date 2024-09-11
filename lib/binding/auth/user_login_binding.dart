import 'package:get/get.dart';
import 'package:recess/controllers/auth/user_login_controller.dart';

class UserLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserLoginController());
  }
}
