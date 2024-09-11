import 'package:flutter/material.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/app_constants/app_colors.dart';

class WebFooter extends StatelessWidget {
  const WebFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("© Recess Private Limited",
            style: GetAppFont.getInstance().addStyle(
                name: AppFont.Avenir,
                fs: 16,
                fontType: AppFont.SemiBold,
                color: AppColors.btnBlack)),
        SizedBox(width: 80),
        Text("Terms & conditions",style: GetAppFont.getInstance().addStyle(
            name: AppFont.Avenir,
            fs: 16,
            fontType: AppFont.SemiBold,
            color: AppColors.btnBlack)),
        SizedBox(width: 80),
        Text("Privacy policy",style: GetAppFont.getInstance().addStyle(
            name: AppFont.Avenir,
            fs: 16,
            fontType: AppFont.SemiBold,
            color: AppColors.btnBlack)),
        Spacer(),
        Text("Learn. Grow. Share.",style: GetAppFont.getInstance().addStyle(
            name: AppFont.Avenir,
            fs: 16,
            fontType: AppFont.SemiBold,
            color: AppColors.btnBlack))
      ],
    );
  }
}
