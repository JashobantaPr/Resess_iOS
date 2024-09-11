import 'package:get/get.dart';
import 'package:recess/core/cache.service.dart';
import 'package:recess/main.dart';
import 'package:recess/routes/app_routes.dart';
import 'package:recess/service/settings_service.dart';

class DeleteAccountController extends GetxController {
  CacheService _cacheService = CacheService();

  var isLoading = false.obs;

  Future<void> deleteAccount() async {
    String? userId = await CacheService().getUserId();

    isLoading.value = true;
    Map<String, dynamic>? response =
        await SettingsService().deleteAccount(userId);
    isLoading.value = false;
    // Get.back();

    if (response != null && response["Status"] == true) {
      _cacheService.removeAll();
      Get.toNamed(AppRoutes.splashScreen);

      // Get.snackbar("Success", response["message"] ?? '',
      //     duration: const Duration(seconds: 1));
      // await Future.delayed(const Duration(seconds: 2));
    } else {
      String message = response?["message"] ?? "Failed to delete account";
      // Get.snackbar("Error", message, duration: const Duration(seconds: 1));
      // await Future.delayed(const Duration(seconds: 2));
    }
  }

  userDeleteAccount() async {
    bool? result = await SettingsService().DeleteAccount();
    if (result == true) {
      _cacheService.removeAll();
      Get.toNamed(AppRoutes.splashScreen);
    }
  }
}
