import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../Auth/login_options_screen.dart';
import '../app_constants/app_colors.dart';

class SearchableTextFieldWithHeader extends StatefulWidget {
  final String headerTxt, hintTxt;
  final int lines, txtFieldHeight;
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
  Function()? onTapSuffix;
  String? Function(String?)? validator;

  TextEditingController? txtController;
  TextInputType? txtInputType;


  SearchableTextFieldWithHeader({super.key,
    required this.headerTxt,
    required this.hintTxt,
    this.lines = 1,
    this.txtFieldHeight = 50,
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
    this.txtInputType = TextInputType.text,
    this.subHeaderText = '', this.validator, this.errorTxt});

  @override
  State<SearchableTextFieldWithHeader> createState() =>
      _SearchableTextFieldWithHeader();
}

class _SearchableTextFieldWithHeader
    extends State<SearchableTextFieldWithHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    widget.showHeader
    ? Padding(
    padding: EdgeInsets.only(left: 5),
    child: Text(widget.headerTxt,
    style: GetAppFont.getInstance().addStyle(
    name: AppFont.Avenir,
    fs: 14,
    fontType: AppFont.SemiBold,
    color: Colors.black)),
    )
        : Container(width: 0, height: 0),
    SizedBox(height: 5),
    widget.showSubHeader
    ? Padding(
    padding: EdgeInsets.only(left: 5),
    child: Text(widget.subHeaderText,
    style: GetAppFont.getInstance().addStyle(
    name: AppFont.Avenir,
    fs: 12,
    fontType: AppFont.Medium,
    color: Colors.black)),
    )
        : Container(width: 0, height: 0),
    Container(
    margin: EdgeInsets.only(top: 5, bottom: 15),
    height: widget.txtFieldHeight.toDouble(),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(4.0),
    color: AppColors.txtFillColor,
    boxShadow: [
    BoxShadow(
    color: AppColors.shadowColor,
    blurRadius: 2.0,
    spreadRadius: 0.0,
    offset: Offset(2.0, 2.0), // shadow direction: bottom right
    )
    ]),
    child: DropdownSearch<String>(
    items: List.generate(5, (index) => "$index"),
    popupProps: PopupProps.menu(
    fit: FlexFit.loose,
    menuProps: MenuProps(
    backgroundColor: Colors.transparent,
    elevation: 0,
    ),
    containerBuilder: (ctx, popupWidget) {
    return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
    Padding(
    padding: const EdgeInsets.only(right: 12),
    child: Image.asset(
    'assets/images/arrow-up.png',
    color: Color(0xFF2F772A),
    height: 12,
    ),
    ),
    Flexible(
    child: Container(
    child: popupWidget,
    color: Color(0xFF2F772A),
    ),
    ),
    ],
    );
    },
    ),
    ),
    // maxLines: widget.lines,
    // controller: widget.txtController,
    // obscureText: widget.isObscure,
    // autofocus: false,
    // keyboardType: widget.txtInputType,
    // onChanged: widget.validator,
    // style: GetAppFont.getInstance().addStyle(
    //     name: AppFont.Recoleta,
    //     fs: 13,
    //     fontType: AppFont.Medium,
    //     color: Colors.black),
    // decoration: InputDecoration(
    //     icon: Padding(
    //       child: widget.icon,
    //       padding: EdgeInsets.only(left: 10),
    //     ),
    //     suffixIconConstraints:
    //     BoxConstraints(minHeight: 24, minWidth: 24),
    //     suffixIcon: InkWell(
    //       onTap: widget.onTapSuffix,
    //       child: widget.isRightSvg
    //           ? Padding(
    //         child: SvgPicture.asset(
    //           widget.svgPath!,
    //           width: 10,
    //           height: 20,
    //         ),
    //         padding: EdgeInsets.only(left: 5, right: 10),
    //       )
    //           : Padding(
    //         child: widget.iconRight,
    //         padding: EdgeInsets.only(left: 5, right: 5),
    //       ),
    //     ),
    //     hintText: widget.hintTxt,
    //     fillColor: AppColors.textGray,
    //     filled: true,
    //     contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
    //     border: InputBorder.none,
    //     enabledBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(4.0),
    //         borderSide:
    //         BorderSide(color: AppColors.textGray, width: 0.0))),
    // ),
    ),
    ],
    );
  }
}