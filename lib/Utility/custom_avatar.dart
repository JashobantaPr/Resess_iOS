import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_constants/app_colors.dart';

class CustomAvatar extends StatelessWidget {
  final double radius, height;
  final String imageUrl;
  final Color bgColor;

  const CustomAvatar({
    super.key,
    required this.radius,
    this.height = 90,
    this.bgColor = AppColors.primaryColor,
    required this.imageUrl,
  });

  @override
  CircleAvatar build(BuildContext context) => CircleAvatar(
    backgroundColor: bgColor,
    radius: radius,
    child: imageUrl != ''
        ? Container(
      width: height,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          color: AppColors.primaryColor, shape: BoxShape.circle),
      child: Image.network(
        imageUrl,
        fit: BoxFit.fill,
      ),
    )
        : Icon(
      Icons.person,
      color: AppColors.white,
      size: radius,
    ),
  );
}