import 'package:get/get.dart';
import 'package:recess/controllers/auth/forgot_create_password_controller.dart';

class ForgotCreatePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotCreatePasswordController());
  }
}
