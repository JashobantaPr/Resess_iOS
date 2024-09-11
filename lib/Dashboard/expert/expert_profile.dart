import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Dashboard/expert/expert_session/expert_session.dart';
import 'package:recess/Dashboard/expert/viewexpertprofile/view_expert_profile.dart';
import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/app_constants/app_pm_standards.dart';
import 'package:recess/controllers/expert/expert_profile_controller.dart';
import '../../Utility/AppImages.dart';
import '../../Utility/expert_profile1.dart';

import '../../components/expert/upcoming_past_data_widget.dart';

import '../../models/exper_model/expert_session_upcoming_model.dart';

import 'expert_setting/expert_setting_screen.dart';

class ExpertProfile extends StatelessWidget {
  ExpertProfile({Key? key}) : super(key: key);

  List<String> imagePaths = [
    AppImages.chatIcon,
    AppImages.editIcon,
    AppImages.settingIcon
  ];
  List<String> titleArr = [
    'Expert sessions',
    'Expert profile',
    'Expert settings'
  ];
  final ExpertProfileController controller = Get.put(ExpertProfileController());

  @override
  Widget build(BuildContext context) {
    final ExpertProfileController controller =
        Get.put(ExpertProfileController());

    return Scaffold(
      backgroundColor: AppColors.appBg,
      appBar: AppBar(
        backgroundColor: AppColors.appBg,
        surfaceTintColor: AppColors.appBg,
        title: Padding(
          padding:
              EdgeInsets.only(left: AppPMStandards.shared.leftPadding - 10),
          child: Text(
            "expert.",
            style: GetAppFont.getInstance().addStyle(
                name: AppFont.Recoleta,
                fs: 32,
                fontType: AppFont.Bold,
                color: Colors.black),
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppPMStandards.shared.leftPadding),
            child: Row(
              children: [
                SvgPicture.asset(AppImages.contactSupport, width: 20),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Contact support',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExpertListItem1(
                    bgColor: AppColors.appBg, isDetailPage: true, position: 0),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey, // Border color
                        width: 1.0, // Border width
                      ),
                      borderRadius:
                          BorderRadius.circular(10.0), // Border radius
                      color: Color.fromRGBO(111, 145, 197,
                          0.173), // Background color with transparency
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppImages.online, width: 20),
                        SizedBox(
                            width: 8), // Add spacing between elements if needed
                        Obx(
                          () => Text(controller.isSwitched.value == true
                              ? 'Online'
                              : 'Offline'),
                        ),
                        Spacer(),
                        Container(
                          width: 100,
                          alignment: Alignment.topRight,
                          child: Obx(
                            () => Switch(
                              thumbColor: MaterialStateProperty.all<Color>(
                                AppColors.white,
                              ),
                              activeTrackColor: AppColors.darkGreen,
                              inactiveTrackColor: AppColors.txtHintColor,
                              value: controller.isSwitched.value,
                              onChanged: (bool value) {
                                controller.isSwitched.value = value;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Divider(height: 1),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(height: 1),
                      itemCount: imagePaths.length,
                      itemBuilder: (context, position) {
                        return InkWell(
                          onTap: () {
                            switch (position) {
                              case 0:
                                {
                                  Get.to(ExpertSessionScreen());
                                  break;
                                }
                              case 1:
                                {
                                  Get.to(ViewExpertProfile());
                                  break;
                                }
                              case 2:
                                {
                                  Get.to(ExpertSettingScreen());
                                  break;
                                }
                            }
                          },
                          child: ListTile(
                            leading: SvgPicture.asset(
                              imagePaths[position],
                              width: 24,
                            ),
                            title: Text(
                              titleArr[position],
                              style: GetAppFont.getInstance().addStyle(
                                  name: AppFont.Avenir,
                                  fs: 14,
                                  fontType: AppFont.Medium,
                                  color: Colors.black),
                            ),
                            trailing: SvgPicture.asset(AppImages.forwardIcon),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Divider(height: 1),
                ),
                Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Upcoming sessions",
                        style: GetAppFont.getInstance().addStyle(
                            name: AppFont.Recoleta,
                            fs: 16,
                            fontType: AppFont.SemiBold,
                            color: Colors.black),
                      ),
                      Row(
                        children: [
                          Text(
                            "View all",
                            style: GetAppFont.getInstance().addStyle(
                                name: AppFont.Avenir,
                                fs: 12,
                                fontType: AppFont.SemiBold,
                                color: Colors.black),
                          ),
                          SvgPicture.asset(
                            AppImages.forwardIcon,
                            width: 10,
                            height: 10,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.all(26.0),
                //   width: MediaQuery.of(context).size.width,
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Text(
                //         "You currently have no upcoming sessions.",
                //         style: GetAppFont.getInstance().addStyle(
                //             name: AppFont.Avenir,
                //             fs: 13,
                //             fontType: AppFont.SemiBold,
                //             color: Colors.black),
                //       ),
                //       SizedBox(height: 6),
                //       Text(
                //         "You will be able to see the details of upcoming sessions in this section when learners make a booking or are in line to have a session with you while you appear online.",
                //         style: GetAppFont.getInstance().addStyle(
                //             name: AppFont.Avenir,
                //             fs: 13,
                //             fontType: AppFont.Medium,
                //             color: Colors.black),
                //       )
                //     ],
                //   ),
                // )

                SizedBox(
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: controller.expertUpcomingData
                        .length, // Replace with your item count
                    itemBuilder: (context, index) {
                      ExpertSessionUpcomingModel? item =
                          controller.expertUpcomingData[index];

                      return UpcomingPastDataWidget(item: item);
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
