import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/app_constants/app_colors.dart';

import '../../../Auth/login_options_screen.dart';

class VerificationRejectedScreen extends StatelessWidget {
  const VerificationRejectedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBg,
      ),
      body: Container(
        color: AppColors.appBg,
        padding: EdgeInsets.all(30),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Not approved',
              style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Recoleta,
                  fs: 24,
                  fontType: AppFont.Bold,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              'You’re not a verified expert yet',
              textAlign: TextAlign.center,
              style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Recoleta,
                  fs: 16,
                  fontType: AppFont.Medium,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            SvgPicture.asset(AppImages.rejectExpertIcon),
            SizedBox(height: 20),
            Divider(height: 1),
            SizedBox(height: 20),
            Text.rich(TextSpan(
              text:
                  'Sorry, it looks like the information you provided did not meet the verifications requirements or ',
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
                        '. Here are some things you could do to increase your chances of becoming a verified expert.')
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
                  'Increase the authenticity of your profile by adding a more professional image and descriptive bio that contains sound grammar and avoids spelling mistakes.',
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
                  'Choose an area of knowledge you genuinely are proficient in, and add trustworthy documentation and URLs to showcase this knowledge.',
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
                  'Prove your identity by attaching an official document as suggested that is clear and easy to read in English and add a legitimate payment method.',
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
            SizedBox(height:20),
            Text.rich(TextSpan(
              text:
              'Please try again by using the tips above,',
              style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Avenir,
                  fs: 12,
                  fontType: AppFont.Medium,
                  color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    text: 'Contact Support',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => print('Tap Here onTap'),
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontFamily: 'recoleta',
                        fontWeight: FontWeight.bold)),
                const TextSpan(
                    text:
                    ' for further help.')
                // can add more TextSpans here...
              ],
            )),
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
                  onTap: () {},
                  showPrefixIcon: false,
                  addStandardMargin: false),
            )
          ],
        ),
      ),
    );
  }
}
