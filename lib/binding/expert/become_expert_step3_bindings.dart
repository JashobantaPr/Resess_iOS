import 'package:get/get.dart';
import 'package:recess/controllers/expert/become_expert_step3_controller.dart';

class BecomeExpertStep3Bindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BecomeExpertStep3Controller());
  }
}
