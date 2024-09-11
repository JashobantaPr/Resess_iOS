import 'package:get/get.dart';
import 'package:recess/Utility/get_prefs.dart';
import 'package:recess/models/exper_model/admin_status_model.dart';
import 'package:recess/network_services/app_consts.dart';
import 'package:recess/service/become_an_expertprofile_service.dart';

import '../../Dashboard/expert/expert_profile.dart';
import '../../core/cache.service.dart';

class AdminStatusController extends GetxController {
  final CacheService _cacheService = CacheService();
  RxList<AdminStatusModel> adminStatus = <AdminStatusModel>[].obs;

  getResponse() async {
    try {
      String? userId = await _cacheService.getUserId();
      Map<String, dynamic> body = {"expert_id": userId};
      List<AdminStatusModel>? data =
          await BecomeAnExpertProfileService().adminStatus(body);
      if (data != null) {
        adminStatus.value = data;
      }
    } catch (e) {}
  }

  @override
  void onInit() {
    super.onInit();

    getResponse();
  }

  sendConitnue() async {
    String? userId = await _cacheService.getUserId();
    Map<String, dynamic> body = {"user_id": userId, "status": "true"};
    bool? result = await BecomeAnExpertProfileService().sendContinue(body);
    if (result == true) {
      GetPrefs.setBool(AppConst.showExpertProfile, true);
      Get.offAll(ExpertProfile());
    }
  }
}
