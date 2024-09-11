import 'package:get/get.dart';

import '../controllers/main_dashboard_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MainDashboardController());
    
  }
}
