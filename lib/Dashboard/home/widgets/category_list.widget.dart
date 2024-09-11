import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recess/controllers/home_controller.dart';

import '../../../Auth/login_options_screen.dart';
import '../../../app_constants/app_colors.dart';
import '../../../models/home_screen_model/category_model.dart';

class CategoryListWidget extends StatelessWidget {
  CategoryListWidget(
      {super.key, this.category, required this.onTap, required this.index});

  final CategoryModel? category;
  final int index;
  final Function(int) onTap;

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
      child: Row(
        children: [
          Obx(() {
            bool isSelected =
                controller.selectedCategory.value == category?.categoryText;
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
                color: controller.getColor(category?.categoryText ?? ""),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.btnBlack.withOpacity(0.25),
                    blurRadius: 1.0,
                    spreadRadius: 0.0,
                    offset: Offset(-3.0, 3.0), // shadow direction: bottom right
                  )
                ],
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    controller.categoryFilter(category?.categoryText);
                    onTap(index);
                  },
                  child: Row(
                    children: [
                      if (isSelected)
                        Image.asset(
                          "assets/images/checkicon.png",
                          width: 15,
                          height: 15,
                        ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        category?.categoryText ?? "",
                        style: GetAppFont.getInstance().addStyle(
                            name: AppFont.Avenir,
                            fs: 14,
                            fontType: AppFont.SemiBold,
                            height: 1.2,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
