import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/Utility/app_back_btn.dart';
import 'package:recess/Utility/text_field_with_header.dart';
import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/controllers/settings/my_details_controller.dart';

class MyDetailsScreen extends StatelessWidget {
  MyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MyDetailsController controller = Get.put(MyDetailsController());
    return PopScope(
      onPopInvoked: (didPop) {
        controller.clearterrortext();
      },
      child: Scaffold(
        backgroundColor: AppColors.appBg,
        appBar: AppBar(
          backgroundColor: AppColors.appBg,
          leadingWidth: 100,
          leading: AppBackBtn(),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: AppColors.appBg,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My details',
                      style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Recoleta,
                        fs: 26,
                        fontType: AppFont.Bold,
                        color: Colors.black,
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: controller.showUpdateButton.value,
                        child: GestureDetector(
                          onTap: () {
                            controller.updateUserDetails();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding:
                                EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                            child: Text(
                              'Update',
                              style: GetAppFont.getInstance().addStyle(
                                name: AppFont.Avenir,
                                fs: 16,
                                fontType: AppFont.Medium,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Divider(height: 1),
                SizedBox(height: 10),
                txtFieldWithheader(
                  txtController: controller.nameController,
                  headerTxt: 'Name',
                  hintTxt: 'Name',
                  svgPath: AppImages.editIcon,
                  isRightSvg: true,
                  onChanged: (value) {
                    controller.showUpdateButton.value = true;
                  },
                ),
                Obx(
                  () => txtFieldWithheader(
                    txtController: controller.emailController,
                    headerTxt: 'Email address',
                    hintTxt: 'Email',
                    svgPath: AppImages.editIcon,
                    isRightSvg: true,
                    errorMessage: controller.errorMessage.value,
                    onChanged: (value) {
                      controller.showUpdateButton.value = true;
                    },
                  ),
                ),
                Obx(
                  () => txtFieldWithheader(
                    txtController: controller.passwordController,
                    headerTxt: 'Password',
                    hintTxt: 'Password',
                    svgPath: controller.isObscure.value
                        ? AppImages.passwordSee
                        : AppImages.passwordHide,
                    isRightSvg: true,
                    isObscure: controller.isObscure.value,
                    onTapSuffix: () {
                      controller.isObscure.value = !controller.isObscure.value;
                    },
                    readOnly: true,
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    controller.clearterrortext();
                    controller.onTapChangePassword();
                  },
                  child: Row(children: [
                    Text('Change password',
                        style: GetAppFont.getInstance().addStyle(
                            name: AppFont.Avenir,
                            fs: 14,
                            fontType: AppFont.SemiBold,
                            color: Colors.black)),
                    SvgPicture.asset(AppImages.forwardIcon)
                  ]),
                ),
                SizedBox(height: 20),
                Divider(height: 1),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
