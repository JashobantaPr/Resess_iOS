import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recess/Auth/login_options_screen.dart';

import 'package:recess/Utility/AppImages.dart';

import 'package:recess/app_constants/app_pm_standards.dart';

import '../Utility/text_field_with_header.dart';
import '../app_constants/app_colors.dart';
import '../components/cancel_back_header.dart';
import '../controllers/auth/forgot_email_controller.dart';

class ForgotEnterEmailScreen extends StatelessWidget {
  ForgotEnterEmailScreen({super.key});

  ForgotEmailController controller = Get.put(ForgotEmailController());

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
      body: Obx(
        () => ClipRRect(
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
                SizedBox(height: 40),
                Container(
                  child: Text(
                    'Enter your email?',
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Recoleta,
                        fs: 26,
                        fontType: AppFont.Bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 12),
                Container(
                    child: Text(
                  'We verify all accounts to create a genuine learning community with real Learners and Experts.',
                  style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Avenir,
                      fs: 13,
                      fontType: AppFont.Medium,
                      color: Colors.black),
                )),
                SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    txtFieldWithheader(
                      txtInputType: TextInputType.emailAddress,
                      txtController: controller.forgotEmailController,
                      headerTxt: 'Email address',
                      hintTxt: 'Enter here',
                    ),
                    Obx(() => controller.isEmailValid.value
                        ? Container()
                        : Text(
                            'Please enter a valid email',
                            style: TextStyle(color: Colors.red),
                          )),
                    Obx(() => controller.validationMessage.value.isEmpty
                        ? Container()
                        : Text(
                            controller.validationMessage.value,
                            style: TextStyle(color: Colors.red),
                          )),
                    Container(
                      width: 150,
                      margin: EdgeInsets.only(top: 20),
                      child: AppButton(
                        isEnabled: controller.isButtonEnable.value,
                        cornerRadius: 10,
                        leftIcon: Icons.add,
                        title: 'Continue',
                        borderColor: Colors.transparent,
                        backgroundColor: Colors.black,
                        titleColor: Colors.white,
                        isIcon: false,
                        image: '',
                        iconColor: Colors.transparent,
                        onTap: () async {
                          await controller.validateEmail();
                          if (controller.isEmailValid.value) {
                            controller.forgotEmailId();
                            // Navigate to the next screen if needed
                            // Get.to(() => VerifyEmailScreen(email: controller.emailTxtController.text, otp: "123456"));
                          }
                        },
                        showPrefixIcon: false,
                        addStandardMargin: false,
                      ),
                    ),
                  ],
                ),

                Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: SvgPicture.asset(AppImages.iconLock)),
                              SizedBox(width: 10),
                              Flexible(
                                fit: FlexFit.loose,
                                child: Text(
                                  softWrap: false,
                                  'We won’t share this information with anyone and\nit will remain confidential',
                                  style: GetAppFont.getInstance().addStyle(
                                      name: AppFont.Avenir,
                                      fs: 12,
                                      fontType: AppFont.Medium,
                                      color: Colors.black),
                                ),
                              ),
                            ])))),
                // CustomInputTextField(hint: 'Enter here', prefixImage: '', showPrefix: false, suffixImage: '', showSuffix: false, isIcon: false, iconData: null,)
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum LoadingState { Loading, Loaded }
