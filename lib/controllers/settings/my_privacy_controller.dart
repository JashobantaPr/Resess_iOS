import 'package:get/get.dart';
import 'package:recess/core/cache.service.dart';
import 'package:recess/service/settings_service.dart';

class MyPrivacyController extends GetxController {
  RxBool isSwitched = false.obs;
  RxBool isSwitched1 = false.obs;
  RxBool isSwitched2 = false.obs;
  var isLoading = false.obs;

  void tappedSwitch(bool switched) {
    isSwitched.value = switched;
  }

  void tappedSwitch1(bool switched) {
    isSwitched1.value = switched;
  }

  void tappedSwitch2(bool switched) {
    isSwitched2.value = switched;
  }

  Future<void> getmyprivacy() async {
    print('its getmyprivacy');
    String? userId = await CacheService().getUserId();
    print('userIduserId$userId');
    Map<String, dynamic> mapdata = {
      "user_id": userId ?? "",
    };
    isLoading.value = true;
    Map<String, dynamic>? response =
        await SettingsService().getmyprivacy(mapdata);
    isLoading.value = false;

    if (response != null && response["Status"] == true) {
      print(response['data']);

      isSwitched.value = response['data']['chatHistory'];
      isSwitched1.value = response['data']['voiceCallRecordings'];
      isSwitched2.value = response['data']['vedioCallRecordings'];

      // Get.snackbar("Success", "Privacy settings updated successfully");
    } else {
      // Show error message
      String message =
          response?["message"] ?? "Failed to update privacy settings";
      // Get.snackbar("Error", message);
    }
  }

//post api edhe call madu
  Future<void> setPrivacy() async {
    print('its came');
    String? userId = await CacheService().getUserId();
    print('userIduserId$userId');

    Map<String, dynamic> mapdata = {
      "user_id": userId ?? "",
      "chatHistory": isSwitched.value,
      "voiceCallRecordings": isSwitched1.value,
      "vedioCallRecordings": isSwitched2.value,
    };
    isLoading.value = true;
    Map<String, dynamic>? response =
        await SettingsService().setPrivacy(mapdata);
    isLoading.value = false;

    if (response != null && response["Status"] == true) {
      // Handle success, show success message or navigate to another screen
      // Get.snackbar("Success", "Privacy settings updated successfully");
    } else {
      // Show error message
      String message =
          response?["message"] ?? "Failed to update privacy settings";
      // Get.snackbar("Error", message);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getmyprivacy();
    print('vbxnbdn');
    super.onInit();
  }
}
