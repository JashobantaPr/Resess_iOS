import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/app_constants/app_colors.dart';

class txtFieldWithheader extends StatefulWidget {
  final String headerTxt, hintTxt;
  final int lines, txtFieldHeight;
  final bool readOnly; // Add this line
    final List<TextInputFormatter>? inputFormatters; // Add this line

  Rx<String> errorObs = ''.obs;
  String? errorTxt = "";
  String subHeaderText;
  String? svgPath;
  bool showHeader,
      showSubHeader,
      showLeftIcon,
      showRightIcon,
      isRightSvg,
      isObscure;
  Icon? icon, iconRight;
  Function()? onTapSuffix, onTap;
  Function(PointerDownEvent)? onTapOut;
  String? Function(String?)? validator;
  Function(String)? onChanged;

  TextEditingController? txtController;
  TextInputType? txtInputType;
  int marginBottom;
  String obscureChar;
  bool? expOnboard;
  String? errorMessage;

  txtFieldWithheader(
      {super.key,
      this.obscureChar = "*",
      required this.headerTxt,
      required this.hintTxt,
      this.lines = 1,
      this.txtFieldHeight = 40,
      this.readOnly = false, // Add this line
            this.inputFormatters, // Add this line

      this.showHeader = true,
      this.showLeftIcon = false,
      this.showRightIcon = false,
      this.icon,
      this.iconRight,
      this.showSubHeader = false,
      this.isRightSvg = false,
      this.svgPath,
      this.isObscure = false,
      this.onTapSuffix,
      this.txtController,
      this.marginBottom = 15,
      this.txtInputType = TextInputType.text,
      this.subHeaderText = '',
      this.validator,
      this.errorTxt,
      this.onTapOut,
      this.onTap,
      this.expOnboard = false,
      this.errorMessage,
      this.onChanged});

  @override
  State<txtFieldWithheader> createState() => _txtFieldWithheaderState();
}

class _txtFieldWithheaderState extends State<txtFieldWithheader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showHeader
            ? Padding(
                padding: EdgeInsets.only(left: 0,),
                child: Text(widget.headerTxt,
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 14,
                        fontType:
                            widget.showSubHeader || widget.expOnboard == true
                                ? AppFont.SemiBold
                                : AppFont.Medium,
                        color: Colors.black)),
              )
            : Container(width: 0, height: 0),
        widget.showSubHeader
            ? Padding(
                padding: EdgeInsets.only(top: 5, left: 0, bottom: 5),
                child: Text(widget.subHeaderText,
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 12,
                        fontType: AppFont.Medium,
                        color: Colors.black)),
              )
            : Container(width: 0, height: 0),
        Container(
          margin:
              EdgeInsets.only(top: 12, bottom: widget.marginBottom.toDouble()),
          height: widget.txtFieldHeight.toDouble(),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: AppColors.txtFillColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.btnBlack.withOpacity(0.25),
                  blurRadius: 1.0,
                  spreadRadius: 0.0,
                  offset: Offset(-3.0, 3.0), // shadow direction: bottom right
                )
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            child: TextFormField(
              readOnly: widget.readOnly, // Add this line
              obscuringCharacter: widget.obscureChar,
              onTap: widget.onTap,
              onTapOutside: widget.onTapOut,
              maxLines: widget.lines,
              controller: widget.txtController,
              obscureText: widget.isObscure,
              autofocus: false,
              keyboardType: widget.txtInputType,
              onChanged: widget.onChanged,
                            inputFormatters: widget.inputFormatters, // Add this line

              style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Avenir,
                  fs: 13,
                  fontType: AppFont.Medium,
                  color: AppColors.btnBlack),
              decoration: InputDecoration(
                  suffixIconConstraints:
                      const BoxConstraints(minHeight: 24, minWidth: 24),
                  suffixIcon: InkWell(
                    onTap: widget.onTapSuffix,
                    child: widget.isRightSvg
                        ? Padding(
                            padding: const EdgeInsets.only(left: 5, right: 10),
                            child: SvgPicture.asset(
                              widget.svgPath!,
                              width: 10,
                              height: 20,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: widget.iconRight,
                          ),
                  ),
                  hintText: widget.hintTxt,
                  fillColor: AppColors.txtFillColor,
                  errorMaxLines: 0,
                  filled: true,
                  hintStyle: GetAppFont.getInstance().addStyle(
                      name: AppFont.Avenir,
                      fs: 13,
                      fontType: AppFont.Medium,
                      color: AppColors.txtHintColor),
                  contentPadding: widget.txtFieldHeight != null
                      ? EdgeInsets.symmetric(vertical: 0, horizontal: 9)
                      : EdgeInsets.symmetric(vertical: 5, horizontal: 13),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none),
            ),
          ),
        ),
        widget.errorMessage != null && widget.errorMessage!.isNotEmpty
            ? Text(
                widget.errorMessage!,
                style: TextStyle(color: Colors.red),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
