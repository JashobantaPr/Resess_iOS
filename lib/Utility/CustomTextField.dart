import 'package:flutter/material.dart';
import 'package:recess/Auth/login_options_screen.dart';

class CustomInputTextField extends StatelessWidget {
  String hint;
  String prefixImage;
  bool showPrefix = true;
  bool showSuffix = true;
  String suffixImage;
  bool isIcon = false;
  IconData? iconData;

  CustomInputTextField(
      {super.key,
      required this.hint,
      required this.prefixImage,
      required this.showPrefix,
      required this.suffixImage,
      required this.showSuffix,
      required this.isIcon,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          filled: false,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintStyle: const TextStyle(
              color: Colors.grey, fontSize: 14, fontWeight: FontWeight.normal),
          hintText: hint,
          // labelText: hint,
          fillColor: Colors.transparent,
          prefixIcon: showPrefix && isIcon
              ? IconButton(icon: Icon(iconData), onPressed: () {})
              : showPrefix
                  ? IconButton(
                      icon: Image.asset(
                        prefixImage,
                        width: 25.0,
                        height: 25.0,
                        color: Colors.black54,
                      ),
                      onPressed: () {})
                  : null,
          suffixIcon: showSuffix && isIcon
              ? IconButton(icon: Icon(iconData), onPressed: () {})
              : showSuffix
                  ? IconButton(
                      icon: Image.asset(
                        suffixImage,
                        width: 25.0,
                        height: 25.0,
                        color: Colors.grey,
                      ),
                      onPressed: () {})
                  : null),
      // obscureText: true,
      style: GetAppFont.getInstance().addStyle(
          name: AppFont.Recoleta,
          fs: 13,
          fontType: AppFont.Medium,
          color: Colors.black),
    );
  }
}
