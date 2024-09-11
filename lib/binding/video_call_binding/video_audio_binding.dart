import 'package:get/get.dart';
import 'package:recess/controllers/home_controller.dart';

import '../../controllers/expert/expert_profile_controller.dart';
import '../../controllers/video_audio_call_controller.dart/video_call_controller.dart';

class VideoAudioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CallController());
    Get.lazyPut(() => ExpertProfileController());
  }
}
