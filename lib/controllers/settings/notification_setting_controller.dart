import 'package:get/get.dart';

import '../../core/cache.service.dart';
import '../../models/notification/get_notification_model.dart';
import '../../service/notification_service.dart';

class NotificationSettingsController extends GetxController {
  final CacheService _cacheService = CacheService();

  RxList<GetNotificationModel> getNotifications = <GetNotificationModel>[].obs;
  RxBool isSwitched = true.obs;

  void tappedSwitch(bool switched) {
    isSwitched.value = switched;
  }

  @override
  void onInit() {
    super.onInit();

    getNotification();
  }

  getNotification() async {
    String? userId = await _cacheService.getUserId();

    Map<String, dynamic> body = {
      "user_id": userId,
    };

    List<GetNotificationModel>? data =
        await NotificationService().getNotification(body);
    if (data != null) {
      getNotifications.value = data;
    }
  }

  acceptSession() async {
    String? userId = await _cacheService.getUserId();

    Map<String, dynamic> body = {
      "preBookSession_id": getNotifications.first.preBookSessionId,
      "user_id": getNotifications.first.expertId,
      "expert_id": userId
    };

    bool? data = await NotificationService().acceptSession(body);
    if (data == true) {
      Get.snackbar("success", "accept Successfully");
    }
  }

  //cancel Session

  cancelSession() async {
    String? userId = await _cacheService.getUserId();

    Map<String, dynamic> body = {
      "preBookSession_id": getNotifications.first.preBookSessionId,
      "user_id": getNotifications.first.expertId,
      "expert_id": userId
    };

    bool? data = await NotificationService().cancelSession(body);
    if (data == true) {
      Get.snackbar("success", "accept Successfully");
    }
  }
}
