import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recess/controllers/home_controller.dart';
import 'package:recess/models/home_screen_model/sub_category_model.dart';

import '../../../Auth/login_options_screen.dart';
import '../../../models/home_screen_model/category_model.dart';

class CategoryAndSubCategoryAllList extends GetWidget<HomeController> {
  CategoryAndSubCategoryAllList({super.key, this.item});

  final CategoryModel? item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          item?.categoryText ?? "",
          style: GetAppFont.getInstance().addStyle(
              name: AppFont.Avenir,
              fs: 14,
              fontType: AppFont.SemiBold,
              height: 1.2,
              color: Colors.black),
        ),
        _buildDivider(),
        SizedBox(height: 10),
        _buildSubcategoryList(item?.subCategories ?? []),
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(
      thickness: 1,
      color: Colors.grey,
    );
  }

  Widget _buildSubcategoryList(List<SubCategoryModel> list) {
    final HomeController controller1 = Get.find<HomeController>();
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter updateState) {
      return ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          bool isSelected =
              controller.selectedSubCategory.value == list[index].subject;

          return GestureDetector(
            onTap: () {
              controller.subcategorySelector(list[index].subject!);
              updateState(() {});
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Aligns items at the start vertically
                children: [
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
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
                  SizedBox(
                      width: 10), // Spacing between the circle and the text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Aligns text at the start horizontally
                      children: [
                        Text(
                          list[index].subject.toString(),
                          style: GetAppFont.getInstance().addStyle(
                            name: AppFont.Avenir,
                            fs: 14,
                            fontType: AppFont.Avenir,
                            height: 1.2,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return _buildDivider();
        },
      );
    });
  }
}
