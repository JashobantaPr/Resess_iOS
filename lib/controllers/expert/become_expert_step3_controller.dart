import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Dashboard/expert/onboard/become_expert_step4.dart';
import '../../Utility/get_prefs.dart';

import '../../core/cache.service.dart';
import '../../network_services/app_consts.dart';
import '../../service/become_an_expertprofile_service.dart';
import 'become_expert_step1_controller.dart';
import 'become_expert_step2_controller.dart';

class BecomeExpertStep3Controller extends GetxController {
  final CacheService _cacheService = CacheService();
  final becomeExpert1Controller = Get.find<BecomeExpertStep1Controller>();

  final becomeExpert2Controller = Get.find<BecomeExpertStep2Controller>();
  RxList<PlatformFile> docArr = <PlatformFile>[].obs;

  RxList<String> documentPaths = <String>[].obs;

  Future<dynamic> fileUpload() async {
    // Fetch the current document URLs from preferences
    List<String> documentUrls =
        GetPrefs.getString(AppConst.documents).split(",") ?? [];

    // Add the names of the selected documents to the list
    documentUrls.addAll(docArr.map((file) => file.name));

    // Join the list into a single string
    final docArrString = documentUrls.join(',');

    // Store the updated document URLs back into preferences
    GetPrefs.setString(AppConst.documents, docArrString);
  }

  Future<void> addDocuments() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'pdf',
          'doc',
          'docx',
          'txt',
        ],
      );

      if (result == null) return;
      for (var file in result.files) {
        String? path = await BecomeAnExpertProfileService()
            .uploadImageOrDocuments(file.path!);
        if (path != null) {
          documentPaths.add(path); // Store each document path in the list
        }
      }
    } catch (e) {
      print(e);
    }
  }

  addExpertProfile() async {
    String? userId = await _cacheService.getUserId();
    List<String> subjectsList =
        becomeExpert1Controller.subjectTxtController.text.split(',');

    Map<String, dynamic> body = {
      "user_id": userId,
      "name": becomeExpert1Controller.nameTxtController.text,
      "mySubject": subjectsList,
      "languages": becomeExpert1Controller.langTxtController.text,
      "yourOneLiner": becomeExpert1Controller.oneLineBioTxtController.text,
      "amount": becomeExpert1Controller.priceTxtController.text,
      "bio": becomeExpert1Controller.bioTxtController.text,
      "socialMediaLinks": becomeExpert2Controller.getLinkTexts(),
      "preferredSessionType": becomeExpert1Controller.selectedSessions,
      "linkToYourBio": becomeExpert1Controller.linkTxtController.text,
      "image": becomeExpert1Controller.imagePath.value,
      "attachmentProof": becomeExpert2Controller.documentPaths,
      "attachmentIDProof": documentPaths,
    };
    bool? result = await BecomeAnExpertProfileService().addExpertProfile(body);
    if (result == true) {
      Get.to(BecomeExpertStep4());
    }
  }
}

    // var filePaths = docArr.value.map((e) => e.path);
    // var getToken = GetPrefs.getString(AppConst.token);
    // DioClientImp.Dio dio = DioClientImp.Dio();
    // List<DioClientImp.MultipartFile> multipartImageList = [];
    // for (var f in docArr.value) {
    //   var pic = await DioClientImp.MultipartFile.fromFile(
    //     f.path ?? "",
    //     filename: f.name,
    //   );

    //   multipartImageList.add(pic);
    // }

    // DioClientImp.FormData formData = DioClientImp.FormData.fromMap(
    //     {"documents": multipartImageList});
    // final response = await DioClient.instance.post(ApiEndpoints.uploadDocs,data:formData,contentType: 'multipart');
    // print(response);
    // try {
    //   var resp = UploadDocOutputModel.fromJson(response);

    //   if (resp.response?.status == true) {
    //     print('Response, ${resp.response?.message}!');
    //     List<String> documentUrls = GetPrefs.getString(AppConst.documents).split(",");
    //     documentUrls.addAll(resp.data?.documents ?? []);
    //     final docArrString = documentUrls?.reduce((value, element) => value + ',' + element);
    //     GetPrefs.setString(
    //         AppConst.documents, docArrString ?? "");
    //     GetPrefs.setString(
    //         AppConst.docUrl, resp.data!.endpoint ?? "");
    //   }
    // } catch (e) {
    //   print(e);
    //   Get.snackbar("Error", e.toString());
    // }
    // return response;
  