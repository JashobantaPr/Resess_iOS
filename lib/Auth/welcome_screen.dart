import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/app_constants/app_pm_standards.dart';
import 'package:recess/components/cancel_back_header.dart';

import '../Dashboard/main_dashboard_screen.dart';
import '../components/cancel_welcome.dart';
import 'login_options_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key, required this.userName});

  String userName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.grey,
        toolbarHeight: 30,
        leading: null,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: AppColors.newGrey,
              boxShadow: [
                BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: Offset(0, -4),
                    color: Colors.black.withOpacity(0.25))
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            padding: EdgeInsets.only(
                top: 30,
                left: AppPMStandards.shared.leftPadding,
                right: AppPMStandards.shared.leftPadding,
                bottom: 20),
            child: Column(
              children: [
                CancelWelcomeHeader(),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 30, left: 24, right: 24, bottom: 20),
                    child: SizedBox.expand(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text("Welcome, $userName.",
                              style: GetAppFont.getInstance().addStyle(
                                  fs: 20,
                                  fontType: AppFont.Medium,
                                  name: AppFont.Recoleta,
                                  color: Colors.black)),
                          SizedBox(height: 20),
                          Text(
                              "Your account is ready, which you can also use to share your own knowledge as an Expert.",
                              style: GetAppFont.getInstance().addStyle(
                                  fs: 14,
                                  fontType: AppFont.Medium,
                                  name: AppFont.Avenir,
                                  color: Colors.black),
                              textAlign: TextAlign.center),
                          SizedBox(height: 10),
                          Text(
                              "Here’s \$20 in your wallet as a gift from us to kickstart your learning.",
                              style: GetAppFont.getInstance().addStyle(
                                  fs: 14,
                                  fontType: AppFont.Medium,
                                  name: AppFont.Avenir,
                                  color: Colors.black),
                              textAlign: TextAlign.center),
                          SizedBox(height: 30),
                          DottedBorder(
                            color: Colors.black,
                            strokeWidth: 1,
                            dashPattern: [8, 4],
                            borderType: BorderType.RRect,
                            radius: Radius.circular(10),
                            child: Container(
                              color: AppColors.cardBg,
                              padding: EdgeInsets.all(20),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(AppImages.welcomeBonus),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text("Available balance",
                                            style: GetAppFont.getInstance()
                                                .addStyle(
                                              fs: 14,
                                              fontType: AppFont.Medium,
                                              name: AppFont.Recoleta,
                                              color: Colors.black,
                                              height: 1.5,
                                            )),
                                        SizedBox(height: 2),
                                        Text("\$20.00",
                                            style: GetAppFont.getInstance()
                                                .addStyle(
                                                    fs: 22,
                                                    fontType: AppFont.Bold,
                                                    name: AppFont.Recoleta,
                                                    color: Colors.black))
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                          SizedBox(height: 40),
                          Divider(
                            height: 1,
                          ),
                          SizedBox(height: 24),
                          Text("Earn an additional \$20",
                              style: GetAppFont.getInstance().addStyle(
                                  fs: 16,
                                  fontType: AppFont.SemiBold,
                                  name: AppFont.Recoleta,
                                  color: Colors.black)),
                          SizedBox(height: 10),
                          Text(
                              "If you received an Invite Code from a friend, please enter it below to receive an additional \$20.",
                              style: GetAppFont.getInstance().addStyle(
                                  fs: 12,
                                  height: 1.2,
                                  fontType: AppFont.Medium,
                                  name: AppFont.Avenir,
                                  color: Colors.black),
                              textAlign: TextAlign.center),
                          SizedBox(height: 20),
                          TextFormField(
                            obscureText: false,
                            autofocus: false,
                            textAlign: TextAlign.center,
                            style: GetAppFont.getInstance().addStyle(
                                name: AppFont.Avenir,
                                fs: 13,
                                fontType: AppFont.Medium,
                                color: Colors.black),
                            decoration: InputDecoration(
                                icon: null,
                                hintText: 'Enter Invite Code (optional)',
                                fillColor: AppColors.cardBg,
                                filled: true,
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                left: 0,
                                right: 0,
                              ),
                              child: Container(
                                width: 200,
                                margin: EdgeInsets.only(top: 20),
                                child: AppButton(
                                    cornerRadius: 10,
                                    leftIcon: Icons.add,
                                    title: 'Continue',
                                    borderColor: Colors.transparent,
                                    backgroundColor: Colors.black,
                                    titleColor: Colors.white,
                                    isIcon: false,
                                    image: '',
                                    iconColor: Colors.transparent,
                                    onTap: () {
                                      Get.offAll(MainDashboardScreen());
                                    },
                                    showPrefixIcon: false,
                                    addStandardMargin: false),
                              ))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
