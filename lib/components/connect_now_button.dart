import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/app_constants/app_colors.dart';

import '../Auth/login_options_screen.dart';
import '../Dashboard/expert/other_profile_view/connect_button_view.dart';

class ConnectNowButton extends StatelessWidget {
  ConnectNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        height: 75,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => ConnectButtonView());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                AppColors.lightgreen, // Replace with your custom color
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(8), // Adjust the radius as needed
            ),
          ).copyWith(
            side: MaterialStateProperty.all(BorderSide(
                color: Colors.grey, width: 2)), // Border color and width
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/images/comments.png",
                width: 25,
                height: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Connect now",
                  style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Avenir,
                    fs: 14,
                    fontType: AppFont.SemiBold,
                    color: Colors.black,
                  ),
                ),
              ),
              SvgPicture.asset(
                AppImages.forwardIcon,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
