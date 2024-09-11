import 'package:flutter/material.dart';
import 'package:recess/app_constants/app_colors.dart';


Container circularProgress() {
  return Container(
    padding: EdgeInsets.only(top:10.0),
    alignment: Alignment.center,
    child: const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(AppColors.appBg),
    ),
  );
}