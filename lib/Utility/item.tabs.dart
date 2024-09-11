import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Auth/login_options_screen.dart';

class TabItems extends StatelessWidget {
  final double cornerRadius;
  final IconData? leftIcon;
  final String title;
  final Color borderColor;
  final Color backgroundColor;
  final Color titleColor;
  final Color? iconColor;
  final bool isIcon;
  final String image;
  final Function() onTap;
  final bool showPrefixIcon;
  final bool addStandardMargin;
  final bool? showSuffixIcon;
  final String? suffixImage;
  final AppFont? fontType;
  final int? fontSize;
  final double? height;
  final double? suffixIconHeight, suffixIconWidth;
  final bool showBackArrow;

  TabItems({
    Key? key,
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
    this.width,
    this.showBackArrow = false,
  }) : super(key: key);

  final EdgeInsets? addEdgeInsets;
  final CrossAxisAlignment? crossAxisAlignment;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: addEdgeInsets ??
            const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
              blurRadius: 1,
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize
              .min, // Ensure the button's width is based on its content
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: [
            if (showPrefixIcon)
              isIcon
                  ? Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Icon(leftIcon, color: iconColor),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: SvgPicture.asset(image, color: iconColor),
                    ),
            Text(
              title,
              style: GetAppFont().addStyle(
                  name: AppFont.Avenir,
                  fs: fontSize?.toDouble() ?? 14,
                  fontType: fontType ?? AppFont.SemiBold,
                  color: titleColor),
            ),
            SizedBox(
              width: 5,
            ),
            if (showSuffixIcon == true)
              isIcon
                  ? Icon(leftIcon, color: iconColor)
                  : SvgPicture.asset(
                      suffixImage!,
                      color: iconColor,
                      height: suffixIconHeight ?? 16,
                      width: suffixIconWidth ?? 16,
                    ),
            if (showBackArrow)
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Icon(Icons.arrow_back, color: iconColor),
              ),
          ],
        ),
      ),
    );
  }
}
