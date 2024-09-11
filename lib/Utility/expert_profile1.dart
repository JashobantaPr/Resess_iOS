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
import '../controllers/expert/expert_profile_controller.dart';
import 'AppImages.dart';

class ExpertListItem1 extends StatelessWidget {
  final Color? bgColor;
  final bool isDetailPage;
  final String type;
  final int position;

  ExpertListItem1({
    this.bgColor = AppColors.white,
    this.isDetailPage = false,
    this.type = 'chat',
    required this.position,
  });

  final ExpertProfileController controller = Get.put(ExpertProfileController());
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
            SizedBox(width: 15),
            Expanded(
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
                    context, type, position, isDetailPage, bgColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ExpertBadgeItem(BuildContext context, String type, int position,
      bool isDetailPage, Color? bgColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Spacer(),
            SizedBox(width: 5),
            SvgPicture.asset(AppImages.redBadgeIcon)
          ],
        ),
        SizedBox(height: 22),
        Text(
          ' From \$${controller.expertProfile.value.pricePerMinute ?? ""}',
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

          title: controller.expertProfile.value.onlineOffline == true
              ? "Online"
              : "Offline",
          // title: isDetailPage
          //     ? "Online"
          //     : type == 'chat'
          //         ? 'Chat now'
          //         : type == 'call'
          //             ? 'Call now'
          //             : 'Video call',
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
          Container(
            width: 78.0,
            height: 78.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: controller.expertProfile.value.image != null
                    ? NetworkImage(
                            "${Url.imageUrl}${controller.expertProfile.value.image}")
                        as ImageProvider<Object>
                    : AssetImage("assets/images/walet.png")
                        as ImageProvider<Object>,
              ),
            ),
          ),
          SizedBox(height: 6),
          RatingStars(
            value: (controller.expertProfile.value.rating ?? 0).toDouble(),
            starCount: 5,
            starSize: 14,
            valueLabelVisibility: false,
            starColor: AppColors.starColor,
          ),
          SizedBox(height: 2),
          Text(
            controller.expertProfile.value.selectYourSession != null
                ? "${controller.expertProfile.value.selectYourSession} Sessions"
                : "No Sessions Available",
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
          controller.expertProfile.value.name != null
              ? controller.expertProfile.value.name ?? ""
              : "No Name Available",
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
          controller.expertProfile.value.yourOneLiner != null
              ? controller.expertProfile.value.yourOneLiner!
              : "No Name Available",
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
          controller.expertProfile.value.languages != null
              ? "Speaks ${controller.expertProfile.value.languages}"
              : "No Name Available",
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
          title: controller.expertProfile.value.mySubject?.first ?? "",

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
            Get.to(
              DigitalMarketingScreen(),
              arguments: controller.expertProfile.value.mySubject?.join(","),
            );
          },
          showPrefixIcon: false,
          addStandardMargin: false,
        ),
      ],
    );
  }
}
