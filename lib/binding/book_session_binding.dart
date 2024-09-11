import 'package:get/get.dart';
import 'package:recess/controllers/book_session_controller.dart';

import '../controllers/home_controller.dart';

class BookSessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookSessionController());
    Get.lazyPut(() => HomeController());
  }
}
