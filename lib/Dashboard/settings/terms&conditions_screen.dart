import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Utility/app_back_btn.dart';
import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/controllers/settings/terms&conditions_controller.dart';

class TermsandConditionsScreen extends StatelessWidget {
  TermsandConditionsScreen({super.key});

  // GetX Controller instance
  final TermsandConditionsController controller =
      Get.put(TermsandConditionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBg,
      appBar: AppBar(
        backgroundColor: AppColors.appBg,
        leadingWidth: 100,
        leading: AppBackBtn(),
      ),
      body: Obx(() {
        // Show a circular progress indicator while loading
        if (controller.loadingState.value) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor, // Customize the color if needed
            ),
          );
        }

        // Show the terms and conditions content
        return RefreshIndicator(
          onRefresh: () async {
            await controller.getAllTerms();
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Terms & Conditions',
                  style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Recoleta,
                    fs: 26,
                    fontType: AppFont.Bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.0),
                Divider(height: 1),
                SizedBox(height: 12.0),
                Obx(() {
                  if (controller.termsList.isEmpty) {
                    return Center(
                      child: Text(
                        "No terms and conditions available.",
                        style: GetAppFont.getInstance().addStyle(
                          fs: 13,
                          height: 1.1,
                          fontType: AppFont.Medium,
                          name: AppFont.Avenir,
                          color: Colors.black,
                        ),
                      ),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: controller.termsList.map((term) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            term.terms ?? 'No terms available.',
                            style: GetAppFont.getInstance().addStyle(
                              fs: 13,
                              height: 1.1,
                              fontType: AppFont.Medium,
                              name: AppFont.Avenir,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }
                }),
              ],
            ),
          ),
        );
      }),
    );
  }
}
