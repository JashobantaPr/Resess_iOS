import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recess/Auth/enter_email_screen.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/Utility/item_tab.dart';
import 'package:recess/components/cancel_back_header.dart';
import 'package:recess/controllers/auth/login_options_controller.dart';

import '../app_constants/app_colors.dart';

class LoginOptionsScreen extends StatelessWidget {
  LoginOptionsScreen({super.key});

  LoginOptionsController controller = Get.put(LoginOptionsController());

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 40, right: 20, top: 25),
                    child: CancelBackHeader(showBack: false)),
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 45, top: 45),
                  child: Text("Use an account to continue",
                      style: GetAppFont.getInstance().addStyle(
                          fs: 24,
                          fontType: AppFont.Bold,
                          name: AppFont.Recoleta,
                          color: Colors.black)),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.only(left: 45, right: 45),
                  child: Text(
                      "Get \$20 in your wallet as a gift from us to kickstart your learning when you create a new account.",
                      style: GetAppFont.getInstance().addStyle(
                          fs: 16,
                          height: 1.2,
                          fontType: AppFont.Medium,
                          name: AppFont.Avenir,
                          color: Colors.black)),
                ),
                SizedBox(height: 44),
                SvgPicture.asset(AppImages.wavesIcon, height: 178, width: 176),
                SizedBox(height: 44),
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(left: 41, right: 41, bottom: 16),
                        child: TabItem(
                          height: 40,
                          fontType: AppFont.SemiBold,
                          fontSize: 14,
                          cornerRadius: 10,
                          leftIcon: Icons.apple,
                          image: AppImages.appleIcon,
                          title: 'Continue with Apple',
                          borderColor: Colors.transparent,
                          backgroundColor: Colors.black,
                          titleColor: Colors.white,
                          isIcon: false,
                          iconColor: Colors.white,
                          onTap: () async {
                            await controller.signInWithApple();
                          },
                          showPrefixIcon: true,
                          addStandardMargin: true,
                        ),
                      ),
                      Container(
                          margin:
                              EdgeInsets.only(left: 41, right: 41, bottom: 16),
                          child: TabItem(
                            height: 40,
                            cornerRadius: 10,
                            leftIcon: Icons.apple,
                            title: 'Continue with Google',
                            borderColor: Colors.black,
                            backgroundColor: Colors.white,
                            titleColor: Colors.black,
                            isIcon: false,
                            image: AppImages.googleIcon,
                            iconColor: null,
                            fontType: AppFont.SemiBold,
                            fontSize: 14,
                            onTap: () async {
                              await controller.signInWithGoogle();
                            },
                            showPrefixIcon: true,
                            addStandardMargin: true,
                          )),
                      Container(
                          margin:
                              EdgeInsets.only(left: 41, right: 41, bottom: 16),
                          child: TabItem(
                            height: 40,
                            cornerRadius: 10,
                            leftIcon: Icons.email,
                            title: 'Use email address',
                            borderColor: Colors.black,
                            backgroundColor: AppColors.appBg,
                            fontType: AppFont.SemiBold,
                            fontSize: 14,
                            titleColor: Colors.black,
                            isIcon: false,
                            image: AppImages.emailIcon,
                            iconColor: Colors.black,
                            onTap: () {
                              Get.to(EnterEmailScreen());
                            },
                            showPrefixIcon: true,
                            addStandardMargin: true,
                          )),
                      SizedBox(height: 20),
                      Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            text: 'By signing up, you agree to our ',
                            style: GetAppFont.getInstance().addStyle(
                                name: AppFont.Avenir,
                                fs: 12,
                                fontType: AppFont.Medium,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Terms',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => print('Tap Here onTap'),
                                  style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontFamily: 'avenir',
                                      fontWeight: FontWeight.w600)),
                              const TextSpan(
                                  text: '. See how we use \nyour data in our '),
                              TextSpan(
                                  text: 'Privacy Policy.',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => print('Tap Here onTap'),
                                  style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontFamily: 'avenir',
                                      fontWeight: FontWeight.w600))
                              // can add more TextSpans here...
                            ],
                          )),
                      SizedBox(height: 300),
                    ],
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

