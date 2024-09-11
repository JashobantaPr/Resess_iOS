import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:recess/Utility/AppImages.dart';

import '../../../Auth/login_options_screen.dart';
import '../../../controllers/home_controller.dart';
import '../../../widgets/custom_filter_text_widget.dart';

class SortFilterWidgets extends GetWidget<HomeController> {
  SortFilterWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: SvgPicture.asset(AppImages.xmarkIcon)),
            ]),
        _buildHeader(),
      ],
    );
  }

  Widget _buildHeader() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sort by",
              style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Recoleta,
                  fs: 24,
                  fontType: AppFont.Bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            _buildDivider(),
            SizedBox(
              height: 10,
            ),
            CustomRadio<String?>(
                value: "featured",
                label: "Featured",
                onChanged: (value) {
                  controller.toggleSelection(value);
                },
                groupValue: controller.sortBy.value),
            SizedBox(
              height: 10,
            ),
            _buildDivider(),
            SizedBox(
              height: 10,
            ),
            CustomRadio<String?>(
                value: "atoz",
                label: "Name (A-Z)",
                onChanged: (value) {
                  controller.toggleSelection(value);
                },
                groupValue: controller.sortBy.value),
            SizedBox(
              height: 10,
            ),
            _buildDivider(),
            SizedBox(
              height: 10,
            ),
            CustomRadio<String?>(
                value: "ztoa",
                label: "Name (Z-A)",
                onChanged: (value) {
                  controller.toggleSelection(value);
                },
                groupValue: controller.sortBy.value),
            SizedBox(
              height: 10,
            ),
            _buildDivider(),
            SizedBox(
              height: 10,
            ),
            CustomRadio<String?>(
                value: "lowToHigh",
                label: "Price (Low to High)",
                onChanged: (value) {
                  controller.toggleSelection(value);
                },
                groupValue: controller.sortBy.value),
            SizedBox(
              height: 10,
            ),
            _buildDivider(),
            SizedBox(
              height: 10,
            ),
            CustomRadio<String?>(
                value: "highToLow",
                label: "Price (high to Low)",
                onChanged: (value) {
                  controller.toggleSelection(value);
                },
                groupValue: controller.sortBy.value),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      thickness: 1,
      color: Colors.grey,
    );
  }
}
