import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:recess/routes/app_routes.dart';

import '../Auth/login_options_screen.dart';
import '../Utility/AppImages.dart';
import '../Utility/app_routes.dart';

class CancelBackHeader extends StatelessWidget {
  bool? showBack;
  CancelBackHeader({super.key, this.showBack = true});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          showBack!
              ? InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
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
                      )),
                )
              : Container(height: 0, width: 0),
          Spacer(),
          IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.homeScreen);
              },
              icon: SvgPicture.asset(AppImages.xmarkIcon))
        ]);
  }
}