class AppButton extends StatelessWidget {
  final bool isEnabled;
  final double cornerRadius;
  final IconData? leftIcon;
  final String title;
  final Color borderColor;
  final Color backgroundColor;
  final Color titleColor;
  final Color? iconColor;
  final bool isIcon;
  final String? image;
  final Function() onTap;
  final bool showPrefixIcon;
  final bool addStandardMargin;
  final bool? showSuffixIcon;
  final String? suffixImage;
  final AppFont? fontType;
  final int? fontSize;

  AppButton({
    super.key,
    required this.cornerRadius,
    this.leftIcon,
    required this.title,
    required this.borderColor,
    required this.backgroundColor,
    required this.titleColor,
    this.isIcon = false,
    this.image,
    this.iconColor,
    required this.onTap,
    this.showPrefixIcon = false,
    this.addStandardMargin = true,
    this.showSuffixIcon = false,
    this.suffixImage,
    this.fontType,
    this.fontSize,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled ? onTap : null,
      child: Container(
        padding: EdgeInsets.only(top: 8, bottom: 8),
        decoration: BoxDecoration(
            color: isEnabled ? backgroundColor : Colors.grey,
            shape: BoxShape.rectangle,
            border: Border.all(width: 1.5, color: borderColor),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 0,
                  offset: Offset(-3, 3),
                  blurRadius: 1)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            showPrefixIcon
                ? isIcon
                    ? Icon(leftIcon, color: iconColor)
                    : SvgPicture.asset(
                        image!,
                        width: 16,
                        height: 16,
                        fit: BoxFit.fitWidth,
                        color: iconColor,
                      )
                : Container(width: 0, height: 0),
            SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                title,
                style: GetAppFont().addStyle(
                    name: AppFont.Avenir,
                    fs: fontSize?.toDouble() ?? 14,
                    fontType: fontType ?? AppFont.SemiBold,
                    color: titleColor),
              ),
            ),
            showSuffixIcon == true
                ? isIcon
                    ? Icon(leftIcon, color: iconColor)
                    : SvgPicture.asset(
                        suffixImage!,
                        width: 15,
                        color: iconColor,
                      )
                : Container(width: 0, height: 0),
          ],
        ),
      ),
    );
  }
}

enum AppFont { Regular, Bold, SemiBold, Thin, Recoleta, Medium, Avenir }

class GetAppFont {
  static var instance;

  static GetAppFont getInstance() {
    if (instance == null) {
      instance = GetAppFont();
      return instance;
    }
    return instance;
  }

  TextStyle addStyle(
      {required AppFont name,
      required double fs,
      required AppFont fontType,
      required Color color,
      double? letterSpacing,
      double height = 1}) {
    // w100: Thin, the thinnest font weight.
    // w200: Extra light.
    // w400: Normal. The constant FontWeight. normal is an alias for this value.
    // w700: Bold. The constant FontWeight. ...
    // w900: Black, the thickest font weight.
    String fontFamily = 'Recoleta';
    FontWeight fontWeight = FontWeight.w400;
    if (name == AppFont.Recoleta) {
      fontFamily = 'recoleta';
      if (fontType == AppFont.Bold) {
        fontWeight = FontWeight.w700;
      } else if (fontType == AppFont.Thin) {
        fontWeight = FontWeight.w100;
      } else if (fontType == AppFont.SemiBold) {
        fontWeight = FontWeight.w600;
      } else if (fontType == AppFont.Regular) {
        fontWeight = FontWeight.w400;
      } else if (fontType == AppFont.Medium) {
        fontWeight = FontWeight.w500;
      }
      return TextStyle(
          fontSize: fs,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
          height: height,
          color: color);
    } else {
      fontFamily = 'avenir';
      if (fontType == AppFont.Bold) {
        fontWeight = FontWeight.w700;
      } else if (fontType == AppFont.Thin) {
        fontWeight = FontWeight.w100;
      } else if (fontType == AppFont.SemiBold) {
        fontWeight = FontWeight.w600;
      } else if (fontType == AppFont.Regular) {
        fontWeight = FontWeight.w400;
      } else if (fontType == AppFont.Medium) {
        fontFamily = 'avenir-medium';
        fontWeight = FontWeight.w500;
      }
      return TextStyle(
          fontSize: fs,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
          color: color,
          letterSpacing:
              fontFamily == 'avenir' || fontFamily == 'avenir-medium' ? 0 : 0);
    }
  }
}
