
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:recess/controllers/expert/become_expert_step3_controller.dart';

import '../../../Auth/login_options_screen.dart';
import '../../../Utility/AppImages.dart';
import '../../../Utility/app_back_btn.dart';
import '../../../app_constants/app_colors.dart';
import '../../../app_constants/app_pm_standards.dart';

class BecomeExpertStep3 extends StatelessWidget {
  BecomeExpertStep3({Key? key}) : super(key: key);

  final BecomeExpertStep3Controller controller =
      Get.put(BecomeExpertStep3Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBg,
      appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.appBg,
          title: null,
          leadingWidth: 126,
          leading: AppBackBtn(),
          actions: [
            Container(
              padding:
                  EdgeInsets.only(right: AppPMStandards.shared.leftPadding),
              // color: Colors.brown,
              // height: 60,
              child: InkWell(
                  onTap: () {},
                  child: Text(
                    "Step 3/4",
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 14,
                        fontType: AppFont.SemiBold,
                        color: Colors.black),
                  )),
            )
          ]),
      body: SingleChildScrollView(
        child: Obx(
          () => Container(
            color: AppColors.appBg,
            padding: EdgeInsets.only(
                top: 12,
                left: AppPMStandards.shared.leftPadding,
                right: AppPMStandards.shared.leftPadding),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Become an Expert",
                  style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Recoleta,
                      fs: 26,
                      fontType: AppFont.Bold,
                      color: Colors.black),
                ),
                SizedBox(height: 10),
                Text(
                  "Proof of identity",
                  style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Avenir,
                      fs: 16,
                      fontType: AppFont.SemiBold,
                      color: Colors.black),
                ),
                SizedBox(height: 28),
                SvgPicture.asset(AppImages.addDoc, width: 125),
                SizedBox(height: 10),
                InkWell(
                    onTap: () async {
                      controller.addDocuments();
                      // if (controller.docArr.length == 1) {
                      //   Get.snackbar("Error",
                      //       "Any one documents ca be added as mentioned");
                      //   return;
                      // }
                      // FilePickerResult? result = await FilePicker.platform
                      //     .pickFiles(allowMultiple: true);

                      // if (result != null) {
                      //   List<File> files =
                      //       result.paths.map((path) => File(path!)).toList();
                      //   controller.docArr.addAll(result.files);
                      //   controller.fileUpload();

                      //   // files.forEach((element) async {
                      //   try {
                      //     if (element != null) {
                      //       final thumbnail = await FilePreview.getThumbnail(
                      //           element.path!,
                      //           width:
                      //               MediaQuery.of(context).size.width / 3 - 24);
                      //       controller.thumbnailArr.add(thumbnail);
                      //
                      //     }
                      //   } catch (e) {
                      //     controller.thumbnailArr.add(Image.asset(""));
                      //   }
                      // });
                      //   } else {
                      //     // User canceled the picker
                      //   }
                    },
                    child: Text(
                      "+ Add document",
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Avenir,
                          fs: 14,
                          fontType: AppFont.SemiBold,
                          color: Colors.black),
                    )),
                SizedBox(height: 28),
                controller.documentPaths.isNotEmpty
                    ? Container(
                        height: 70,
                        padding: const EdgeInsets.all(8.0),
                        margin: EdgeInsets.only(bottom: 20),
                        color: AppColors.appBg,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: controller.documentPaths.length,
                            itemBuilder: (context, position) {
                              return Container(
                                color: AppColors.txtFillColor,
                                padding: EdgeInsets.all(10),
                                height: 50,
                                margin: EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  AppImages.docIcon),
                                              const SizedBox(width: 10),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                child: Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  controller
                                                      .documentPaths[position],
                                                  style: GetAppFont
                                                          .getInstance()
                                                      .addStyle(
                                                          name: AppFont.Avenir,
                                                          fs: 12,
                                                          fontType:
                                                              AppFont.SemiBold,
                                                          color: Colors.black),
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          Container(
                                            height: 5,
                                            decoration: const BoxDecoration(
                                                color: AppColors.progGreen,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(2))),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    IconButton(
                                        onPressed: () {
                                          controller.documentPaths
                                              .removeAt(position);
                                        },
                                        icon: SvgPicture.asset(
                                            AppImages.closeIcon)),
                                  ],
                                ),
                              );
                            }))
                    : Container(height: 0),
                Text('Upload one of the following documents',
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 14,
                        fontType: AppFont.SemiBold,
                        color: Colors.black)),
                SizedBox(height: 10),
                Row(children: [
                  SvgPicture.asset(AppImages.tickOutlinedIcon),
                  Text(' Passport',
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Avenir,
                          fs: 14,
                          fontType: AppFont.Medium,
                          color: Colors.black))
                ]),
                SizedBox(height: 10),
                Row(children: [
                  SvgPicture.asset(AppImages.tickOutlinedIcon),
                  Text(' National ID card',
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Avenir,
                          fs: 14,
                          fontType: AppFont.Medium,
                          color: Colors.black))
                ]),
                SizedBox(height: 10),
                Row(children: [
                  SvgPicture.asset(AppImages.tickOutlinedIcon),
                  Text(' Driver’s licence',
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Avenir,
                          fs: 14,
                          fontType: AppFont.Medium,
                          color: Colors.black))
                ]),
                SizedBox(height: 10),
                Row(children: [
                  SvgPicture.asset(AppImages.tickOutlinedIcon),
                  Text(' Birth certificate',
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Avenir,
                          fs: 14,
                          fontType: AppFont.Medium,
                          color: Colors.black))
                ]),
                SizedBox(height: 10),
                Row(children: [
                  SvgPicture.asset(AppImages.tickOutlinedIcon),
                  Text(' Citizenship certificate',
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Avenir,
                          fs: 14,
                          fontType: AppFont.Medium,
                          color: Colors.black))
                ]),
                SizedBox(height: 28),
                Divider(height: 1),
                SizedBox(height: 28),
                Container(
                  width: 150,
                  child: AppButton(
                      cornerRadius: 5,
                      title: 'Continue',
                      borderColor: Colors.black,
                      backgroundColor: Colors.black,
                      titleColor: Colors.white,
                      isIcon: false,
                      image: '',
                      iconColor: Colors.black,
                      onTap: () {
                        controller.addExpertProfile();
                      },
                      showPrefixIcon: false,
                      addStandardMargin: false),
                ),
                SizedBox(height: 50)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
