import 'package:get/get.dart';
import 'package:recess/controllers/auth/forget_email_verification_controller.dart';

class ForgetEmailVerficationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetEmailVerificationController());
  }
}
