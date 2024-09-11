import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/app_constants/app_pm_standards.dart';

class AppBackBtn extends StatelessWidget {
  bool? appInsets;
  AppBackBtn({
    super.key,this.appInsets = true
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Get.back();
      },
      child: Container(
        margin: appInsets! == true ? EdgeInsets.only(left: AppPMStandards.shared.leftPadding - 18) : EdgeInsets.zero,
        // color: Colors.brown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RotatedBox(
                quarterTurns: 2,
                child: SvgPicture.asset(
                  AppImages.forwardIcon,
                  width: 18,
                  height: 18,
                )),
            Text(
              'Back',
              style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Avenir,
                  fs: 14,
                  fontType: AppFont.SemiBold,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
