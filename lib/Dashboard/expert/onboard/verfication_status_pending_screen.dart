import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/app_constants/app_colors.dart';

class VerificationStatusPendingScreen extends StatelessWidget {
  const VerificationStatusPendingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.appBg,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'Verification in progress',
              style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Recoleta,
                  fs: 24,
                  fontType: AppFont.Bold,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              'We’re reviewing your information and will get back with the result within 48 hours',
              textAlign: TextAlign.center,
              style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Avenir,
                  fs: 14,
                  fontType: AppFont.Medium,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            SvgPicture.asset(AppImages.tickDottedIcon)
          ],
        ),
      ),
    );
  }
}
