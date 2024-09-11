import 'package:get/get.dart';
import 'package:recess/controllers/expert/view_expert_profile_controller.dart';

class ViewExpertProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewExpertProfileController());
  }
}
