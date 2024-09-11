import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Dashboard/home/digital_marketing_screen.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/Utility/item_tab.dart';
import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/app_constants/app_pm_standards.dart';
import 'package:recess/controllers/settings/favourites_subjects_controller.dart';
import 'package:recess/core/url.dart';
import 'package:recess/models/settings_model/experts_bookmark_model.dart';

class FavouritesExpertScreen extends GetWidget<FavouritesExpertController> {
  FavouritesExpertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavouritesExpertController controller =
        Get.put(FavouritesExpertController());
    controller.getBookmarkedUserById();
    return Scaffold(
      backgroundColor: AppColors.appBg,
      body: Column(
        children: [
          SizedBox(height: 15),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else if (controller.bookmarkedExperts.isEmpty) {
                return Center(
                  child: Text(
                    "No bookmarked Experts found",
                    style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Avenir,
                      fs: 16,
                      fontType: AppFont.SemiBold,
                      color: Colors.black,
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: controller.bookmarkedExperts.length,
                  itemBuilder: (context, index) {
                    return ExpertListItem(
                      context,
                      expert: controller.bookmarkedExperts[index],
                      position: index,
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget ExpertListItem(BuildContext context,
      {Color? bgColor = AppColors.cardBg,
      bool? isDetailPage = false,
      String type = 'chat',
      required int position,
      required BookmarkedExpert expert}) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(AppPMStandards.shared.cardCorner),
          ),
          border: isDetailPage == true
              ? Border.all(
                  width: 1, color: AppColors.cardStroke.withOpacity(0.15))
              : null,
          color: bgColor,
          boxShadow: [
            isDetailPage == true
                ? BoxShadow(
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 2)
                : BoxShadow(),
          ],
        ),
        margin: EdgeInsets.only(left: 2, right: 2),
        padding: EdgeInsets.only(left: 14, right: 13, top: 12, bottom: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userImage(context, expert.image),
            SizedBox(width: 15),
            Container(
              width: 154,
              padding: EdgeInsets.only(top: 6),
              child: userText(
                context,
                isDetailPage: isDetailPage ?? false,
                position: position,
                expert: expert,
                subject:
                    (expert.mySubject != null && expert.mySubject!.isNotEmpty)
                        ? expert.mySubject!.first
                        : 'N/A',
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.only(top: 6),
              child: ExpertBadgeItem(
                context,
                type,
                position,
                isDetailPage ?? false,
                bgColor,
                expert.pricePerMinute,
                expert.expertId,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ExpertBadgeItem(
      BuildContext context,
      String type,
      int position,
      bool isDetailPage,
      Color? bgColor,
      String? priceperminute,
      String? expertId) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                controller.bookMarkForUser(expertId, position);
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
            SizedBox(
              width: 5.0,
            ),
            SvgPicture.asset(AppImages.redBadgeIcon),
          ],
        ),
        SizedBox(height: 22),
        Text(
          // Use the priceperminute parameter here
          '\$ ${priceperminute ?? 'N/A'}/min',
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
            title: isDetailPage == true
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
            addStandardMargin: false)
      ],
    );
  }

  Widget userImage(BuildContext context, String? image) {
    return Container(
      width: 78,
      child: Column(
        children: [
          CircleAvatar(
            radius: 39,
            backgroundColor: Colors.transparent,
            child: image != null && image.isNotEmpty
                ? ClipOval(
                    child: Image.network(
                      '${Url.imageUrl}$image',
                      fit: BoxFit.cover,
                      width: 78.0,
                      height: 78.0,
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black, // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 70.0,
                      color: Colors.black,
                    ),
                  ),
          ),
          const SizedBox(height: 6),
          const RatingStars(
            value: 5.0,
            starCount: 5,
            starSize: 14,
            valueLabelVisibility: false,
            starColor: AppColors.starColor,
          ),
          SizedBox(height: 2),
          Text(
            '847 Sessions',
            style: GetAppFont.getInstance().addStyle(
                name: AppFont.Avenir,
                fs: 10,
                fontType: AppFont.SemiBold,
                color: AppColors.btnBlack),
          ),
        ],
      ),
    );
  }

  // Widget userText(BuildContext context,
  //     {bool isDetailPage = false,
  //     required int position,
  //     required BookmarkedExpert expert,
  //     required String subject}) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       // Expert's Name
  //       Text(
  //         expert.name ?? 'N/A',
  //         overflow: TextOverflow.ellipsis,
  //         style: GetAppFont.getInstance().addStyle(
  //           name: AppFont.Recoleta,
  //           fs: 18,
  //           height: 1,
  //           fontType: AppFont.SemiBold,
  //           color: Colors.black,
  //         ),
  //       ),
  //       SizedBox(height: 12),
  //       // Expert's One-Liner
  //       Text(
  //         expert.yourOneLiner ?? 'N/A',
  //         maxLines: 1,
  //         overflow: TextOverflow.ellipsis,
  //         style: GetAppFont.getInstance().addStyle(
  //           name: AppFont.Avenir,
  //           height: 1.63,
  //           fs: 12,
  //           fontType: AppFont.Medium,
  //           color: Colors.black,
  //         ),
  //       ),
  //       SizedBox(height: 5),
  //       // Expert's Languages
  //       Text(
  //         'Speaks ${expert.languages?.join(",") ?? 'No Languages'}',
  //         overflow: TextOverflow.ellipsis,
  //         style: GetAppFont.getInstance().addStyle(
  //           name: AppFont.Avenir,
  //           height: 1.63,
  //           fs: 12,
  //           fontType: AppFont.Medium,
  //           color: Colors.black,
  //         ),
  //       ),
  //       SizedBox(height: 10),
  //       // Expert's Tag (subject)
  //       TabItem(
  //         addEdgeInsets: EdgeInsets.only(left: 8, right: 8),
  //         cornerRadius: 4,
  //         title: subject, // Use the subject parameter here
  //         height: 28,
  //         fontType: AppFont.SemiBold,
  //         fontSize: 12,
  //         borderColor: Colors.transparent,
  //         backgroundColor:
  //             isDetailPage ? AppColors.btnBlack : Color(0xFFEAEAEA),
  //         titleColor: isDetailPage ? AppColors.white : Colors.black,
  //         isIcon: false,
  //         suffixImage: AppImages.forwardIcon,
  //         suffixIconHeight: 10,
  //         suffixIconWidth: 10,
  //         showSuffixIcon: false,
  //         image: '',
  //         iconColor: isDetailPage ? AppColors.white : Colors.black,
  //         onTap: () {},
  //         showPrefixIcon: false,
  //         addStandardMargin: false,
  //       ),
  //     ],
  //   );
  // }

  Widget userText(BuildContext context,
      {bool isDetailPage = false,
      required int position,
      required BookmarkedExpert expert,
      required String subject}) {
    final languages =
        (expert.languages ?? []).expand((langList) => langList).join(", ");

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Expert's Name
        Text(
          expert.name ?? 'N/A',
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

        // Expert's One-Liner
        Text(
          expert.yourOneLiner ?? 'N/A',
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
        SizedBox(height: 5),

        // Expert's Languages
        Text(
          'Speaks ${languages.isNotEmpty ? languages : 'N/A'}',
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

        // Expert's Tag (subject)
        TabItem(
          addEdgeInsets: EdgeInsets.only(left: 8, right: 8),
          cornerRadius: 4,
          title: subject, // Use the subject parameter here
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
          showSuffixIcon: false,
          image: '',
          iconColor: isDetailPage ? AppColors.white : Colors.black,
          onTap: () {
            if (expert?.mySubject?.isNotEmpty == true) {
              print(
                  "Subject to pass: ${expert?.mySubject?.first}"); // Debug line
              Get.to(
                DigitalMarketingScreen(),
                arguments: expert?.mySubject?.join(","),
              );
            }
          },

          showPrefixIcon: false,
          addStandardMargin: false,
        ),
      ],
    );
  }
}
