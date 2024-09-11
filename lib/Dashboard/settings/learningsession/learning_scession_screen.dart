import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:recess/Dashboard/settings/learningsession/upcoming_learning_session_screen.dart';
import 'package:recess/Utility/app_back_btn.dart';
import 'package:recess/Utility/item_tab.dart';
import 'package:recess/controllers/settings/learning_session_controller.dart';

import '../../../Auth/login_options_screen.dart';
import '../../../Utility/AppImages.dart';
import '../../../app_constants/app_colors.dart';
import 'past_learning_session_screen.dart';

class LearningSessionScreen extends GetWidget<LearningSessionController> {
  LearningSessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBg,
          leadingWidth: 100,
          leading: AppBackBtn(),
          actions: [
            Container(
              padding: EdgeInsets.only(right: 15),
              // color: Colors.brown,
              // height: 60,
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        padding: EdgeInsets.only(right: 4),
                        child:
                            SvgPicture.asset(AppImages.walletIcon, width: 25)),
                    Text(
                      "Calendar settings",
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Recoleta,
                          fs: 14,
                          fontType: AppFont.SemiBold,
                          color: Colors.black),
                    ),
                    Container(
                        padding: EdgeInsets.only(bottom: 4),
                        child:
                            SvgPicture.asset(AppImages.forwardIcon, width: 15))
                  ],
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: AppColors.appBg,
            padding: EdgeInsets.only(left: 25, right: 25),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Obx(
              () => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Learner sessions',
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Recoleta,
                          fs: 26,
                          fontType: AppFont.Bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 15),

                    Row(
                      children: [
                        _buildUpcomingButton(
                            isActive: controller.viewType.value ==
                                LeraningSessionViewType.upcoming),
                        SizedBox(
                          width: 20,
                        ),
                        _buildPastButton(
                            isActive: controller.viewType.value ==
                                LeraningSessionViewType.past),
                        Spacer(),
                        Image.asset(
                          "assets/images/searchIcon.png",
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    if (controller.viewType.value ==
                        LeraningSessionViewType.upcoming)
                      Expanded(child: UpcomingLearningSessionScreen()),

                    if (controller.viewType.value ==
                        LeraningSessionViewType.past)
                      Expanded(child: PastLearningSessionScreen()),
                    // _tabWidget(context),
                    // Expanded(
                    //   child: Container(
                    //       width: MediaQuery.of(context).size.width,
                    //       color: AppColors.appBg,
                    //       // height: MediaQuery.of(context).size.height  - 220,
                    //       child: PageView(
                    //           onPageChanged: controller.goToTab,
                    //           controller: controller.pageController,
                    //           children: [
                    //             UpcomingLearningSessionScreen(),
                    //             PastLearningSessionScreen(),
                    //             SearchLearningSessionScreen(),
                    //           ])),
                    // )
                    SizedBox(
                      height: 80,
                    ),
                  ]),
            ),
          ),
        ));
  }

  Widget _tabWidget(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            AppButton(
                cornerRadius: 5,
                title: "UpComing",
                borderColor: Colors.black,
                backgroundColor: controller.currentTab.value == 0
                    ? Colors.black
                    : AppColors.appBg,
                titleColor: controller.currentTab.value == 0
                    ? Colors.white
                    : Colors.black,
                isIcon: true,
                image: '',
                iconColor: controller.currentTab.value == 0
                    ? Colors.white
                    : Colors.black,
                onTap: () {
                  controller.goToTab(0);
                },
                showPrefixIcon: true,
                addStandardMargin: false),
            SizedBox(width: 10),
            AppButton(
                cornerRadius: 5,
                title: "Past",
                borderColor: Colors.black,
                backgroundColor: controller.currentTab.value == 1
                    ? Colors.black
                    : AppColors.appBg,
                titleColor: controller.currentTab.value == 1
                    ? Colors.white
                    : Colors.black,
                isIcon: true,
                image: '',
                iconColor: controller.currentTab.value == 1
                    ? Colors.white
                    : Colors.black,
                onTap: () {
                  controller.goToTab(1);
                },
                showPrefixIcon: true,
                addStandardMargin: false),
          ]),
          IconButton(
              onPressed: () {
                !controller.searchActive.value
                    ? controller.goToTab(2)
                    : {
                        controller.searchActive.value = false,
                        controller.goToTab(controller.currentTab.value)
                      };
              },
              icon: (controller.searchActive.value)
                  ? Icon(Icons.cancel)
                  : Icon(Icons.search))
        ],
      ),
    );
  }

  //upcoming Button

  Widget _buildUpcomingButton({bool isActive = false}) {
    return TabItem(
        cornerRadius: 5,
        title: "Upcoming",
        borderColor: AppColors.btnBlack,
        backgroundColor: isActive ? AppColors.btnBlack : AppColors.white,
        titleColor: isActive ? AppColors.white : AppColors.btnBlack,
        isIcon: false,
        image: "",
        iconColor: Colors.transparent,
        onTap: () {
          controller.changeProfileViewType(LeraningSessionViewType.upcoming);
          controller.userUpcomingBookingData();
        },
        showPrefixIcon: false,
        addStandardMargin: false);
  }

  Widget _buildPastButton({bool isActive = false}) {
    return TabItem(
        cornerRadius: 5,
        width: 100,
        title: "Past",
        borderColor: AppColors.btnBlack,
        backgroundColor: isActive ? AppColors.btnBlack : AppColors.white,
        titleColor: isActive ? AppColors.white : AppColors.btnBlack,
        isIcon: false,
        image: "",
        iconColor: Colors.transparent,
        onTap: () {
          controller.changeProfileViewType(LeraningSessionViewType.past);
          controller.userPastBookingData();
        },
        showPrefixIcon: false,
        addStandardMargin: false);
  }
}
