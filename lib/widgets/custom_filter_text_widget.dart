import 'package:flutter/material.dart';

import '../Auth/login_options_screen.dart';

class CustomRadio<T> extends StatelessWidget {
  final T value;
  final String label;
  final T? groupValue;
  final Function(T?) onChanged;

  const CustomRadio({
    Key? key,
    required this.value,
    required this.label,
    required this.onChanged,
    required this.groupValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        children: [
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.black : Colors.black,
                width: 2.0,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                  )
                : null,
          ),
          SizedBox(width: 8),
          Text(
            label,
            style: GetAppFont.getInstance().addStyle(
                name: AppFont.Avenir,
                fs: 14,
                fontType: AppFont.Medium,
                height: 1.2,
                color: Colors.black),
          ),
          SizedBox(width: 35),
        ],
      ),
    );
  }
}
