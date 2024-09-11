import 'package:get/get.dart';
import 'package:recess/service/home_screen.service.dart';

import '../models/home_screen_model/approve_expert_profiles.model.dart';

class ProfileSearchController extends GetxController {
  RxList<ApprovedExpertProfileModel> searchProfiles =
      <ApprovedExpertProfileModel>[].obs;
  RxList<ApprovedExpertProfileModel> profiles =
      <ApprovedExpertProfileModel>[].obs;

  void searchFilter(String query) {
    if (query.isEmpty) {
      searchProfiles.value = profiles;
    } else {
      searchProfiles.value = profiles
          .where((ApprovedExpertProfileModel item) =>
              //  (item.name?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
              //  (item.name?.toLowerCase().contains(query.toLowerCase()) ?? false)
              (item.name?.toLowerCase().contains(query.toLowerCase()) ??
                  false) ||
              (item.mySubject
                      ?.toString()
                      .toLowerCase()
                      .contains(query.toLowerCase()) ??
                  false))
          .toList();
    }
  }

  getProfiles() async {
    List<ApprovedExpertProfileModel>? result =
        await HomeService().getAllApprovedExpertProfile();

    if (result != null) {
      profiles.value = result;
      searchProfiles.value = result;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProfiles();
  }
}
