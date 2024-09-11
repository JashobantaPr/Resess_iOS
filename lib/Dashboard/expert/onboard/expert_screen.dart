import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Dashboard/expert/onboard/become_expert_step1.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/app_constants/app_colors.dart';

import '../../../controllers/expert/expert_setting_controller.dart';

class ExpertScreen extends StatelessWidget {
  ExpertScreen({super.key});

  final ExpertSettingController controller = Get.put(ExpertSettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBg,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.appBg,
        toolbarHeight: 30,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: FittedBox(
          child: Container(
            color: AppColors.appBg,
            width: MediaQuery.of(context).size.width,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 49,
                  child: Text(
                    'Become an Expert',
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Recoleta,
                        fs: 26,
                        fontType: AppFont.Bold,
                        color: Colors.black),
                  ),
                ),
                Text('Teach a global community your way.',
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Recoleta,
                        fs: 18,
                        fontType: AppFont.Medium,
                        color: Colors.black)),
                SizedBox(height: 20),
                Divider(height: 0.2),
                SizedBox(height: 20),
                Text(
                    'Become a verified Expert and educate the world about your area of knowledge.',
                    textAlign: TextAlign.center,
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 14,
                        fontType: AppFont.Medium,
                        color: Colors.black)),
                SizedBox(height: 20),
                SvgPicture.asset(AppImages.expertStartIcon),
                SizedBox(height: 24),
                Container(
                  width: 180,
                  child: AppButton(
                      cornerRadius: 4,
                      title: "Get started",
                      borderColor: Colors.black,
                      backgroundColor: Colors.black,
                      titleColor: Colors.white,
                      isIcon: false,
                      image: '',
                      iconColor: Colors.black,
                      onTap: () {
                        Get.to(BecomeExpertStep1());
                      },
                      showPrefixIcon: false,
                      addStandardMargin: false),
                ),
                SizedBox(height: 44),
                Divider(height: 0.2),
                SizedBox(height: 20),
                ListTile(
                  dense: true,
                  contentPadding:
                      EdgeInsets.only(left: 0.0, right: 0.0, top: 0, bottom: 0),
                  title: Container(
                    height: 28,
                    child: Text('Why become a verified Expert?',
                        style: GetAppFont.getInstance().addStyle(
                            name: AppFont.Avenir,
                            fs: 12,
                            fontType: AppFont.SemiBold,
                            color: Colors.black)),
                  ),
                  subtitle: Text(
                      'You choose your hours, methods of communication, and set your own fees as you access learners around the world.',
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Avenir,
                          fs: 12,
                          height: 1.6,
                          fontType: AppFont.Medium,
                          color: Colors.black)),
                ),
                // SizedBox(height: 5),
                ListTile(
                  dense: true,
                  contentPadding: const EdgeInsets.only(
                      left: 0, right: 0, top: 10, bottom: 0),
                  title: Container(
                    height: 20,
                    child: Text('What you’ll need',
                        style: GetAppFont.getInstance().addStyle(
                            name: AppFont.Avenir,
                            fs: 12,
                            fontType: AppFont.SemiBold,
                            color: Colors.black)),
                  ),
                  subtitle: Text(
                      'Proof of identity and evidence of your expertise.',
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Avenir,
                          fs: 12,
                          height: 1.6,
                          fontType: AppFont.Medium,
                          color: Colors.black)),
                ),
                // SizedBox(height: 5),
                ListTile(
                  dense: true,
                  contentPadding: const EdgeInsets.only(
                      left: 0, right: 0, top: 10, bottom: 0),
                  title: Container(
                    height: 20,
                    child: Text('How it works',
                        style: GetAppFont.getInstance().addStyle(
                            name: AppFont.Avenir,
                            fs: 12,
                            fontType: AppFont.SemiBold,
                            color: Colors.black)),
                  ),
                  subtitle: Text(
                      'We’ll verify the information you provide. Once complete and successful, you would become a verified Expert.',
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Avenir,
                          fs: 12,
                          height: 1.6,
                          fontType: AppFont.Medium,
                          color: Colors.black)),
                ),
                SizedBox(height: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
