import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:recess/Utility/get_prefs.dart';

import 'package:recess/network_services/app_consts.dart';

import '../../Dashboard/expert/onboard/become_expert_step3.dart';
import '../../service/become_an_expertprofile_service.dart';

class BecomeExpertStep2Controller extends GetxController {
  RxList<PlatformFile> docArr = <PlatformFile>[].obs;

  RxList<Widget> thumbnailArr = <Widget>[].obs;
  TextEditingController link1TxtController = TextEditingController();
  TextEditingController link2TxtController = TextEditingController();
  TextEditingController link3TxtController = TextEditingController();

  // Creating a list of TextEditingController values as strings
  List<String> linkTexts = [];

  List<String> getLinkTexts() {
    return [
      link1TxtController.text,
      link2TxtController.text,
      link3TxtController.text
    ];
  }

  RxList<String> documentPaths = <String>[].obs;

  List<String> titleArr = [
    "education\nqualification",
    "employment\ncontracts",
    "recommedation\nletter"
  ];

  void tappedContinue() {
    List<String> supportingUrls = [];
    supportingUrls.add(link1TxtController.text);
    supportingUrls.add(link2TxtController.text);
    supportingUrls.add(link3TxtController.text);
    final supportUrlArrString =
        supportingUrls.reduce((value, element) => value + ',' + element);
    GetPrefs.setString(AppConst.supportingUrls, supportUrlArrString);
    Get.to(BecomeExpertStep3());
  }

  Future<dynamic> fileUpload() async {
    GetPrefs.setString(
        AppConst.documents, docArr.value.map((e) => e.path).toString());
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

  @override
  void onInit() {
    super.onInit();
  }
}
