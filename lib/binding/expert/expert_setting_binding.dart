import 'package:get/get.dart';
import 'package:recess/controllers/expert/expert_setting_controller.dart';

class ExpertSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExpertSettingController());
  }
}
