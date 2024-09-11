import 'package:get/get.dart';
import 'package:recess/controllers/auth/enter_name_controller.dart';

class EnterNameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnterNameController());
  }
}
