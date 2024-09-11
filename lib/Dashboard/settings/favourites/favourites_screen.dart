import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Dashboard/settings/favourites/favourites_experts_screen.dart';
import 'package:recess/Dashboard/settings/favourites/favourites_subjects_screen.dart';
import 'package:recess/Utility/app_back_btn.dart';
import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/controllers/settings/favourites_subjects_controller.dart';

class FavouritesScreen extends GetWidget<FavouritesExpertController> {
  FavouritesScreen({super.key});
  final FavouritesExpertController controller =
      Get.put(FavouritesExpertController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.goToTab(0);
    });
    return Scaffold(
      backgroundColor: AppColors.appBg,
      appBar: AppBar(
        backgroundColor: AppColors.appBg,
        leadingWidth: 100,
        leading: AppBackBtn(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: _buildText(context),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: _tabWidget(context),
          ),
          Expanded(
            child: Container(
                width: MediaQuery.of(context).size.width,
                color: AppColors.appBg,
                child: PageView(
                    onPageChanged: controller.goToTab,
                    controller: controller.pageController,
                    children: [
                      FavouritesExpertScreen(),
                      FavouritesSubjectScreen(),
                    ])),
          )
        ],
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Favourites',
          style: GetAppFont.getInstance().addStyle(
            name: AppFont.Recoleta,
            fs: 26,
            fontType: AppFont.Bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12),
        Text(
            "View your bookmarked Experts and Subjects in this \n section to get quick access to them.",
            style: GetAppFont.getInstance().addStyle(
                fs: 13,
                height: 1.1,
                fontType: AppFont.Medium,
                name: AppFont.Avenir,
                color: Colors.black)),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.only(right: 25),
          child: Divider(
            color: Color(0XFF18181826),
            thickness: 1.0,
          ),
        ),
      ],
    );
  }

  Widget _tabWidget(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(children: [
              Obx(() => AppButton(
                    cornerRadius: 5,
                    title: "Experts",
                    borderColor: Colors.black,
                    backgroundColor: controller.currentTab.value == 0
                        ? Colors.black
                        : AppColors.appBg,
                    titleColor: controller.currentTab.value == 0
                        ? Colors.white
                        : Colors.black,
                    isIcon: false,
                    image: '',
                    iconColor: controller.currentTab.value == 0
                        ? Colors.white
                        : Colors.black,
                    onTap: () {
                      controller.goToTab(0);
                    },
                    showPrefixIcon: true,
                    addStandardMargin: false,
                  )),
              const SizedBox(width: 13),
              Obx(() => AppButton(
                    cornerRadius: 5,
                    title: "Subjects",
                    borderColor: Colors.black,
                    backgroundColor: controller.currentTab.value == 1
                        ? Colors.black
                        : AppColors.appBg,
                    titleColor: controller.currentTab.value == 1
                        ? Colors.white
                        : Colors.black,
                    isIcon: false,
                    image: '',
                    iconColor: controller.currentTab.value == 1
                        ? Colors.white
                        : Colors.black,
                    onTap: () {
                      controller.goToTab(1);
                    },
                    showPrefixIcon: true,
                    addStandardMargin: false,
                  )),
            ]),
          ),
        ],
      ),
    );
  }
}
