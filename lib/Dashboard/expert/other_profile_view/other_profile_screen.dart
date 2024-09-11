import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Dashboard/expert/other_profile_view/users_review_screen.dart'
    as other;
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/Utility/expert_other_profile_item.dart';
import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/app_constants/app_pm_standards.dart';
import 'package:recess/components/book_session_button.dart';
import 'package:recess/components/connect_now_button.dart';

import '../../../controllers/home_controller.dart';

class OtherProfilePage extends StatelessWidget {
  OtherProfilePage({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.appBg,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Row(
            children: [
              Image.asset(
                "assets/images/arrowback.png",
                width: 20,
                height: 20,
              ),
              Text(
                "Back",
                textAlign: TextAlign.start,
                style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Avenir,
                    fs: 14,
                    fontType: AppFont.Bold,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          Container(
            height: 30,
            padding:
                EdgeInsets.only(right: AppPMStandards.shared.homeRightPadding),
            child: InkWell(
              onTap: () {
                // Add your desired functionality here
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.only(right: 4),
                      child: SvgPicture.asset(AppImages.walletIcon, width: 30)),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      "\$20.00",
                      textAlign: TextAlign.end,
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Avenir,
                          fs: 14,
                          fontType: AppFont.SemiBold,
                          height: 1.2,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: SvgPicture.asset(AppImages.forwardIcon, width: 14))
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpertOtherProfileItem(
                  bgColor: AppColors.white, isDetailPage: true, position: 0),
              SizedBox(
                height: 20,
              ),
              _buildDivider(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "${controller.otherProfile.value.name} is available now",
                  style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Recoleta,
                      fs: 24,
                      fontType: AppFont.Bold,
                      color: Colors.black),
                ),
              ),
              controller.otherProfile.value.onlineOffline == true
                  ? ConnectNowButton()
                  : Container(),
              BookSessionButtonView(),
              SizedBox(
                height: 20,
              ),
              _buildDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Bio",
                  style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Recoleta,
                      fs: 24,
                      fontType: AppFont.Bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  controller.otherProfile.value.bio ?? "",
                  style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Avenir,
                      fs: 14,
                      fontType: AppFont.Medium,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        controller.otherProfile.value.linkToYourBio ?? "",
                        style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Avenir,
                          fs: 14,
                          fontType: AppFont.Bold,
                          color: Colors.black,
                        ),
                        maxLines: null,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Link icon clicked");
                      },
                      child: Image.asset(
                        "assets/images/linkicon.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Reviews",
                      style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Recoleta,
                        fs: 18,
                        fontType: AppFont.SemiBold,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(other.UsersReviewScreen());
                      },
                      child: Row(
                        children: [
                          Text(
                            "View all",
                            style: GetAppFont.getInstance().addStyle(
                              name: AppFont.Avenir,
                              fs: 12,
                              fontType: AppFont.SemiBold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.black,
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: other.ReviewItem(
                        rating: 4,
                        userName: 'John Smith',
                        reviewTxt:
                            'Vivamus tincidunt tempor elit, sed facilisis libero posuere placerat. Nunc sapien erat, egestas!',
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Divider(
        thickness: 1,
        color: Colors.grey,
      ),
    );
  }
}
