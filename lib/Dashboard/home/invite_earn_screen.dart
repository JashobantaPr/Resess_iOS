import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recess/Utility/app_back_btn.dart';

import '../../Auth/login_options_screen.dart';
import '../../Utility/AppImages.dart';
import '../../app_constants/app_colors.dart';

class InviteEarnScreen extends StatelessWidget {
  const InviteEarnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBg,
        leadingWidth: 100,
        leading: AppBackBtn(),
      ),
      body:Container(
        padding: EdgeInsets.only(left: 25,right: 25),
        color: AppColors.appBg,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Invite and receive \$20",
                style: GetAppFont.getInstance().addStyle(
                    fs: 32,
                    fontType: AppFont.Bold,
                    name: AppFont.Recoleta,
                    color: Colors.black)),
            SizedBox(height: 20),
            Text(
                "Invite a friend to experience limitless learning. Share your Invite Code and enjoy a extra \$20 in your Recess wallet when they join.",
                textAlign: TextAlign.center,
                style: GetAppFont.getInstance().addStyle(
                    fs: 14,
                    fontType: AppFont.Medium,
                    name: AppFont.Recoleta,
                    color: Colors.black)),
            SizedBox(height: 50),
            SvgPicture.asset(AppImages.wavesIcon, height: 200, width: 200),
            SizedBox(height:20),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('https://therecessapp.com/Wucbskfy24',style: GetAppFont.getInstance().addStyle(
                      fs: 12,
                      fontType: AppFont.Regular,
                      name: AppFont.Recoleta,
                      color: Colors.black)),
                  Icon(Icons.copy)
                ],
              ),
            ),
            SizedBox(height: 50),
                Container(
                  width: 200,
                  child: AppButton(
                    cornerRadius: 4,
                    leftIcon: Icons.apple,
                    title: 'Invite now',
                    borderColor: Colors.transparent,
                    backgroundColor: Colors.black,
                    titleColor: Colors.white,
                    isIcon: false,
                    image: '',
                    iconColor: Colors.white, onTap: () {  }, showPrefixIcon: false, addStandardMargin: true,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
