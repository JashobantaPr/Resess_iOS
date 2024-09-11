import 'package:flutter/material.dart';

import '../app_constants/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Color fillColor;
  final Color checkColor;
  final Color borderColor;

  const CustomCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.fillColor = AppColors.appGray,
    this.checkColor = Colors.black,
    this.borderColor = AppColors.appGray,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: value ? fillColor : AppColors.appGray,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(4),
        ),
        child: value ? Icon(Icons.check, color: checkColor, size: 16) : null,
      ),
    );
  }
}
