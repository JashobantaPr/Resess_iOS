import 'package:get/get.dart';
import 'package:recess/controllers/settings/favourites_subjects_controller.dart';

import '../../controllers/settings/change_password_controller.dart';
import '../../controllers/settings/notification_setting_controller.dart';

class FavouritesExpertsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationSettingsController());
    Get.lazyPut(() => FavouritesExpertController());
    Get.lazyPut(() => ChangePasswordController());
  }
}
