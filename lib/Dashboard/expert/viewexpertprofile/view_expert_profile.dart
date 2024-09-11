import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/Utility/app_back_btn.dart';

import 'package:recess/Utility/text_field_with_header.dart';
import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/app_constants/app_pm_standards.dart';
import 'package:recess/core/url.dart';

import '../../../Utility/txtFieldWithHeaderM.dart';
import '../../../controllers/expert/view_expert_profile_controller.dart';

class ViewExpertProfile extends StatelessWidget {
  ViewExpertProfile({super.key});
  final ViewExpertProfileController controller =
      Get.put(ViewExpertProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBg,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.appBg,
        leadingWidth: 100,
        leading: AppBackBtn(),
      ),
      body: Obx(
        () => Container(
          padding: EdgeInsets.only(
              left: AppPMStandards.shared.leftPadding,
              right: AppPMStandards.shared.leftPadding),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Text(
                      "Expert profile",
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Recoleta,
                          fs: 25,
                          fontType: AppFont.Bold,
                          color: AppColors.btnBlack),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Before any of your changes are displayed on your public profile, they will go through a review process.",
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Avenir,
                          fs: 13,
                          fontType: AppFont.Medium,
                          color: AppColors.btnBlack),
                    ),
                    SizedBox(height: 20),
                    Divider(height: 0.5),
                    SizedBox(height: 28),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() {
                          return InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return bottomSheet(context);
                                },
                              );
                              controller.showPickerOptions.value =
                                  !controller.showPickerOptions.value;
                            },
                            child: controller.userImage.value != null &&
                                    controller.userImage.value!.path.isNotEmpty
                                ? Container(
                                    width: 125.0,
                                    height: 125.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: FileImage(File(
                                            controller.userImage.value!.path)),
                                      ),
                                    ),
                                  )
                                : (controller.expertProfile.value.data?.profile
                                                ?.image !=
                                            null &&
                                        controller.expertProfile.value.data!
                                            .profile!.image!.isNotEmpty)
                                    ? Container(
                                        width: 125.0,
                                        height: 125.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              '${Url.imageUrl}${controller.expertProfile.value.data?.profile?.image}',
                                            ),
                                          ),
                                        ),
                                      )
                                    : SvgPicture.asset(
                                        AppImages.addImageIcon,
                                        width: 125,
                                      ),
                          );
                        }),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return bottomSheet(context);
                              },
                            );
                            controller.showPickerOptions.value =
                                !controller.showPickerOptions.value;
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(AppImages.editIcon),
                              SizedBox(width: 6),
                              Text(
                                "Change image",
                                style: GetAppFont.getInstance().addStyle(
                                  name: AppFont.Avenir,
                                  fs: 14,
                                  fontType: AppFont.SemiBold,
                                  color: AppColors.btnBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 28),
                    txtFieldWithheader(
                        txtController: controller.nameTxtController,
                        headerTxt: "Name",
                        hintTxt: "Name",
                        showRightIcon: true,
                        svgPath: AppImages.editIcon,
                        isRightSvg: true),
                    SizedBox(height: 28),
                    txtFieldWithheader(
                        txtController: controller.oneLineBioTxtController,
                        headerTxt: "One-line bio",
                        hintTxt: "One-line bio",
                        showRightIcon: true,
                        svgPath: AppImages.editIcon,
                        isRightSvg: true),
                    SizedBox(height: 28),
                    Divider(height: 0.5),
                    SizedBox(height: 23),
                  ],
                ),
              ),

              //Language Section
              Obx(
                () => SliverList(
                  delegate: SliverChildListDelegate([
                    Text(
                      "Languages spoken",
                      style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 14,
                        fontType: AppFont.SemiBold,
                        color: AppColors.btnBlack,
                      ),
                    ),
                    SizedBox(height: 8),
                    Obx(
                      () => ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.langArr.length + 1,
                        itemBuilder: (context, position) {
                          if (position == controller.langArr.length) {
                            return InkWell(
                              onTap: () {
                                controller.addLangEnabled.value =
                                    !controller.addLangEnabled.value;
                              },
                              child: Obx(
                                () => Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  child: Row(
                                    children: [
                                      controller.addLangEnabled.value
                                          ? SvgPicture.asset(
                                              AppImages.cancelRedIcon,
                                              color: AppColors.btnBlack)
                                          : Icon(CupertinoIcons.add, size: 16),
                                      SizedBox(width: 6),
                                      Text(
                                        controller.addLangEnabled.value
                                            ? "Cancel add language"
                                            : "Add a new language",
                                        style:
                                            GetAppFont.getInstance().addStyle(
                                          name: AppFont.Avenir,
                                          fs: 14,
                                          fontType: AppFont.Medium,
                                          color: AppColors.btnBlack,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                          return Container(
                            padding: EdgeInsets.only(top: 4, bottom: 0),
                            child: ListTileTheme(
                              contentPadding: EdgeInsets.all(0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 22,
                                    width: 22,
                                    child: Checkbox(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      value: true,
                                      onChanged: (value) {},
                                      activeColor:
                                          AppColors.checkBoxActiveColor,
                                      checkColor: AppColors.btnBlack,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      controller.langArr[position],
                                      style: GetAppFont.getInstance().addStyle(
                                        name: AppFont.Avenir,
                                        fs: 14,
                                        fontType: AppFont.Medium,
                                        color: AppColors.btnBlack,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(CupertinoIcons.delete,
                                        size: 18, color: AppColors.btnBlack),
                                    onPressed: () {
                                      controller.langArr.removeAt(position);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Language Search
                    controller.addLangEnabled.value
                        ? Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Choose your new language to add",
                                  style: GetAppFont.getInstance().addStyle(
                                    name: AppFont.Avenir,
                                    fs: 14,
                                    fontType: AppFont.SemiBold,
                                    color: AppColors.btnBlack,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextFormField(
                                  onChanged: (value) {
                                    controller.searchLanguages(
                                        value); // Update search query
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Search for a language",
                                    hintStyle:
                                        GetAppFont.getInstance().addStyle(
                                      name: AppFont.Avenir,
                                      fs: 13,
                                      fontType: AppFont.Medium,
                                      color: AppColors.shadowColor,
                                    ),
                                    suffixIcon: Icon(CupertinoIcons.search),
                                    fillColor: AppColors.txtFillColor,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    filled: true,
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4.0)),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4.0)),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4.0)),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0),
                                    ),
                                  ),
                                ),
                                Obx(() {
                                  // Use Obx to reactively rebuild the ListView
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        controller.filteredLanguages.length,
                                    itemBuilder: (context, position) {
                                      final languageData = controller
                                          .filteredLanguages[position];
                                      return GestureDetector(
                                        onTap: () {
                                          // Check if the language is already in the list
                                          if (!controller.langArr.contains(
                                              languageData.languages!
                                                  .join(', '))) {
                                            // Add the selected language to the langArr list
                                            controller.langArr.add(languageData
                                                .languages!
                                                .join(', '));
                                          }
                                          controller.addLangEnabled.value =
                                              false;
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              top: 8, bottom: 8),
                                          child: ListTileTheme(
                                            contentPadding: EdgeInsets.all(0),
                                            child: Row(
                                              children: [
                                                SizedBox(width: 8),
                                                Text(
                                                  languageData.languages
                                                          ?.join(', ') ??
                                                      'No languages',
                                                  style:
                                                      GetAppFont.getInstance()
                                                          .addStyle(
                                                    name: AppFont.Avenir,
                                                    fs: 14,
                                                    fontType: AppFont.Medium,
                                                    color: AppColors.btnBlack,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }),
                              ],
                            ),
                          )
                        : Container(height: 0, width: 0),
                    SizedBox(height: 0),
                    Divider(height: 0.5),
                  ]),
                ),
              ),

              //Subject Section

              Obx(
                () => SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(height: 23),
                    Text(
                      "My subject",
                      style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 14,
                        fontType: AppFont.SemiBold,
                        color: AppColors.btnBlack,
                      ),
                    ),
                    SizedBox(height: 8),
                    Obx(
                      () => ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.selectedSubject.length + 1,
                        itemBuilder: (context, position) {
                          if (position == controller.selectedSubject.length) {
                            return InkWell(
                              onTap: () {
                                controller.changeSubEnabled.value =
                                    !controller.changeSubEnabled.value;
                              },
                              child: Obx(
                                () => Container(
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  child: Row(
                                    children: [
                                      controller.changeSubEnabled.value
                                          ? SvgPicture.asset(
                                              AppImages.cancelRedIcon,
                                              color: AppColors.btnBlack,
                                            )
                                          : SvgPicture.asset(
                                              AppImages.editIcon),
                                      SizedBox(width: 6),
                                      Text(
                                        controller.changeSubEnabled.value
                                            ? "Cancel change subject"
                                            : "Change subject",
                                        style:
                                            GetAppFont.getInstance().addStyle(
                                          name: AppFont.Avenir,
                                          fs: 14,
                                          fontType: AppFont.SemiBold,
                                          color: AppColors.btnBlack,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                          return Container(
                            padding: EdgeInsets.only(top: 8, bottom: 8),
                            child: ListTileTheme(
                              contentPadding: EdgeInsets.all(0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 22,
                                    width: 22,
                                    child: Checkbox(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      value:
                                          controller.selectedSubject.contains(
                                        controller.selectedSubject[position],
                                      ),
                                      onChanged: (value) {
                                        // Handle selection here
                                      },
                                      activeColor:
                                          AppColors.checkBoxActiveColor,
                                      checkColor: AppColors.btnBlack,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    controller.selectedSubject[position],
                                    style: GetAppFont.getInstance().addStyle(
                                      name: AppFont.Avenir,
                                      fs: 14,
                                      fontType: AppFont.Medium,
                                      color: AppColors.btnBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Subject Search
                    controller.changeSubEnabled.value
                        ? Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Choose your new subject of expertise",
                                  style: GetAppFont.getInstance().addStyle(
                                    name: AppFont.Avenir,
                                    fs: 14,
                                    fontType: AppFont.SemiBold,
                                    color: AppColors.btnBlack,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextFormField(
                                  onTap: () {
                                    // Show the entire list when the search field is tapped
                                    controller.filteredSubjectsList.value =
                                        controller.subjectsList;
                                  },
                                  onChanged: (query) {
                                    controller.searchSubjects(
                                        query); // Trigger search logic
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Search for a subject",
                                    hintStyle:
                                        GetAppFont.getInstance().addStyle(
                                      name: AppFont.Avenir,
                                      fs: 13,
                                      fontType: AppFont.Medium,
                                      color: AppColors.shadowColor,
                                    ),
                                    suffixIcon: Icon(CupertinoIcons.search),
                                    fillColor: AppColors.txtFillColor,
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 10,
                                    ),
                                    filled: true,
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4.0)),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4.0)),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4.0)),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0),
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        controller.filteredSubjectsList.length,
                                    itemBuilder: (context, position) {
                                      final subjectData = controller
                                          .filteredSubjectsList[position];
                                      return GestureDetector(
                                        onTap: () {
                                          // Update the selected subject
                                          if (controller
                                              .selectedSubject.isNotEmpty) {
                                            // Deselect previously selected subject
                                            controller.selectedSubject.clear();
                                          }
                                          // Add the new subject
                                          controller.selectedSubject
                                              .add(subjectData.subject ?? '');
                                          controller.toggleSubjectSelection(
                                            subjectData.id!,
                                            subjectData.subject ?? 'No Subject',
                                          );
                                          controller.changeSubEnabled.value =
                                              false;
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              top: 8, bottom: 8),
                                          child: ListTileTheme(
                                            contentPadding: EdgeInsets.all(0),
                                            child: Row(
                                              children: [
                                                SizedBox(width: 8),
                                                Text(
                                                  subjectData.subject ??
                                                      'No Subject',
                                                  style:
                                                      GetAppFont.getInstance()
                                                          .addStyle(
                                                    name: AppFont.Avenir,
                                                    fs: 14,
                                                    fontType: AppFont.Medium,
                                                    color: AppColors.btnBlack,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(width: 0, height: 0),
                    SizedBox(height: 28),
                    Divider(height: 0.5),
                    SizedBox(height: 24),
                  ]),
                ),
              ),
              //Proof of Knowledge
              SliverList(
                  delegate: SliverChildListDelegate([
                Text("Proof of knowledge",
                    style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Avenir,
                      fs: 16,
                      fontType: AppFont.SemiBold,
                      color: AppColors.btnBlack,
                    )),
                SizedBox(height: 10),
                Text(
                    "Add any document that would prove your knowledge of the new language you’re adding.",
                    style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Avenir,
                      fs: 12,
                      fontType: AppFont.Medium,
                      color: AppColors.btnBlack,
                    )),
                SizedBox(height: 12),
                Row(
                  children: [
                    SvgPicture.asset(AppImages.addDoc, width: 125),
                  ],
                ),
                SizedBox(height: 12),
                InkWell(
                  onTap: () async {
                    if (controller.docArr.length == 3) {
                      Get.snackbar("Error",
                          "Please select only 3 documents as mentioned");
                      return;
                    }
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(allowMultiple: true);

                    if (result != null) {
                      List<File> files =
                          result.paths.map((path) => File(path!)).toList();
                      controller.docArr.addAll(result.files);
                      // controller.fileUpload();

                      // files.forEach((element) async {
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
                    } else {
                      // User canceled the picker
                    }
                  },
                  child: Row(
                    children: [
                      const Icon(
                        CupertinoIcons.add,
                        size: 16,
                      ),
                      SizedBox(width: 6),
                      Text(
                        "Add documents",
                        style: GetAppFont.getInstance().addStyle(
                            name: AppFont.Avenir,
                            fs: 14,
                            fontType: AppFont.SemiBold,
                            color: AppColors.btnBlack),
                      ),
                    ],
                  ),
                ),
                controller.docArr.value.isNotEmpty
                    ? Container(
                        height: 190,
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.only(bottom: 20),
                        color: AppColors.appBg,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: controller.docArr.length,
                            itemBuilder: (context, position) {
                              var docuent = controller.docArr[position];
                              return Container(
                                color: AppColors.txtFillColor,
                                padding: const EdgeInsets.all(10),
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
                                              const Icon(
                                                Icons.picture_as_pdf_outlined,
                                                size: 14,
                                              ),
                                              const SizedBox(width: 10),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                child: Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  controller.docArr
                                                      .value[position].name,
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
                                          controller.docArr.removeAt(position);
                                        },
                                        icon: SvgPicture.asset(
                                            AppImages.closeIcon)),
                                  ],
                                ),
                              );
                            }))
                    : Container(height: 0),
                SizedBox(height: 28),
                Divider(height: 0.5)
              ])),

              SliverList(
                  delegate: SliverChildListDelegate([
                const SizedBox(height: 28),
                txtFieldWithheaderM(
                    expOnboard: true,
                    txtController: controller.bioTxtController,
                    headerTxt: 'Bio',
                    hintTxt:
                        'Share your background and expertise. We also recommend adding something personal so Learners get an insight into your personality.',
                    showRightIcon: true,
                    svgPath: AppImages.editIcon,
                    isRightSvg: true,
                    txtFieldHeight: 100,
                    lines: 2),
                const SizedBox(height: 20),
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
                    hintTxt: 'https://example.com',
                    showRightIcon: true,
                    svgPath: AppImages.editIcon,
                    isRightSvg: true),
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
              ])),
              const SliverPadding(padding: EdgeInsets.only(bottom: 20)),

              SliverList(
                  delegate: SliverChildListDelegate([
                Container(
                  width: 200,
                  margin: const EdgeInsets.only(top: 20),
                  child: AppButton(
                      cornerRadius: 10,
                      leftIcon: Icons.add,
                      title: 'Submit',
                      borderColor: Colors.transparent,
                      backgroundColor: Colors.black,
                      titleColor: Colors.white,
                      isIcon: false,
                      image: '',
                      iconColor: Colors.transparent,
                      onTap: () {
                        controller.updateExpertProfile();
                      },
                      showPrefixIcon: false,
                      addStandardMargin: false),
                )
              ])),
              const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
            ],
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
                controller.getFromCamera();
                controller.showPickerOptions.value =
                    !controller.showPickerOptions.value;
                // Navigator.pop(context);
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
                controller.getFromGallery();
                controller.showPickerOptions.value =
                    !controller.showPickerOptions.value;
                // Navigator.pop(context);
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
}
