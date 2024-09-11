import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:recess/Auth/login_options_screen.dart';

import 'package:recess/Dashboard/common/expert_detail_screen.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:responsive_design/responsive_design.dart';

import '../../Utility/custom_avatar.dart';
import '../../Utility/expert_list_item.dart';
import '../../Utility/item_tab.dart';
import '../../Utility/responsive.dart';
import '../../app_constants/app_colors.dart';
import '../../app_constants/app_pm_standards.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../controllers/home_controller.dart';
import '../../models/home_screen_model/approve_expert_profiles.model.dart';

RxDouble getWidth = 0.0.obs;

class ChatListScreen extends StatelessWidget {
  String type;

  ChatListScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      phone: !kIsWeb
          ? MobileChatListScreen(
              type: type,
            )
          : Responsive.getSize(context) == ScreenSize.kMobile
              ? MobileChatListScreen(type: type)
              : WebChatListScreen(
                  type: type,
                ),
      desktop: WebChatListScreen(
        type: type,
      ),
      tablet: WebChatListScreen(
        isTablet: true,
        type: type,
      ),
    );
  }
}

class MobileChatListScreen extends StatelessWidget {
  String type;

  MobileChatListScreen({super.key, required this.type});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    getWidth.value = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.appBg,
      body: Obx(() {
        if (controller.showNoDataMessage.value) {
          return Center(
            child: Text(
              "No Data Available",
              style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Recoleta,
                  fs: 32,
                  fontType: AppFont.Bold,
                  color: Colors.black),
            ),
          );
        } else {
          return ListView.builder(
            padding: EdgeInsets.only(bottom: 50),
            itemBuilder: (context, index) {
              ApprovedExpertProfileModel item =
                  controller.filteredProfiles[index];
              return InkWell(
                onTap: () {},
                child: Container(
                  color: AppColors.appBg,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ExpertListItem(
                    type: type,
                    position: index,
                    profiles: item,
                  ),
                ),
              );
            },
            itemCount: controller.filteredProfiles.length,
          );
        }
      }),
    );
  }
}

class WebChatListScreen extends StatelessWidget {
  String type;
  bool? isTablet;

  WebChatListScreen({super.key, required this.type, this.isTablet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBg,
      appBar: AppBar(toolbarHeight: 0),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.only(bottom: 100, top: 30),
              height: MediaQuery.of(context).size.height,
              child: Wrap(
                children: [
                  Divider(),
                  SizedBox(height: 50),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.count(
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      crossAxisCount:
                          Responsive.getSize(context) == ScreenSize.mobile
                              ? 1
                              : Responsive.getSize(context) == ScreenSize.tab
                                  ? 2
                                  : 3,
                      crossAxisSpacing: 50.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: 2.7,
                      // Generate 100 widgets that display their index in the List.
                      children: List.generate(100, (index) {
                        return FittedBox(
                          child: InkWell(
                            onTap: () {
                              Get.to(ExpertDetailScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          AppPMStandards.shared.cardCorner)),
                                  border: false == true
                                      ? Border.all(
                                          width: 1,
                                          color: AppColors.cardStroke
                                              .withOpacity(0.15))
                                      : null,
                                  color: AppColors.white,
                                  boxShadow: [
                                    false == true
                                        ? BoxShadow(
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                            color:
                                                Colors.black.withOpacity(0.25),
                                            blurRadius: 2)
                                        : BoxShadow()
                                  ]),
                              // margin: EdgeInsets.only(left: 2, right: 2),
                              // padding: EdgeInsets.only(left: 14, right: 13, top: 12, bottom: 13),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 80,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomAvatar(radius: 40, imageUrl: ""),
                                        RatingStars(
                                          value: 5.0,
                                          starCount: 5,
                                          starSize: 14,
                                          valueLabelVisibility: false,
                                          starColor: AppColors.starColor,
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          '1034 Sessions',
                                          style: GetAppFont.getInstance()
                                              .addStyle(
                                                  name: AppFont.Avenir,
                                                  fs: 10,
                                                  fontType: AppFont.SemiBold,
                                                  color: AppColors.btnBlack),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // 1 row
                                      Container(
                                        // color: Colors.brown,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 200,
                                              child: const Text(
                                                "Linda Anderson",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: "avenir",
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Container(
                                              width: 50,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                      AppImages.tickBadgeIcon),
                                                  SizedBox(width: 5),
                                                  SvgPicture.asset(
                                                      AppImages.redBadgeIcon)
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      SizedBox(height: 10),

                                      //   2 row
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: 200,
                                            child: Text(
                                                "PhD in Behavioural Science\nSpeaks English, French",
                                                overflow: TextOverflow.clip,
                                                style: GetAppFont.getInstance()
                                                    .addStyle(
                                                        name: AppFont.Avenir,
                                                        fs: 12,
                                                        fontType:
                                                            AppFont.Medium,
                                                        color: AppColors
                                                            .btnBlack) //TextStyle(fontSize: 12,fontFamily: "avenir",fontWeight: FontWeight.w500,color: AppColors.btnBlack),
                                                ),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            '\$10/min',
                                            style: GetAppFont.getInstance()
                                                .addStyle(
                                                    name: AppFont.Recoleta,
                                                    height: 2,
                                                    fs: 14,
                                                    fontType: AppFont.SemiBold,
                                                    color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      //   3 row

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          TabItem(
                                              addEdgeInsets: EdgeInsets.only(
                                                  left: 8, right: 8),
                                              cornerRadius: 4,
                                              title: 0 % 2 == 0
                                                  ? 'Hypnotherapy'
                                                  : 'Business',
                                              height: 28,
                                              fontType: AppFont.SemiBold,
                                              fontSize: 12,
                                              borderColor: Colors.transparent,
                                              backgroundColor: false != true
                                                  ? Color(0xFFEAEAEA)
                                                  : AppColors.btnBlack,
                                              titleColor: false != true
                                                  ? Colors.black
                                                  : AppColors.white,
                                              isIcon: false,
                                              suffixImage:
                                                  AppImages.forwardIcon,
                                              suffixIconHeight: 10,
                                              suffixIconWidth: 10,
                                              showSuffixIcon: false,
                                              image: '',
                                              iconColor: false != true
                                                  ? Colors.black
                                                  : AppColors.white,
                                              onTap: () {},
                                              showPrefixIcon: false,
                                              addStandardMargin: false),

                                          SizedBox(width: 80),
                                          // Chat Button
                                          TabItem(
                                              addEdgeInsets: EdgeInsets.all(0),
                                              width: 77,
                                              height: 28,
                                              cornerRadius: 4,
                                              leftIcon: Icons.add,
                                              title: false == true
                                                  ? "Online"
                                                  : type == 'chat'
                                                      ? 'Chat now'
                                                      : type == 'call'
                                                          ? 'Call now'
                                                          : 'Video call',
                                              fontType: AppFont.SemiBold,
                                              fontSize: 12,
                                              borderColor: AppColors.darkGreen,
                                              backgroundColor: Colors.white,
                                              titleColor: AppColors.darkGreen,
                                              isIcon: false,
                                              image: '',
                                              iconColor: Colors.black,
                                              onTap: () {},
                                              showPrefixIcon: false,
                                              addStandardMargin: false),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            )
          ])),
        ],
      ),
    );
  }
}
