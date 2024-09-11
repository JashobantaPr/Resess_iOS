import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:recess/Utility/AppImages.dart';
import 'package:recess/app_constants/app_colors.dart';

import '../Auth/login_options_screen.dart';
import '../controllers/home_controller.dart';

class BookSessionButtonView extends StatelessWidget {
  BookSessionButtonView({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        height: 80,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            controller.bookingData();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                AppColors.btnBlack, // Replace with your custom color
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(13), // Adjust the radius as needed
            ),
          ).copyWith(
            side: MaterialStateProperty.all(BorderSide(
                color: Colors.black, width: 2)), // Border color and width
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/images/bookingicon.png",
                width: 25,
                height: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Book a session from \$${controller.otherProfile.value.amount}",
                  style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Avenir,
                    fs: 14,
                    fontType: AppFont.SemiBold,
                    color: Colors.white,
                  ),
                ),
              ),
              SvgPicture.asset(
                AppImages.forwardIcon,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
