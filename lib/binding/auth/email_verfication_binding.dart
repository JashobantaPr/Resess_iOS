import 'package:get/get.dart';

import '../../controllers/auth/email_verification_controller.dart';

class EmailVerficationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmailVerificationController());
  }
}
