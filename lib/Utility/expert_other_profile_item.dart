import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:recess/Utility/item.tabs.dart';
import 'package:recess/Utility/item_tab.dart';
import 'package:recess/app_constants/app_pm_standards.dart';
import 'package:recess/controllers/home_controller.dart';
import 'package:recess/core/url.dart';

import '../Auth/login_options_screen.dart';

import '../Dashboard/home/digital_marketing_screen.dart';
import '../app_constants/app_colors.dart';
import '../models/home_screen_model/approve_expert_profiles.model.dart';
import 'AppImages.dart';

class ExpertOtherProfileItem extends StatelessWidget {
  final Color? bgColor;
  final bool isDetailPage;
  final String type;
  final int position;
    final ApprovedExpertProfileModel? profiles;


  ExpertOtherProfileItem({
    this.bgColor = AppColors.white,
    this.isDetailPage = false,
    this.type = 'chat',
    required this.position,
        this.profiles,

  });

  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(AppPMStandards.shared.cardCorner)),
          border: isDetailPage
              ? Border.all(
                  width: 1, color: AppColors.cardStroke.withOpacity(0.15))
              : null,
          color: bgColor,
          boxShadow: [
            isDetailPage
                ? BoxShadow(
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 2)
                : BoxShadow()
          ],
        ),
        margin: EdgeInsets.only(left: 2, right: 2),
        padding: EdgeInsets.only(left: 14, right: 13, top: 12, bottom: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userImage(context),
            SizedBox(width: 25),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(top: 6),
                child: userText(context,
                    isDetailPage: isDetailPage, position: position),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 6),
                child: ExpertBadgeItem(
                    context, type, position, isDetailPage, bgColor,profiles?.userId),
              ),
            ),
          ],
        ),
      ),
    );
  }

   Widget ExpertBadgeItem(BuildContext context, String type, int position,
      bool isDetailPage, Color? bgColor, String? expertid) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Spacer(),
            InkWell(
              onTap: () {
                // Call the controller method to toggle bookmark status
                controller.bookMarkForUser(expertid, position);
              },
              child: Obx(() {
                // Use Obx to rebuild widget when isExpertBookmarkedList changes
                return SvgPicture.asset(
                  controller.isExpertBookmarkedList[position]
                      ? 'assets/images/tickbadge.svg'
                      : 'assets/images/tickbadgeblack.svg',
                  width: 14.63,
                  height: 18.69,
                );
              }),
            ),
            SizedBox(width: 5),
            SvgPicture.asset(AppImages.redBadgeIcon)
          ],
        ),
        SizedBox(height: 22),
        Text(
          '\$ ${profiles?.pricePerMinute ?? ""}  /min',
          style: GetAppFont.getInstance().addStyle(
              name: AppFont.Recoleta,
              height: 2,
              fs: 14,
              fontType: AppFont.SemiBold,
              color: Colors.black),
        ),
        SizedBox(height: 6),
        TabItem(
          addEdgeInsets: EdgeInsets.all(0),
          width: 77,
          height: 28,
          cornerRadius: 4,
          leftIcon: Icons.add,
          title: isDetailPage
              ? "Online"
              : type == 'chat'
                  ? 'Chat now'
                  : type == 'call'
                      ? 'Call now'
                      : 'Video call',
          fontType: AppFont.SemiBold,
          fontSize: 12,
          borderColor: AppColors.darkGreen,
          backgroundColor: bgColor ?? Colors.white,
          titleColor: AppColors.darkGreen,
          isIcon: false,
          image: '',
          iconColor: Colors.black,
          onTap: () {},
          showPrefixIcon: false,
          addStandardMargin: false,
        ),
      ],
    );
  }

  Widget userImage(BuildContext context) {
    return Container(
      width: 78,
      child: Column(
        children: [
          Hero(
            tag: "hero-profile-${controller.otherProfile.value.sId}",
            child: Container(
              width: 78.0,
              height: 78.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "${Url.imageUrl}${controller.otherProfile.value.image}"),
                ),
              ),
            ),
          ),
          SizedBox(height: 6),
          RatingStars(
            value: 5.0,
            starCount: 5,
            starSize: 14,
            valueLabelVisibility: false,
            starColor: AppColors.starColor,
          ),
          SizedBox(height: 2),
          Text(
            "${controller.otherProfile.value.selectYourSession ?? ""} Sessions",
            style: GetAppFont.getInstance().addStyle(
              name: AppFont.Avenir,
              fs: 10,
              fontType: AppFont.SemiBold,
              color: AppColors.btnBlack,
            ),
          ),
        ],
      ),
    );
  }

  Widget userText(BuildContext context,
      {required bool isDetailPage, required int position}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.otherProfile.value.name ?? "",
          overflow: TextOverflow.ellipsis,
          style: GetAppFont.getInstance().addStyle(
            name: AppFont.Recoleta,
            fs: 18,
            height: 1,
            fontType: AppFont.SemiBold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12),
        Text(
          controller.otherProfile.value.yourOneLiner ?? "",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GetAppFont.getInstance().addStyle(
            name: AppFont.Avenir,
            height: 1.63,
            fs: 12,
            fontType: AppFont.Medium,
            color: Colors.black,
          ),
        ),
        Text(
          "Speaks ${controller.otherProfile.value.languages?.join(",") ?? ""}",
          overflow: TextOverflow.ellipsis,
          style: GetAppFont.getInstance().addStyle(
            name: AppFont.Avenir,
            height: 1.63,
            fs: 12,
            fontType: AppFont.Medium,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        TabItems(
          // addEdgeInsets: EdgeInsets.only(left: 8, right: 8),
          cornerRadius: 4,
          title: controller.otherProfile.value.mySubject?.isNotEmpty == true
              ? controller.otherProfile.value.mySubject?.first ?? ""
              : "",
          height: 28,
          fontType: AppFont.SemiBold,
          fontSize: 12,
          borderColor: Colors.transparent,
          backgroundColor:
              isDetailPage ? AppColors.btnBlack : Color(0xFFEAEAEA),
          titleColor: isDetailPage ? AppColors.white : Colors.black,
          isIcon: false,
          suffixImage: AppImages.forwardIcon,
          suffixIconHeight: 10,
          suffixIconWidth: 10,
          showSuffixIcon: true,
          image: '',
          iconColor: isDetailPage ? AppColors.white : Colors.black,
          onTap: () {
            Get.to(DigitalMarketingScreen());
          },
          showPrefixIcon: false,
          addStandardMargin: false,
        ),
      ],
    );
  }
}
