import 'package:get/get.dart';
import 'package:recess/controllers/expert/admin_status_controller.dart';

class AdminStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminStatusController());
  }
}
