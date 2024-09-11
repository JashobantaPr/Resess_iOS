import 'package:get/get.dart';
import 'package:recess/controllers/auth/enter_email_controller.dart';

class EnterEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnterEmailController());
  }
}
