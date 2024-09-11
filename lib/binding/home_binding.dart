import 'package:get/get.dart';
import 'package:recess/controllers/home_controller.dart';

import '../controllers/book_session_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
