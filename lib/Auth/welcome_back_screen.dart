// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:recess/Dashboard/main_dashboard_screen.dart';
import 'package:recess/Utility/AppImages.dart';


import '../app_constants/app_colors.dart';
import 'login_options_screen.dart';

class WelcomeBackScreen extends StatelessWidget {
  String? userName = "";
  WelcomeBackScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        backgroundColor: AppColors.grey,
        toolbarHeight: 40,
        leading: null,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: AppColors.appBg,
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
        padding: EdgeInsets.only(top: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 49,
              child: Text("recess.",
                  style: GetAppFont.getInstance().addStyle(
                      fs: 32,
                      fontType: AppFont.Bold,
                      name: AppFont.Recoleta,
                      color: Colors.black)),
            ),
            Container(
              height: 36,
              child: Text("Welcome back, $userName.",
                  style: GetAppFont.getInstance().addStyle(
                      fs: 20,
                      height: 2.7,
                      fontType: AppFont.Medium,
                      name: AppFont.Recoleta,
                      color: Colors.black)),
            ),
            SizedBox(height: 36),
            RotatedBox(
                quarterTurns: 1,
                child: SvgPicture.asset(AppImages.wavesIcon,
                    height: 200, width: 200)),
            SizedBox(height: 48),
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
                    Get.offAll(MainDashboardScreen());
                  },
                  showPrefixIcon: false,
                  addStandardMargin: false),
            )
          ],
        ),
      ),
    );
  }
}
