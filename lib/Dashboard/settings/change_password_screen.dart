import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/controllers/settings/change_password_controller.dart';
import '../../Utility/app_back_btn.dart';
import '../../Utility/text_field_with_header.dart';
import '../../app_constants/app_colors.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChangePasswordController controller = Get.put(ChangePasswordController());
    return PopScope(
      onPopInvoked: (didPop) {
        controller.clearTextFields();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBg,
          leadingWidth: 100,
          leading: AppBackBtn(),
        ),
        body: Container(
          color: AppColors.appBg,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Change your password',
                style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Recoleta,
                  fs: 26,
                  fontType: AppFont.Bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'You need to use a minimum of eight characters and at least one uppercase letter for your password.',
                style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Avenir,
                  fs: 12,
                  fontType: AppFont.Medium,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Obx(
                () => txtFieldWithheader(
                  txtController: controller.txtPwdController,
                  headerTxt: 'Current password',
                  hintTxt: 'Current password',
                  svgPath: controller.isObscurePassword.value
                      ? AppImages.passwordSee
                      : AppImages.passwordHide,
                  isRightSvg: true,
                  isObscure: controller.isObscurePassword.value,
                  onTapSuffix: () {
                    controller.isObscurePassword.value =
                        !controller.isObscurePassword.value;
                  },
                  errorMessage: controller.errorMessage.value,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => txtFieldWithheader(
                  txtController: controller.txtConPwdController,
                  headerTxt: 'New password',
                  hintTxt: 'New password',
                  svgPath: controller.isObscureConfirmPassword.value
                      ? AppImages.passwordSee
                      : AppImages.passwordHide,
                  isRightSvg: true,
                  isObscure: controller.isObscureConfirmPassword.value,
                  onTapSuffix: () {
                    controller.isObscureConfirmPassword.value =
                        !controller.isObscureConfirmPassword.value;
                  },
                  errorMessage: controller.errorOldMessage.value,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 120,
                child: AppButton(
                  cornerRadius: 4,
                  title: 'Submit',
                  borderColor: Colors.black,
                  backgroundColor: Colors.black,
                  titleColor: Colors.white,
                  isIcon: false,
                  image: '',
                  iconColor: Colors.black,
                  onTap: () {
                    controller.changePassword();
                    // Get.back(result: true);
                  },
                  showPrefixIcon: false,
                  addStandardMargin: false,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
