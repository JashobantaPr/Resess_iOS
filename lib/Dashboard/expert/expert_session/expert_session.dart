import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Dashboard/expert/expert_session/past_expert_session.dart';
import 'package:recess/Dashboard/expert/expert_session/upcoming_expert_session.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/Utility/app_back_btn.dart';
import 'package:recess/Utility/item_tab.dart';
import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/controllers/expert/expert_session_controller.dart';

class ExpertSessionScreen extends StatelessWidget {
  ExpertSessionScreen({super.key});

  final ExpertSessionController controller = Get.put(ExpertSessionController());

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
        body: Container(
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
                    'Expert sessions',
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Recoleta,
                        fs: 26,
                        fontType: AppFont.Bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 5),
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
                    Expanded(child: UpcomingExpertSession()),
                  if (controller.viewType.value == LeraningSessionViewType.past)
                    Expanded(child: PastExpertSession())
                ]),
          ),
        ));
  }

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
          controller.expertSessionUpcomingData();
        },
        showPrefixIcon: false,
        addStandardMargin: false);
  }

  Widget _buildPastButton({bool isActive = false}) {
    return TabItem(
        cornerRadius: 5,
        width: 100,
        title: "Past",
        borderColor: isActive ? AppColors.btnBlack : AppColors.white,
        backgroundColor: isActive ? AppColors.btnBlack : AppColors.white,
        titleColor: isActive ? AppColors.white : AppColors.btnBlack,
        isIcon: false,
        image: "",
        iconColor: Colors.transparent,
        onTap: () {
          controller.changeProfileViewType(LeraningSessionViewType.past);
        },
        showPrefixIcon: false,
        addStandardMargin: false);
  }
}
