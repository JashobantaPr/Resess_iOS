import 'package:get/get.dart';
import 'package:recess/controllers/auth/forgot_email_controller.dart';

class ForgotEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotEmailController());
  }
}
