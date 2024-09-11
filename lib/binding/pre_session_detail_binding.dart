import 'package:get/get.dart';
import 'package:recess/controllers/pre_session_detail_controller.dart';

class PreSessionDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PreSessionDetailController());
  }
}
