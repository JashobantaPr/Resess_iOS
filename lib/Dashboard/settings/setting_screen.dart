import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:recess/Auth/login_options_screen.dart';

import 'package:recess/Utility/AppImages.dart';

import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/controllers/settings/change_password_controller.dart';

import '../../controllers/settings/favourites_subjects_controller.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  ChangePasswordController controller = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBg,
      appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.appBg,
          centerTitle: false,
          title: Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'settings',
              style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Recoleta,
                  fs: 32,
                  fontType: AppFont.Bold,
                  color: Colors.black),
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.appBg,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              (controller.userId.value == null ||
                      controller.userProfileStatus.value == false)
                  ? _buildUserLoginButton()
                  : Container(),
              SizedBox(
                width: 40,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(height: 1),
                  itemCount: controller.settingsList.length,
                  itemBuilder: (context, index) {
                    SettingsModel item = controller.settingsList[index];

                    // if ((item.id == "logout" || item.id == "delete_account") &&
                    //     controller.userId.value == null) {
                    //   return const SizedBox.shrink();
                    // }
                    return InkWell(
                      onTap: () {
                        controller.onTapSetting(item.id);
                        // Then, find the FavouritesExpertController and call getBookmarkedUserById
                        FavouritesExpertController favouritesController =
                            Get.find<FavouritesExpertController>();
                        favouritesController.getBookmarkedUserById();
                      },
                      child: ListTile(
                        leading: SvgPicture.asset(item.icon),
                        title: Text(
                          item.text,
                          style: GetAppFont.getInstance().addStyle(
                              name: AppFont.Avenir,
                              fs: 16,
                              fontType: AppFont.Medium,
                              color: Colors.black),
                        ),
                        trailing: SvgPicture.asset(AppImages.forwardIcon),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  //SignInButton

  Widget _buildUserLoginButton() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(LoginOptionsScreen());
          },
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.rectangle,
                border: Border.all(width: 1.5, color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      offset: Offset(-3, 3),
                      blurRadius: 1)
                ]),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/settings/signinicon.png",
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Sign in to your Account",
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 14,
                        fontType: AppFont.Medium,
                        color: Colors.white),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: SvgPicture.asset(
                      AppImages.forwardIcon,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
