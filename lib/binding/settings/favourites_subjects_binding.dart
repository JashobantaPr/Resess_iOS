import 'package:get/get.dart';

import '../../controllers/settings/change_password_controller.dart';
import '../../controllers/settings/favourites_subjects_controller.dart';

class FavouritesSubjectsBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => FavouritesSubjectsController());
    Get.lazyPut(() => ChangePasswordController());
  }
}
