import 'package:get/get.dart';
import 'package:recess/controllers/settings/notification_setting_controller.dart';

import '../../controllers/settings/change_password_controller.dart';
import '../../controllers/settings/favourites_subjects_controller.dart';

class NotificationSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationSettingsController());
    Get.lazyPut(() => ChangePasswordController());
    Get.lazyPut(() => FavouritesExpertController());
  }
}
