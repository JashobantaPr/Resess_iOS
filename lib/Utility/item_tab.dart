import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Auth/login_options_screen.dart';

class TabItem extends StatelessWidget {
  final double cornerRadius;
  IconData? leftIcon;
  final String title;
  final Color borderColor;
  final Color backgroundColor;
  final Color titleColor;
  final Color? iconColor;
  final bool isIcon;
  final String image;
  final Function() onTap;
  bool showPrefixIcon = false;
  bool addStandardMargin = true;
  bool? showSuffixIcon = false;
  String? suffixImage;
  AppFont? fontType;
  int? fontSize;
  double? height;
  double? suffixIconHeight, suffixIconWidth;

  TabItem(
      {super.key,
      this.suffixIconHeight,
      this.suffixIconWidth,
      required this.cornerRadius,
      this.leftIcon,
      required this.title,
      required this.borderColor,
      required this.backgroundColor,
      required this.titleColor,
      required this.isIcon,
      required this.image,
      required this.iconColor,
      required this.onTap,
      required this.showPrefixIcon,
      required this.addStandardMargin,
      this.showSuffixIcon,
      this.suffixImage,
      this.fontType,
      this.fontSize,
      this.height,
      this.addEdgeInsets,
      this.crossAxisAlignment,
      this.width});

  EdgeInsets? addEdgeInsets;
  CrossAxisAlignment? crossAxisAlignment;
  double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 36,
        width: width,
        padding:
            addEdgeInsets ?? EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
            color: backgroundColor,
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
        // padding: EdgeInsets.only(left: 10,right: 9,top: 10,bottom: 9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: [
            showPrefixIcon
                ? isIcon
                    ? Container(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(leftIcon, color: iconColor))
                    : Container(
                        padding: EdgeInsets.only(right: 5),
                        child: SvgPicture.asset(image, color: iconColor),
                      )
                : const SizedBox(width: 0, height: 0),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: GetAppFont().addStyle(
                  name: AppFont.Avenir,
                  fs: fontSize?.toDouble() ?? 14,
                  fontType: fontType ?? AppFont.SemiBold,
                  color: titleColor),
            ),
            showSuffixIcon != null
                ? isIcon
                    ? Icon(leftIcon, color: iconColor)
                    : SvgPicture.asset(
                        suffixImage!,
                        color: iconColor,
                        height: suffixIconHeight ?? 16,
                        width: suffixIconWidth ?? 16,
                      )
                : Container(width: 0, height: 0),
          ],
        ),
      ),
    );
  }
}
