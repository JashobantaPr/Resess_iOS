import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:recess/Dashboard/home/digital_marketing_screen.dart';
import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/app_constants/app_pm_standards.dart';
import 'package:recess/controllers/settings/favourites_experts_controller.dart';

import '../../../Auth/login_options_screen.dart';

class FavouritesSubjectScreen extends GetWidget<FavouritesSubjectController> {
  FavouritesSubjectScreen({super.key});
  final FavouritesSubjectController controller =
      Get.put(FavouritesSubjectController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBg,
      body: Column(
        children: [
          SizedBox(height: 25),
          // _buildText(context),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              final bookmarks =
                  controller.bookmarkSubjectResponse.value?.data?.bookmarks ??
                      [];

              if (bookmarks.isEmpty) {
                return Center(
                  child: Text("No bookmarked Subjects found",
                      style: GetAppFont.getInstance().addStyle(
                          fs: 16,
                          height: 1.1,
                          fontType: AppFont.SemiBold,
                          name: AppFont.Avenir,
                          color: Colors.black)),
                );
              }

              return ListView.builder(
                itemCount: bookmarks.length,
                itemBuilder: (context, index) {
                  final subject = bookmarks[index];
                  return SubjectListItem(context,
                      position: index,
                      mySubject: subject.mySubject ?? [],
                      isbookmarked: subject.isSubjectBookedMark);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  // Widget _buildText(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[

  //     ],
  //   );
  // }

  Widget SubjectListItem(
    BuildContext context, {
    Color? bgColor = AppColors.cardBg,
    bool? isDetailPage = false,
    String type = 'chat',
    required int position,
    required List<String> mySubject,
    bool? isbookmarked,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 18, right: 18),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(AppPMStandards.shared.cardCorner)),
          border: isDetailPage == true
              ? Border.all(
                  width: 1, color: AppColors.cardStroke.withOpacity(0.15))
              : null,
          color: bgColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
            ),
          ],
        ),
        margin: EdgeInsets.only(left: 2, right: 2),
        padding: EdgeInsets.only(left: 14, right: 13, top: 12, bottom: 13),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    mySubject.isNotEmpty ? mySubject[0] : 'No Subject',
                    style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Recoleta,
                      height: 2,
                      fs: 16,
                      fontType: AppFont.Bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.addbookMarkForSubject(
                        mySubject.isNotEmpty ? mySubject[0] : 'No Subject',
                        position);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Obx(
                      () => SvgPicture.asset(
                        controller.isExpertBookmarkedList[position]
                            ? 'assets/images/tickbadge.svg'
                            : 'assets/images/tickbadgeblack.svg',
                        width: 14.63,
                        height: 18.69,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              color: Color(0XFF18181826),
              thickness: 1.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '60 minutes engaged',
                  style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Avenir,
                    height: 2,
                    fs: 12,
                    fontType: AppFont.SemiBold,
                    color: Colors.black,
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (mySubject?.isNotEmpty == true) {
                      print(
                          "Subject to pass: ${mySubject?.first}"); // Debug line
                      Get.to(
                        DigitalMarketingScreen(),
                        arguments: mySubject?.join(","),
                      );
                    }
                  },
                  child: Row(
                    children: [
                      Text(
                        'View Subject',
                        style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Avenir,
                          height: 2,
                          fs: 12,
                          fontType: AppFont.SemiBold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                        size: 12,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
