import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/Utility/item_tab.dart';
import 'package:recess/app_constants/app_pm_standards.dart';
import 'package:recess/controllers/expert/become_expert_step1_controller.dart';

import '../../../Auth/login_options_screen.dart';
import '../../../Utility/app_back_btn.dart';
import '../../../Utility/text_field_with_header.dart';
import '../../../Utility/txtFieldWithHeaderM.dart';
import '../../../app_constants/app_colors.dart';

class BecomeExpertStep1 extends StatelessWidget {
  BecomeExpertStep1({super.key});

  final BecomeExpertStep1Controller controller =
      Get.put(BecomeExpertStep1Controller());

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
                    "Step 1/4",
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
                  "Set up your Expert profile",
                  style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Avenir,
                      fs: 16,
                      fontType: AppFont.SemiBold,
                      color: Colors.black),
                ),
                SizedBox(height: 10),
                Text(
                  "Once verified, you can choose to edit these details at anytime from your Expert portal.",
                  style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Avenir,
                      fs: 13,
                      fontType: AppFont.Medium,
                      color: Colors.black),
                ),
                SizedBox(height: 28),
                InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return bottomSheet(context);
                          });
                    },
                    child: controller.selectedImagePath.value == null
                        ? SvgPicture.asset(AppImages.addImageIcon, width: 125)
                        : Container(
                            width: 125.0,
                            height: 125.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: FileImage(
                                      File(controller.selectedImagePath.value!),
                                    ))))),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return bottomSheet(context);
                        });
                  },
                  child: Text(
                    "+ Add image",
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 14,
                        fontType: AppFont.SemiBold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 29),
                txtFieldWithheader(
                    headerTxt: 'Name',
                    hintTxt: 'Name',
                    txtController: controller.nameTxtController),
                SizedBox(height: 20),

                // Inside your widget
                Obx(() {
                  return Column(
                    children: [
                      txtFieldWithheader(
                        expOnboard: true,
                        txtController: controller.subjectTxtController,
                        iconRight: Icon(CupertinoIcons.search),
                        showRightIcon: true,
                        headerTxt: 'Choose your area of expertise',
                        hintTxt: 'Search for a subject',
                        isRightSvg: true,
                        svgPath: AppImages.searchIcon,
                        marginBottom:
                            controller.isEditingSubject.value ? 15 : 15,
                        onTap: () {
                          controller.isEditingSubject.value = true;
                          controller.searchSubjects(
                              controller.subjectTxtController.text);
                        },
                        validator: (value) {
                          controller.isEditingLanguage.value = false;
                          value!.isEmpty
                              ? controller.isEditingSubject.value = false
                              : controller.isEditingSubject.value = true;
                          controller.searchSubjects(value);
                        },
                      ),

                      // DROP DOWN
                      controller.isEditingSubject.value &&
                              controller.filteredSubjectsList.isNotEmpty
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                color: AppColors.appGray,
                              ),
                              height: 200,
                              child: ListView.builder(
                                  itemCount:
                                      controller.filteredSubjectsList.length,
                                  itemBuilder: (context, position) {
                                    return InkWell(
                                      onTap: () {
                                        controller.isEditingSubject.value =
                                            false;
                                        controller.subjectTxtController
                                            .text = controller
                                                .filteredSubjectsList[position]
                                                .subject ??
                                            "";
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          controller
                                                  .filteredSubjectsList[
                                                      position]
                                                  .subject ??
                                              "",
                                          style: GetAppFont.getInstance()
                                              .addStyle(
                                                  name: AppFont.Avenir,
                                                  fs: 14,
                                                  fontType: AppFont.Medium,
                                                  color: Colors.black),
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          : Container(height: 0),
                    ],
                  );
                }),
                SizedBox(height: 20),

                Obx(() {
                  return Column(
                    children: [
                      // Text Field with Header
                      txtFieldWithheader(
                        expOnboard: true,
                        txtController: controller.langTxtController,
                        onTap: () {
                          controller.isEditingLanguage.value = true;
                        },
                        validator: (value) {
                          controller.searchLanguages(value ?? '');
                          return null;
                        },
                        marginBottom:
                            controller.isEditingLanguage.value ? 15 : 15,
                        iconRight: Icon(CupertinoIcons.search),
                        showRightIcon: true,
                        headerTxt: 'What languages do you speak?',
                        hintTxt: 'Search for a language',
                        isRightSvg: true,
                        svgPath: AppImages.searchIcon,
                        onTapOut: (value) {
                          // Optional: Handle tap out if needed
                        },
                      ),

                      // Language Dropdown
                      controller.isEditingLanguage.value
                          ? Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                color: AppColors.appGray,
                              ),
                              height: 200,
                              child: ListView.builder(
                                itemCount: controller.filteredLanguages.length,
                                itemBuilder: (context, position) {
                                  var language =
                                      controller.filteredLanguages[position];
                                  return InkWell(
                                    onTap: () {
                                      controller.isEditingLanguage.value =
                                          false;
                                      controller.toggleLanguageSelection(
                                        language.id ?? '',
                                        language.languages ?? [],
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        language.languages?.first ?? '',
                                        style: GetAppFont.getInstance()
                                            .addStyle(
                                                name: AppFont.Avenir,
                                                fs: 14,
                                                fontType: AppFont.Medium,
                                                color: Colors.black),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Container(height: 0),
                    ],
                  );
                }),

                SizedBox(height: 20),
                txtFieldWithheader(
                    expOnboard: true,
                    txtController: controller.oneLineBioTxtController,
                    showSubHeader: true,
                    subHeaderText:
                        'Add a catchy one-liner to showcase what you do and your area of expertise to potential learners.',
                    headerTxt: 'Your one-liner',
                    hintTxt: 'Example: PhD in Behavioural Science'),
                SizedBox(height: 20),
                txtFieldWithheader(
                    expOnboard: true,
                    txtController: controller.priceTxtController,
                    txtInputType: TextInputType.number,
                    headerTxt: 'Price per minute (USD)',
                    hintTxt: '\$1'),
                SizedBox(height: 20),
                txtFieldWithheaderM(
                    expOnboard: true,
                    txtController: controller.bioTxtController,
                    headerTxt: 'Bio',
                    hintTxt:
                        'Share your background and expertise. We also recommend adding something personal so Learners get an insight into your personality.',
                    txtFieldHeight: 120,
                    lines: 4),
                SizedBox(height: 20),
                txtFieldWithheader(
                    expOnboard: true,
                    txtController: controller.linkTxtController,
                    showSubHeader: true,
                    txtInputType: TextInputType.url,
                    validator: (value) {
                      controller.validateUrl(value!);
                    },
                    marginBottom: !controller.isValidUrl.value ? 4 : 15,
                    subHeaderText:
                        'Add any URL to your bio such as to your social media account or video so Learners can get to know you better.',
                    headerTxt: 'Add a link to your bio',
                    hintTxt: 'https://example.com'),
                !controller.isValidUrl.value
                    ? Text(
                        "", //Enter a valid link,
                        style: GetAppFont.getInstance().addStyle(
                            name: AppFont.Avenir,
                            fs: 12,
                            fontType: AppFont.Medium,
                            color: AppColors.red),
                      )
                    : Container(height: 0),
                SizedBox(height: 10),
                Divider(height: 1),
                SizedBox(height: 20),
                Text('Preferred session types',
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 14,
                        fontType: AppFont.SemiBold,
                        color: Colors.black)),
                SizedBox(height: 20),

                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (var session in typeOfSession.values)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: _buildSessionButton(
                              sessionType: session,
                              isActive:
                                  controller.selectedSessions.contains(session),
                            ),
                          )
                      ],
                    )),

                // Obx(() => Row(
                //       children: [

                //         // _buildChatButton(
                //         //     isActive: controller.viewType.value ==
                //         //         typeOfSession.chat),
                //         // SizedBox(
                //         //   width: 5,
                //         // ),
                //         // _buildCallButton(
                //         //     isActive: controller.viewType.value ==
                //         //         typeOfSession.call),
                //         // SizedBox(
                //         //   width: 5,
                //         // ),
                //         // _buildVideoButton(
                //         //     isActive: controller.viewType.value ==
                //         //         typeOfSession.video)
                //       ],
                //     )),
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
                        controller.tappedContinue();
                      },
                      showPrefixIcon: false,
                      addStandardMargin: false),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          const Text(
            "Choose profile photo",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                controller.chooseImage(source: ImageSource.camera);

                Navigator.pop(context);
              },
              icon: const Icon(
                // <-- Icon
                Icons.camera,
                size: 24.0,
                color: Colors.black,
              ),
              label: Text(
                'Camera',
                style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Avenir,
                    fs: 14,
                    fontType: AppFont.Medium,
                    color: Colors.black),
              ), // <-- Text
            ),
            const SizedBox(width: 10),
            ElevatedButton.icon(
              onPressed: () {
                controller.chooseImage(source: ImageSource.gallery);

                Navigator.pop(context);
              },
              icon: const Icon(
                // <-- Icon
                Icons.image,
                size: 24.0,
                color: Colors.black,
              ),
              label: Text(
                'Gallery',
                style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Avenir,
                    fs: 14,
                    fontType: AppFont.Medium,
                    color: Colors.black),
              ), // <-- Text
            ),
          ])
        ],
      ),
    );
  }

  //preferred seesion types
  Widget _buildChatButton({bool isActive = false}) {
    return TabItem(
        addEdgeInsets: EdgeInsets.all(0),
        cornerRadius: 5,
        title: "Chat",
        width: 80,
        borderColor: AppColors.btnBlack,
        backgroundColor: isActive ? AppColors.btnBlack : AppColors.white,
        titleColor: isActive ? AppColors.white : AppColors.btnBlack,
        isIcon: false,
        image: AppImages.chatIcon1,
        iconColor: isActive ? AppColors.white : AppColors.btnBlack,
        onTap: () {
          controller.changetypeOfSession(typeOfSession.chat);
        },
        showPrefixIcon: true,
        addStandardMargin: false);
  }

  Widget _buildCallButton({bool isActive = false}) {
    return TabItem(
        addEdgeInsets: EdgeInsets.all(0),
        cornerRadius: 5,
        width: 80,
        title: "Call",
        borderColor: AppColors.btnBlack,
        backgroundColor: isActive ? AppColors.btnBlack : AppColors.white,
        titleColor: isActive ? AppColors.white : AppColors.btnBlack,
        isIcon: false,
        image: AppImages.callIcon,
        iconColor: isActive ? AppColors.white : AppColors.btnBlack,
        onTap: () {
          controller.changetypeOfSession(typeOfSession.call);
        },
        showPrefixIcon: true,
        addStandardMargin: false);
  }

  Widget _buildVideoButton({bool isActive = false}) {
    return TabItem(
        addEdgeInsets: EdgeInsets.all(0),
        cornerRadius: 5,
        width: 80,
        title: "Video",
        borderColor: AppColors.btnBlack,
        backgroundColor: isActive ? AppColors.btnBlack : AppColors.white,
        titleColor: isActive ? AppColors.white : AppColors.btnBlack,
        isIcon: false,
        image: AppImages.videoIcon,
        iconColor: isActive ? AppColors.white : AppColors.btnBlack,
        onTap: () {
          controller.changetypeOfSession(typeOfSession.video);
        },
        showPrefixIcon: true,
        addStandardMargin: false);
  }

  Widget _buildSessionButton({
    required typeOfSession sessionType,
    required bool isActive,
  }) {
    String label = '';
    String imagePath = "";
    switch (sessionType) {
      case typeOfSession.chat:
        label = 'Chat';
        imagePath = AppImages.chatIcon;
        break;
      case typeOfSession.call:
        label = 'Call';
        imagePath = AppImages.callIcon;
        break;
      case typeOfSession.video:
        label = 'Video';
        imagePath = AppImages.videoIcon;
        break;
    }

    return TabItem(
        addEdgeInsets: EdgeInsets.all(0),
        cornerRadius: 5,
        width: 80,
        title: label,
        borderColor: AppColors.btnBlack,
        backgroundColor: isActive ? AppColors.btnBlack : AppColors.white,
        titleColor: isActive ? AppColors.white : AppColors.btnBlack,
        isIcon: false,
        image: imagePath,
        iconColor: isActive ? AppColors.white : AppColors.btnBlack,
        onTap: () {
          controller.toggleSession(sessionType);
        },
        showPrefixIcon: true,
        addStandardMargin: false);
  }
}
