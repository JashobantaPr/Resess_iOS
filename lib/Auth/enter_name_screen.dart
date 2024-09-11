import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:recess/Auth/login_options_screen.dart';

import 'package:recess/app_constants/app_pm_standards.dart';
import 'package:recess/controllers/auth/complete_onboard_controller.dart';

import '../Utility/text_field_with_header.dart';
import '../app_constants/app_colors.dart';
import '../components/cancel_back_header.dart';

class EnterNameScreen extends StatelessWidget {
  EnterNameScreen({super.key});

  CompleteOnboardController controller = Get.put(CompleteOnboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.grey,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.grey,
          toolbarHeight: 30,
          leading: null,
          automaticallyImplyLeading: false,
        ),
        body: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: AppColors.newGrey,
              boxShadow: [
                BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: Offset(0, -4),
                    color: Colors.black.withOpacity(0.25))
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            padding: EdgeInsets.only(
                top: 28,
                left: AppPMStandards.shared.leftPadding,
                right: AppPMStandards.shared.leftPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CancelBackHeader(),
                SizedBox(height: 20),
                Text(
                  'What’s your name?',
                  style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Recoleta,
                      fs: 26,
                      fontType: AppFont.Bold,
                      color: Colors.black),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    txtFieldWithheader(
                      txtController: controller.txtController,
                      headerTxt: 'Name',
                      hintTxt: 'Enter here',
                      subHeaderText:
                          'You can always edit your name later in Settings.',
                      showSubHeader: true,
                    ),
                    Obx(() => controller.errorMessage.isNotEmpty
                        ? Row(
                            children: [
                              Text(
                                controller.errorMessage.value,
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          )
                        : Container()),
                    Row(
                      children: [
                        Container(
                          width: 200,
                          margin: EdgeInsets.only(top: 20),
                          child: AppButton(
                            cornerRadius: 10,
                            leftIcon: Icons.add,
                            title: 'Continue',
                            borderColor: Colors.transparent,
                            backgroundColor: Colors.black,
                            titleColor: Colors.white,
                            isIcon: false,
                            image: '',
                            iconColor: Colors.transparent,
                            onTap: () {
                              controller.UserCreatePassword();
                            },
                            showPrefixIcon: false,
                            addStandardMargin: false,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
