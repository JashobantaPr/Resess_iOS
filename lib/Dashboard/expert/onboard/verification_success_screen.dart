import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:recess/Utility/AppImages.dart';

import 'package:recess/Utility/get_prefs.dart';
import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/network_services/app_consts.dart';

import '../../../Auth/login_options_screen.dart';
import '../../../controllers/expert/admin_status_controller.dart';
import '../expert_profile.dart';

class VerificationScuccessScreen extends StatelessWidget {
  VerificationScuccessScreen({Key? key}) : super(key: key);

  final AdminStatusController controller = Get.put(AdminStatusController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBg,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.appBg,
          padding: EdgeInsets.all(30),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Congratulations',
                style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Recoleta,
                    fs: 24,
                    fontType: AppFont.Bold,
                    color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'You’re a verified Expert',
                textAlign: TextAlign.center,
                style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Recoleta,
                    fs: 16,
                    fontType: AppFont.Medium,
                    color: Colors.black),
              ),
              SizedBox(height: 10),
              SvgPicture.asset(AppImages.tickSuccessIcon),
              SizedBox(height: 20),
              Divider(height: 1),
              SizedBox(height: 20),
              Text.rich(TextSpan(
                text: 'By continuing, you are agreeing to the ',
                style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Avenir,
                    fs: 12,
                    fontType: AppFont.Medium,
                    color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Expert Terms of Use',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => print('Tap Here onTap'),
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontFamily: 'recoleta',
                          fontWeight: FontWeight.bold)),
                  const TextSpan(
                      text:
                          '. Here are some key parts of it to be aware of, however we recommend reading the full document online.')
                  // can add more TextSpans here...
                ],
              )),
              SizedBox(height: 20),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(AppImages.tickOutlinedIcon)),
                Expanded(
                  child: Text(
                    'Only true, accurate, and factual information will be provided to learners. The spread of misinformation is considered a serious offence and the act of doing so can result in serious consequences.',
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 14,
                        fontType: AppFont.Medium,
                        color: Colors.black),
                    softWrap: true,
                    maxLines: 4,
                  ),
                )
              ]),
              SizedBox(height: 10),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(AppImages.tickOutlinedIcon)),
                Expanded(
                  child: Text(
                    'The exchange of personal information that may be used to host sessions outside of Recess is considered a serious offence and goes against the terms of use.',
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 14,
                        fontType: AppFont.Medium,
                        color: Colors.black),
                    softWrap: true,
                    maxLines: 4,
                  ),
                )
              ]),
              SizedBox(height: 10),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(AppImages.tickOutlinedIcon)),
                Expanded(
                  child: Text(
                    'The use of language that can be considered demeaning, racially insensitive, discriminative towards any group, or inappropriate does not align with the terms of use.',
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 14,
                        fontType: AppFont.Medium,
                        color: Colors.black),
                    softWrap: true,
                    maxLines: 4,
                  ),
                )
              ]),
              SizedBox(height: 10),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(AppImages.tickOutlinedIcon)),
                Expanded(
                  child: Text(
                    'The details of private conversations held between you and a learner within sessions are to remain confidential.',
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 14,
                        fontType: AppFont.Medium,
                        color: Colors.black),
                    softWrap: true,
                    maxLines: 4,
                  ),
                )
              ]),
              SizedBox(height: 20),
              Divider(height: 1),
              SizedBox(height: 20),
              Container(
                width: 150,
                child: AppButton(
                    cornerRadius: 4,
                    title: 'Continue',
                    borderColor: Colors.black,
                    backgroundColor: Colors.black,
                    titleColor: Colors.white,
                    isIcon: false,
                    image: '',
                    iconColor: Colors.black,
                    onTap: () {
                      controller.sendConitnue();
                    },
                    showPrefixIcon: false,
                    addStandardMargin: false),
              )
            ],
          ),
        ),
      ),
    );
  }
}
