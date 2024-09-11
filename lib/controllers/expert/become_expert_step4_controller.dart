import 'package:get/get.dart';
import 'package:recess/core/cache.service.dart';

import '../../Auth/enter_email_screen.dart';
import '../../Dashboard/expert/onboard/verfication_status_pending_screen.dart';
import '../../Dashboard/expert/onboard/verification_rejected_screen.dart';
import '../../Dashboard/expert/onboard/verification_success_screen.dart';
import '../../Utility/get_prefs.dart';
import '../../models/exper_model/admin_status_model.dart';
import '../../network_services/app_consts.dart';
import '../../service/become_an_expertprofile_service.dart';

class BecomeExpertStep4Controller extends GetxController {
  final CacheService _cacheService = CacheService();
  RxList<AdminStatusModel> adminStatus = <AdminStatusModel>[].obs;
  Rx<LoadingState> loadingState = LoadingState.Loaded.obs;
  List<String> paymentMethods = ["Stripe", "PayPal", "Bank"];
  continueTapped() {
    GetPrefs.setInt(AppConst.homePageNumber, 1);
    GetPrefs.setString(AppConst.paymentMethod, "Stripe, PayPal, Bank");
    // setExpertProfile();
  }

  // Future<void> setExpertProfile() async {
  //   String? userId = await CacheService().getUserId();
  //   String? authToken = await CacheService().getAuthToken();

  //   loadingState.value = LoadingState.Loading;
  //   print('userId: $userId');

  //   // Prepare input data
  //   final spokenLanguages =
  //       GetPrefs.getString(AppConst.spokenLanguages)?.split(',') ?? [];
  //   final subject = GetPrefs.getString(AppConst.subject);
  //   final profilePicture = GetPrefs.getString(AppConst.profilePicture);
  //   final oneLineBio = GetPrefs.getString(AppConst.oneLineBio);
  //   final pricePerMinute =
  //       GetPrefs.getString(AppConst.pricePerMinute)?.toString() ?? '';
  //   final bio = GetPrefs.getString(AppConst.bio);
  //   final bioLink = GetPrefs.getString(AppConst.bioLink);
  //   final sessionTypes =
  //       GetPrefs.getString(AppConst.sessionTypes)?.split(',') ?? [];
  //   final documents = GetPrefs.getString(AppConst.documents)?.split(',') ?? [];
  //   final supportingUrls =
  //       GetPrefs.getString(AppConst.supportingUrls)?.split(',') ?? [];
  //   final name = GetPrefs.getString(AppConst.userName);

  //   var headers = {
  //     "Content-Type": "application/json",
  //     "Authorization": 'Bearer $authToken'
  //   };

  //   var request =
  //       http.Request('POST', Uri.parse('${Url.baseUrl}/becomeAnExpertProfile'));
  //   request.body = json.encode({
  //     "user_id": userId,
  //     "name": name,
  //     "area": "Bangalore",
  //     "languages": spokenLanguages.join(','),
  //     "yourOneLiner": oneLineBio,
  //     "amount": pricePerMinute,
  //     "bio": bio,
  //     "socialMediaLinks": supportingUrls.join(','),
  //     "preferredSessionType": sessionTypes.join(','),
  //     "linkToYourBio": bioLink,
  //     "image": profilePicture,
  //     "attachmentProof": documents,
  //     "attachmentIDProof": documents,
  //   });
  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     final responseData = json.decode(await response.stream.bytesToString());
  //     if (responseData != null && responseData['Status'] == true) {
  //       final adminStatus = responseData['data']['adminStatus'];

  //       GetPrefs.setString(
  //           AppConst.adminStatus, responseData['data']['adminStatus']);
  //       if (adminStatus == 'pending') {
  //         Get.to(VerificationStatusPendingScreen());
  //       } else if (adminStatus == 'success') {
  //         Get.to(VerificationScuccessScreen());
  //       } else if (adminStatus == 'reject') {
  //         Get.to(VerificationRejectedScreen());
  //       } else {
  //         print('Unexpected adminStatus value: $adminStatus');
  //       }
  //     } else {
  //       print('Profile submission failed: ${responseData['Message']}');
  //     }
  //   } else {
  //     print('Request failed with status: ${response.statusCode}');
  //     print('Reason: ${response.reasonPhrase}');
  //   }
  // }

  getAdminResponse() async {
    try {
      String? userId = await _cacheService.getUserId();
      Map<String, dynamic> body = {"expert_id": userId};
      List<AdminStatusModel>? data =
          await BecomeAnExpertProfileService().adminStatus(body);
      if (data != null) {
        adminStatus.value = data;
        if (adminStatus.first.adminStatus == "pending") {
          Get.offAll(VerificationStatusPendingScreen());
        } else if (adminStatus.first.adminStatus == "rejected") {
          Get.offAll(VerificationRejectedScreen);
        } else if (adminStatus.first.adminStatus == "approved") {
          Get.offAll(VerificationScuccessScreen());
        } else {
          print("something went wrong");
        }
      }
    } catch (e) {}
  }
}
