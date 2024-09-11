import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Utility/app_back_btn.dart';
import 'package:recess/Utility/responsive.dart';
import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/app_constants/app_pm_standards.dart';

class UsersReviewScreen extends StatelessWidget {
  UsersReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive.getSize(context) == ScreenSize.kMobile ||
              Responsive.getSize(context) == ScreenSize.mobile
          ? ExpertDetailMobileScreen()
          : Center(
              child: Text("This screen is available only on mobile devices."),
            ),
    );
  }
}

class ReviewItem extends StatelessWidget {
  final double rating;
  final String userName, reviewTxt;

  const ReviewItem({
    super.key,
    required this.rating,
    required this.userName,
    required this.reviewTxt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.all(
          Radius.circular(AppPMStandards.shared.cardCorner),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.25),
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                userName,
                style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Avenir,
                  fs: 12,
                  fontType: AppFont.Bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 10),
              RatingStars(
                value: rating,
                starCount: 5,
                starSize: 10,
                valueLabelVisibility: false,
                starColor: AppColors.starColor,
              ),
            ],
          ),
          SizedBox(height: 8),
          // Text widget with ellipsis
          Text(
            reviewTxt,
            style: GetAppFont.getInstance().addStyle(
              name: AppFont.Avenir,
              fs: 13,
              fontType: AppFont.Medium,
              color: Colors.black,
            ),
            maxLines: 2, // Limit the text to 2 lines
            overflow: TextOverflow.ellipsis, // Add ellipsis if text exceeds the space
          ),
          SizedBox(height: 10),
          // Inner Container
          Container(
            width: 296, // Width in pixels
            height: 81, // Height in pixels
            decoration: BoxDecoration(
              color: Color(0x80E0E0E0), // Background color #E0E0E080
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey.withOpacity(0.5), // Border color
                width: 1, // Border width
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Avenir,
                      fs: 12,
                      fontType: AppFont.Bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  // Text widget with ellipsis
                  Text(
                    reviewTxt,
                    style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Avenir,
                      fs: 12,
                      fontType: AppFont.Medium,
                      color: Colors.black,
                    ),
                    maxLines: 2, // Limit the text to 2 lines
                    overflow: TextOverflow.ellipsis, // Add ellipsis if text exceeds the space
                  ),
                ],
              ),
            ),
          ),
        ],
      ).paddingAll(10).marginAll(5),
    );
  }
}

class ExpertDetailMobileScreen extends StatelessWidget {
  ExpertDetailMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBg,
      appBar: AppBar(
        backgroundColor: AppColors.appBg,
        surfaceTintColor: Colors.transparent,
        leadingWidth: 126,
        leading: AppBackBtn(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(
                horizontal: AppPMStandards.shared.leftPadding),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: 10),
                Text(
                  'Manish\'s Reviews',
                  style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Recoleta,
                    fs: 26,
                    fontType: AppFont.Bold,
                    color: Colors.black,
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: Color(0XFF18181826),
                ),
                SizedBox(height: 16),
              ]),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppPMStandards.shared.leftPadding),
                  child: ReviewItem(
                    rating: 4,
                    userName: 'John Smithdfg',
                    reviewTxt:
                        'Vivamus tincidunt tempor elit, sed facilisis libero posuere placerat. Nunc sapien erat, egestas!',
                  ),
                );
              },
              childCount: 10, // Adjust this to reflect the number of reviews
            ),
          ),
        ],
      ),
    );
  }
}
