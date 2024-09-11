import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:recess/Utility/AppImages.dart';

import '../../../Auth/login_options_screen.dart';
import '../../../controllers/home_controller.dart';
import '../../../models/home_screen_model/category_model.dart';
import 'category_subcategor_all_list.widget.dart';

class AddFilterBottomSheet extends GetWidget<HomeController> {
  AddFilterBottomSheet({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: SingleChildScrollView(
        primary: false,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
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
              Text(
                "Filter by Subject",
                style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Recoleta,
                    fs: 24,
                    fontType: AppFont.Bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              _buildDivider(),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  controller.resetSubjectFilter();
                  Get.back();
                },
                child: Row(children: [
                  Image.asset(
                    "assets/images/reseticon.png",
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Reset Filters",
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 14,
                        fontType: AppFont.SemiBold,
                        height: 1.2,
                        color: Colors.black),
                  ),
                ]),
              ),
              _buildDivider(),
              SizedBox(
                height: 20,
              ),
              _buildListOfCategorySubCategory(),
            ],
          ),
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

  Widget _buildListOfCategorySubCategory() {
    return Container(
      width: double.maxFinite,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemCount: controller.categories.length,
        separatorBuilder: (context, index) {
          if (controller.categories[index].categoryText == "All") {
            return const SizedBox.shrink();
          }
          return _buildDivider();
        },
        itemBuilder: (context, index) {
          CategoryModel item = controller.categories[index];
          if (item.categoryText == "All") {
            return const SizedBox.shrink();
          }
          return CategoryAndSubCategoryAllList(item: item);
        },
      ),
    );
  }
}
