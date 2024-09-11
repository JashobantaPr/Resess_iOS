import 'package:get/get.dart';

import '../../controllers/auth/complete_onboard_controller.dart';

class CompleteOnboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompleteOnboardController());
  }
}
