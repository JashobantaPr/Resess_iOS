// import 'package:get/state_manager.dart';

// class ExpertSettingController extends GetxController {
//   // Define an observable variable to store admin status
//   // RxString adminStatus = ''.obs;

//   @override
//   void onInit() {
//     super.onInit();
//   }

//   // Retrieve and update the admin status from cache
//   Future<void> getAdminStatus() async {
//     // final storedAdminStatus = await GetPrefs.getString(ADMINSTATUS);
//     // if (storedAdminStatus == null || storedAdminStatus.isEmpty) {
//     //   print('No admin status found.');
//     //   adminStatus.value =
//     //       'No Status'; // Optional: set a default value if no status is found
//     // } else {
//     //   adminStatus.value = storedAdminStatus; // Update the observable variable
//     //   print('Retrieved Admin Status: ${adminStatus.value}');
//     // }
//   }

//   // Fetch expert settings from the server and store the admin status
//   Future<void> getExpertSettingById() async {
//     //   String? userId = await CacheService().getUserId();
//     //   String? authToken = await CacheService().getAuthToken();

//     //   var headers = {
//     //     "Content-Type": "application/json",
//     //     "Authorization": 'Bearer $authToken'
//     //   };

//     //   var request =
//     //       http.Request('POST', Uri.parse('${Url.baseUrl}/getBexomeExpertById'));
//     //   request.body = json.encode({"expert_id": userId});
//     //   request.headers.addAll(headers);

//     //   http.StreamedResponse response = await request.send();

//     //   if (response.statusCode == 200) {
//     //     final responseData = json.decode(await response.stream.bytesToString());

//     //     if (responseData != null && responseData['Status'] == true) {
//     //       final fetchedAdminStatus = responseData['data'][0]['adminStatus'];

//     //       // Store the fetched admin status in the cache and update the observable variable
//     //       GetPrefs.setString(AppConst.adminStatus, fetchedAdminStatus);
//     //       adminStatus.value = fetchedAdminStatus;

//     //       print('Admin Status stored: ${adminStatus.value}');
//     //     } else {
//     //       print('Failed to fetch expert settings: ${responseData['message']}');
//     //     }
//     //   } else {
//     //     print('Request failed with status: ${response.statusCode}');
//     //     print('Reason: ${response.reasonPhrase}');
//     //   }
//     // }
//   }
// }
