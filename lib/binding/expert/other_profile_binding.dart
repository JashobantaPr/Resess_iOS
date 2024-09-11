import 'package:get/get.dart';
import 'package:recess/controllers/expert/other_profile_controller.dart';

class OtherProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtherProfileController());
  }
}
