import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Dashboard/expert/other_profile_view/other_profile_screen.dart';
import 'package:recess/Dashboard/home/home_screen.dart';

import 'package:recess/Utility/AppImages.dart';
import 'package:recess/Utility/item.tabs.dart';
import 'package:recess/Utility/item_tab.dart';

import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/controllers/book_session_controller.dart';
import 'package:recess/core/url.dart';

class BookingConfirmScreen extends StatelessWidget {
  BookingConfirmScreen({super.key});

  final BookSessionController controller = Get.put(BookSessionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appGray,
      appBar: AppBar(
        backgroundColor: AppColors.appGray,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Get.back(), // Navigate back when the image is tapped
              child: Image.asset(
                "assets/images/arrowback.png",
                width: 20,
                height: 20,
              ),
            ),
            SizedBox(width: 10),
            Text(
              "Back",
              textAlign: TextAlign.start,
              style: GetAppFont.getInstance().addStyle(
                name: AppFont.Avenir,
                fs: 14,
                fontType: AppFont.Bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Booking confirmed",
                style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Recoleta,
                  fs: 32,
                  fontType: AppFont.Bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Divider(thickness: 1),
              SizedBox(height: 20),
              _buildProfileCard(),
              SizedBox(height: 20),
              _buildNote(),
              SizedBox(height: 20),
              Divider(
                thickness: 1,
              ),
              SizedBox(height: 150),
              TabItem(
                  cornerRadius: 4,
                  height: 45,
                  width: 140,
                  title: "Done",
                  borderColor: AppColors.btnBlack,
                  backgroundColor: AppColors.btnBlack,
                  titleColor: AppColors.white,
                  isIcon: false,
                  image: "",
                  iconColor: Colors.transparent,
                  onTap: () {
                    controller.navigateToHomeScreen();
                  },
                  showPrefixIcon: false,
                  addStandardMargin: false)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.green,
                    backgroundImage: NetworkImage(
                        "${Url.imageUrl}${controller.homeController.selectedImage.value}"),
                  ),
                  SizedBox(width: 25),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          controller.homeController.selectedName.value ?? "",
                          style: GetAppFont.getInstance().addStyle(
                            name: AppFont.Recoleta,
                            fs: 14,
                            fontType: AppFont.Bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20),
                        TabItems(
                          cornerRadius: 4,
                          title: controller.homeController.otherProfile.value
                                  .mySubject?.first
                                  .toString() ??
                              "",
                          height: 35,
                          fontType: AppFont.SemiBold,
                          fontSize: 12,
                          borderColor: Colors.transparent,
                          backgroundColor: AppColors.grey,
                          isIcon: false,
                          suffixImage: AppImages.forwardIcon,
                          suffixIconHeight: 10,
                          suffixIconWidth: 10,
                          showSuffixIcon: false,
                          image: '',
                          iconColor: Colors.black,
                          onTap: () {},
                          showPrefixIcon: false,
                          addStandardMargin: false,
                          titleColor: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 1),
            SizedBox(height: 5),
            Text(
              "Today, 08:00pm to 8:30pm",
              style: GetAppFont.getInstance().addStyle(
                name: AppFont.Avenir,
                fs: 14,
                fontType: AppFont.Medium,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Session value \$ ${controller.homeController.bookingFlow.value?.setYourFeeForPreBookedSession}",
              style: GetAppFont.getInstance().addStyle(
                name: AppFont.Avenir,
                fs: 14,
                fontType: AppFont.Medium,
                color: Colors.black,
              ),
            ),
            Divider(thickness: 1),
            SizedBox(
              height: 2,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.showBookingCancel();
                  },
                  child: Image.asset(
                    "assets/images/close.png",
                    width: 20,
                    height: 20,
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    "Cancel session",
                    style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Avenir,
                      fs: 14,
                      fontType: AppFont.SemiBold,
                      color: AppColors.red,
                    ),
                  ),
                ),
                Image.asset(
                  "assets/images/calendericon.png",
                  width: 20,
                  height: 20,
                ),
                SizedBox(width: 5),
                Text(
                  "Add to Calendar",
                  style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Avenir,
                    fs: 14,
                    fontType: AppFont.SemiBold,
                    color: AppColors.btnBlack,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNote() {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'Note:',
            style: GetAppFont.getInstance().addStyle(
              name: AppFont.Avenir,
              fs: 14,
              fontType: AppFont.Bold,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text:
                ' Your Expert will initiate this session and you will be able to join the session at the assigned time.\n\n',
            style: GetAppFont.getInstance().addStyle(
              name: AppFont.Avenir,
              fs: 14,
              fontType: AppFont.Medium,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text:
                'If you would like to cancel the session, please ensure this is done at least 24 hours before the session start time to avoid a 10% cancellation fee.',
            style: GetAppFont.getInstance().addStyle(
              name: AppFont.Avenir,
              fs: 14,
              fontType: AppFont.Medium,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
