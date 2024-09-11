import 'package:get/get.dart';
import 'package:recess/service/home_screen.service.dart';

import '../../models/home_screen_model/approve_expert_profiles.model.dart';

class OtherProfileController extends GetxController {
  Rx<ApprovedExpertProfileModel> otherProfile =
      ApprovedExpertProfileModel().obs;

  
}
