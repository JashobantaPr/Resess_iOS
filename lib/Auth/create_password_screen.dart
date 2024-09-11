import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:recess/Auth/enter_name_screen.dart';
import 'package:recess/Auth/login_options_screen.dart';

import 'package:recess/Utility/get_prefs.dart';

import '../Utility/AppImages.dart';

import '../Utility/text_field_with_header.dart';
import '../app_constants/app_colors.dart';
import '../components/cancel_back_header.dart';
import '../controllers/auth/create_password_controller.dart';

import '../network_services/app_consts.dart';

class CreatePasswordScreen extends StatelessWidget {
  CreatePasswordScreen({super.key});

  RxBool isObscure = true.obs;

  CreatePasswordController controller = Get.put(CreatePasswordController());

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
            // color: AppColors.appBg,
            padding: EdgeInsets.only(top: 28, left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CancelBackHeader(),
                SizedBox(height: 20),
                Container(
                  height: 49,
                  child: Text(
                    'Create a password',
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Recoleta,
                        fs: 26,
                        fontType: AppFont.Bold,
                        color: Colors.black),
                  ),
                ),
                Column(
                  children: [
                    Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          txtFieldWithheader(
                            txtController: controller.txtPwdController,
                            headerTxt: 'Password',
                            showHeader: true,
                            hintTxt: 'Password',
                            showSubHeader: true,
                            subHeaderText:
                                'You need to use a minimum of eight characters and at least one uppercase letter for your password.',
                            svgPath: controller.isObscure.value
                                ? AppImages.passwordSee
                                : AppImages.passwordHide,
                            onTapSuffix: () {
                              controller.isObscure.value =
                                  !controller.isObscure.value;
                            },
                            isObscure: controller.isObscure.value,
                            isRightSvg: true,
                          ),
                          if (controller.errorMessage.value.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                controller.errorMessage.value,
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                        ],
                      ),
                    ),
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
                              if (controller.txtPwdController.text.isEmpty) {
                                controller.errorMessage.value =
                                    "Password cannot be empty";
                                return;
                              }
                              if (controller.txtPwdController.text.length < 8) {
                                controller.errorMessage.value =
                                    "Password should have at least 8 characters";
                                return;
                              }
                              if (!controller.validateStructure(
                                  controller.txtPwdController.text)) {
                                controller.errorMessage.value =
                                    "Enter a stronger password";
                                return;
                              }

                              controller.errorMessage.value =
                                  ''; // Clear the error message
                              GetPrefs.setString(AppConst.password,
                                  controller.txtPwdController.text);
                              Get.to(EnterNameScreen());
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

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
