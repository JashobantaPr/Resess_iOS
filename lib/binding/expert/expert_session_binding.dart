import 'package:get/get.dart';
import 'package:recess/controllers/expert/expert_session_controller.dart';

class ExpertSessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExpertSessionController());
  }
}
