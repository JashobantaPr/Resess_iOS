import 'package:get/get.dart';
import 'package:recess/splash_screen.dart';

import '../controllers/splashController.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
  }
}
