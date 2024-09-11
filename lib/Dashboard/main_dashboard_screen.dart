import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Dashboard/expert/expert_profile.dart';
import 'package:recess/Dashboard/expert/onboard/expert_screen.dart';
import 'package:recess/Dashboard/expert/onboard/verfication_status_pending_screen.dart';
import 'package:recess/Dashboard/expert/onboard/verification_rejected_screen.dart';
import 'package:recess/Dashboard/expert/onboard/verification_success_screen.dart';
import 'package:recess/Dashboard/settings/setting_screen.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/Utility/responsive.dart';
import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/controllers/main_dashboard_controller.dart';

import '../controllers/home_controller.dart';
import 'Home/home_screen.dart';

class MainDashboardScreen extends StatelessWidget {
  MainDashboardScreen({super.key});

  final MainDashboardController controller = Get.put(MainDashboardController());
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Responsive.getSize(context) == ScreenSize.mobile ||
              Responsive.getSize(context) == ScreenSize.kMobile
          ? MobileDashBoard()
          : Responsive.getSize(context) == ScreenSize.tab
              ? WebDashBoard(
                  isTablet: true,
                )
              : WebDashBoard(),
    );
  }
}

class WebDashBoard extends StatelessWidget {
  bool? isTablet;

  WebDashBoard({super.key, this.isTablet = false});

  final MainDashboardController controller = Get.find();

  Widget _webTabBarItem(BuildContext context, {required page, required label}) {
    return MaterialButton(
      onPressed: () {
        controller.goToTab(page);
      },
      child: Container(
        decoration: controller.currentPage.value == page
            ? BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 2)),
                borderRadius: BorderRadius.all(Radius.circular(2)))
            : null,
        child: Text(label,
            style: GetAppFont.getInstance().addStyle(
                name: AppFont.Avenir,
                fs: 20,
                fontType: AppFont.SemiBold,
                color: AppColors.btnBlack)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appBg,
      padding: Responsive.getSize(context) == ScreenSize.kMobile
          ? EdgeInsets.symmetric(vertical: 77, horizontal: 120)
          : EdgeInsets.all(5),
      child: Scaffold(
        backgroundColor: AppColors.appBg,
        appBar: Responsive.getSize(context) == ScreenSize.tab ||
                Responsive.getSize(context) == ScreenSize.desktop
            ? AppBar(
                titleSpacing: 0.0,
                automaticallyImplyLeading: false,
                leadingWidth: 0,
                backgroundColor: AppColors.appBg,
                centerTitle: false,
                title: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Obx(
                    () => Text(
                      controller.currentPage.value == 0
                          ? "recess."
                          : controller.currentPage.value == 1
                              ? "expert."
                              : "settings.",
                      textAlign: TextAlign.start,
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Recoleta,
                          fs: 56,
                          fontType: AppFont.Bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                actions: [
                  Obx(() => _webTabBarItem(context, page: 0, label: "Home")),
                  SizedBox(width: 80),
                  Obx(() => _webTabBarItem(context, page: 1, label: "Expert")),
                  SizedBox(width: 80),
                  Obx(() =>
                      _webTabBarItem(context, page: 2, label: "Settings")),
                ],
              )
            : AppBar(
                toolbarHeight: 0,
              ),
        body: Obx(
          () => controller.expertPageChange.value
              ? PageView(
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: controller.goToTab,
                  controller: controller.pageController,
                  children: [
                      HomeScreen(),
                      controller.getExpertWidget() ?? ExpertScreen(),
                      SettingScreen()
                    ])
              : PageView(
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: controller.goToTab,
                  controller: controller.pageController,
                  children: [
                      HomeScreen(),
                      controller.getExpertWidget() ?? ExpertScreen(),
                      SettingScreen()
                    ]),
        ),
      ),
    );
  }
}

class MobileDashBoard extends StatelessWidget {
  MobileDashBoard({super.key});

  final MainDashboardController controller = Get.find();
  // final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    // controller.adminStatus.value =
    //     homeController.profiles.first.adminStatus ?? "";
    // print('controller.adminStatus.value${controller.adminStatus.value}');
    print('controller.adminStatus.value${controller.adminStatus.value}');

    return Scaffold(
      backgroundColor: AppColors.appBg,
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(color: AppColors.appBg, boxShadow: [
          BoxShadow(
              offset: Offset(0, -4),
              blurRadius: 4,
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0)
        ]),
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _bottomAppBarItem(context,
                  icon: AppImages.homeIcon, page: 0, label: "Home"),
              _bottomAppBarItem(context,
                  icon: AppImages.teacherIcon, page: 1, label: "Teacher"),
              _bottomAppBarItem(context,
                  icon: AppImages.settingIcon, page: 2, label: "Setting")
            ],
          ),
        ),
      ),
      body: Obx(
        () => controller.expertPageChange.value
            ? PageView(
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: controller.goToTab,
                controller: controller.pageController,
                children: [
                    HomeScreen(),
                    controller.getExpertWidget() ?? ExpertScreen(),
                    SettingScreen()
                  ])
            : PageView(
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: controller.goToTab,
                controller: controller.pageController,
                children: [
                    HomeScreen(),
                    (controller.adminStatus.isNotEmpty)
                        ? (controller.adminStatus.first.adminStatus ==
                                "pending")
                            ? VerificationStatusPendingScreen()
                            : (controller.adminStatus.first.adminStatus ==
                                    "rejected")
                                ? VerificationRejectedScreen()
                                : (controller.adminStatus.first.adminStatus ==
                                            "approved" &&
                                        controller.adminStatus.first.status ==
                                            false)
                                    ? VerificationScuccessScreen()
                                    : (controller.adminStatus.first
                                                    .adminStatus ==
                                                "approved" &&
                                            controller
                                                    .adminStatus.first.status ==
                                                true)
                                        ? ExpertProfile()
                                        : ExpertScreen()
                        : ExpertScreen(), // or any default screen if `adminStatus` is empty
                    SettingScreen()
                  ]),
      ),
    );
  }

  Widget _bottomAppBarItem(BuildContext context,
      {required icon, required page, required label}) {
    return InkWell(
      onTap: () {
        controller.goToTab(page);
      },
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width / 3 - 15,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            controller.currentPage.value == page
                ? Container(
                    height: 2,
                    width: 37,
                    color: Colors.black,
                  )
                : Container(
                    height: 2,
                    width: 37,
                    color: Colors.transparent,
                  ),
            const SizedBox(height: 4),
            SvgPicture.asset(icon),
          ],
        ),
      ),
    );
  }
}
