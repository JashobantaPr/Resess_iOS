import 'package:get/get.dart';
import 'package:recess/controllers/expert/become_expert_step4_controller.dart';

class BecomeExpertStep4Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BecomeExpertStep4Controller());
  }
}
