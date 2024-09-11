import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recess/Utility/text_field_with_header.dart'; // Assuming this is your custom widget
import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/app_constants/app_pm_standards.dart';

import '../../Utility/expert_list_item.dart';
import '../../controllers/search_controller.dart';
import '../../models/home_screen_model/approve_expert_profiles.model.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final ProfileSearchController controller = Get.put(ProfileSearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBg,
      appBar: null,
      body: Container(
        color: AppColors.appBg,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: AppPMStandards.shared.leftPadding,
                right: AppPMStandards.shared.leftPadding,
              ),
              child: txtFieldWithheader(
                // Assuming it builds a search field
                showHeader: false,
                headerTxt: '',
                hintTxt: 'Search',
                onChanged: (value) => controller.searchFilter(value),
                icon: Icon(Icons.search),
              ),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.searchProfiles.length,
                    itemBuilder: (context, index) {
                      ApprovedExpertProfileModel item =
                          controller.searchProfiles[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ExpertListItem(
                          position: index,
                          profiles: item,
                        ),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
