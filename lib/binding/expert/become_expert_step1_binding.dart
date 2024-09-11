import 'package:get/get.dart';
import 'package:recess/controllers/expert/become_expert_step1_controller.dart';

class BecomeExpertStep1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BecomeExpertStep1Controller());
  }
}
