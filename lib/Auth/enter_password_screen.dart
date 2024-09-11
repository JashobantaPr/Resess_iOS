import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:recess/Auth/forgot_enter_email_screen.dart';

import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/components/cancel_back_header.dart';

import 'package:recess/controllers/auth/user_login_controller.dart';

import '../Utility/AppImages.dart';

import '../Utility/text_field_with_header.dart';
import '../app_constants/app_colors.dart';

class EnterPasswordScreen extends StatelessWidget {
  EnterPasswordScreen();

  UserLoginController controller = Get.put(UserLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.grey,
        appBar: AppBar(
          backgroundColor: AppColors.grey,
          title: null,
          automaticallyImplyLeading: false,
          // leadingWidth: 100,
          // leading: AppBackBtn(),
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
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CancelBackHeader(),
                SizedBox(height: 20),
                Text(
                  'Enter your password',
                  style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Recoleta,
                      fs: 26,
                      fontType: AppFont.Bold,
                      color: Colors.black),
                ),
                SizedBox(height: 20),
                Obx(
                  () => Column(
                    children: [
                      txtFieldWithheader(
                        txtFieldHeight: 40,
                        txtController: controller.pwdTxtController,
                        svgPath: controller.isObscure.value
                            ? AppImages.passwordSee
                            : AppImages.passwordHide,
                        onTapSuffix: () {
                          controller.isObscure.value =
                              !controller.isObscure.value;
                        },
                        isObscure: controller.isObscure.value,
                        isRightSvg: true,
                        headerTxt: 'Password',
                        hintTxt: 'Enter here',
                      ),
                      Row(
                        children: [
                          if (controller.passwordError.value.isNotEmpty)
                            Text(
                              controller.passwordError.value,
                              style: TextStyle(color: Colors.red),
                            ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 150,
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
                                  if (controller
                                      .pwdTxtController.text.isEmpty) {
                                    controller.passwordError.value =
                                        "Password cannot be empty"; // Set validation error
                                    return;
                                  }

                                  controller.userLogin();
                                },
                                showPrefixIcon: false,
                                addStandardMargin: false),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(ForgotEnterEmailScreen());
                      },
                      child: Row(
                        children: [
                          Text("Forget Password",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.underline)),
                          Spacer(),
                          Text(
                            "Step 2/2",
                            style: TextStyle(
                                fontFamily: 'avenir',
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
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
