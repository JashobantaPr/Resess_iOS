import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Dashboard/main_dashboard_screen.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/Utility/get_prefs.dart';
import 'package:recess/app_constants/app_colors.dart';

import 'package:recess/network_services/app_consts.dart';

import 'controllers/splashController.dart';

class SplashScreen extends GetWidget<SplashScreenController> {
  const SplashScreen({super.key});

  void _initialization(BuildContext context) async {
    if (GetPrefs.containsKey(GetPrefs.isLoggedIn)) {
      bool isLoggedIn = GetPrefs.getBool(GetPrefs.isLoggedIn);
      String userId = GetPrefs.getString(AppConst.userId);
    }
    GetPrefs.setInt(AppConst.homePageNumber, 0);
    Timer(const Duration(seconds: 4), () {
      Get.offAll(MainDashboardScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    _initialization(context); // Call initialization method when building

    return Scaffold(
      backgroundColor: AppColors.appBg,
      body: Stack(
        children: [
          Image.asset(
            AppImages.splashBg,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          TweenAnimationBuilder(
            curve: Curves.bounceInOut,
            duration: Duration(seconds: 2),
            tween: Tween<double>(begin: 10, end: 40),
            builder: (context, value, child) {
              return Center(
                child: Text("recess.",
                    style: GetAppFont.getInstance().addStyle(
                        fs: value,
                        fontType: AppFont.Bold,
                        name: AppFont.Recoleta,
                        color: Colors.black)),
              );
            },
          )
        ],
      ),
    );
  }
}
