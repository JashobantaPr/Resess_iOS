import 'package:get/get.dart';

import 'package:recess/controllers/settings/change_password_controller.dart';
import 'package:recess/controllers/settings/deleteaccount_controller.dart';
import 'package:recess/controllers/settings/favourites_experts_controller.dart';
import 'package:recess/controllers/settings/favourites_subjects_controller.dart';
import 'package:recess/controllers/settings/my_privacy_controller.dart';
import 'package:recess/controllers/settings/terms&conditions_controller.dart';

import '../../controllers/settings/learning_session_controller.dart';
import '../../controllers/settings/my_details_controller.dart';
import '../../controllers/settings/notification_setting_controller.dart';
import '../../controllers/settings/privacypolicy_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
    Get.lazyPut(() => PrivacyPolicyController());
    Get.lazyPut(() => DeleteAccountController());
    Get.lazyPut(() => FavouritesExpertController());
    Get.lazyPut(() => FavouritesSubjectController());
    Get.lazyPut(() => LearningSessionController());
    Get.lazyPut(() => MyDetailsController());
    Get.lazyPut(() => MyPrivacyController());
    Get.lazyPut(() => NotificationSettingsController());
    Get.lazyPut(() => PrivacyPolicyController());
    Get.lazyPut(() => TermsandConditionsController());
  }
}
