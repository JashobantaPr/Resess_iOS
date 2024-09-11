import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:recess/Dashboard/home/balance_top_up_screen.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/Utility/app_back_btn.dart';
import 'package:recess/Utility/item_tab.dart';
import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/core/url.dart';

import '../../Auth/login_options_screen.dart';
import '../../app_constants/app_pm_standards.dart';
import '../../controllers/home_controller.dart';
import '../../models/settings_model/getmysubject_model.dart';
import 'widgets/add_filter_bottomsheet.widget.dart';
import 'widgets/sort_filter_bottomsheet.dart';

class DigitalMarketingScreen extends GetWidget<HomeController> {
  DigitalMarketingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String receivedSubject = Get.arguments as String? ?? "";
    controller.addsubject.value = receivedSubject;
    controller.getMySubject(receivedSubject);
    final subjectId = Get.arguments as String?;

    return Scaffold(
      backgroundColor: AppColors.appBg,
      appBar: AppBar(
        backgroundColor: AppColors.appBg,
        surfaceTintColor: Colors.transparent,
        leadingWidth: 100,
        leading: AppBackBtn(),
        actions: [
          Container(
            height: 30,
            padding:
                EdgeInsets.only(right: AppPMStandards.shared.homeRightPadding),
            child: InkWell(
              onTap: () {
                Get.to(BalanceTopUpScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 4),
                    child: SvgPicture.asset(AppImages.walletIcon, width: 30),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      "\$20.00",
                      textAlign: TextAlign.end,
                      style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 14,
                        fontType: AppFont.SemiBold,
                        height: 1.2,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: SvgPicture.asset(AppImages.forwardIcon, width: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Obx(() => Container(
            color: Color(0XFFF5F3EE), // Set the background color to white
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.addsubject.value ?? "Digital Marketing",
                        style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Recoleta,
                          fs: 30,
                          fontType: AppFont.Bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Learn key digital marketing skills like SEO, social media, and content strategy from industry experts. Enhance your ability to promote your brand and advance your career with personalized guidance.",
                        style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Avenir,
                          fs: 14,
                          fontType: AppFont.Medium,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 1),
                      _tabWidget(context),
                      SizedBox(height: 20),
                      _buildFilterOptions(),
                      SizedBox(height: 20),
                      _buildAddSubjectFavourites(subjectId ?? "",
                          controller), // Pass subjectId and controller
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                // Expanded widget moved out of the Padding
                Expanded(
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      // Show a loading spinner or message while data is loading
                      return Center(child: CircularProgressIndicator());
                    }

                    if (controller.mySubjectlist.isEmpty) {
                      // Show a message if no subjects are available
                      return Center(
                        child: Text(
                          "No Subjects found",
                          overflow: TextOverflow.clip,
                          style: GetAppFont.getInstance().addStyle(
                            name: AppFont.Avenir,
                            fs: 14,
                            fontType: AppFont.Medium,
                            color: AppColors.btnBlack,
                          ),
                        ),
                      );
                    }

                    String type = controller.currentTab.value == 0
                        ? 'chat'
                        : controller.currentTab.value == 1
                            ? 'call'
                            : 'video';

                    // Show the list of subjects
                    return ListView.builder(
                      itemCount: controller.mySubjectlist.length,
                      itemBuilder: (context, index) {
                        final userdata = controller.mySubjectlist[index];
                        return ExpertListItem(
                          context,
                          position: index,
                          userdata: userdata,
                          tabtype: type,
                        );
                      },
                    );
                  }),
                )
              ],
            ),
          )),
    );
  }

  Widget _tabWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 17,
        // left: AppPMStandards.shared.leftPadding,
        // right: AppPMStandards.shared.homeRightPadding - 7
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TabItem(
              addEdgeInsets: EdgeInsets.all(0),
              width: 80,
              cornerRadius: 5,
              leftIcon: Icons.chat,
              title: "Chat",
              fontSize: 14,
              fontType: AppFont.SemiBold,
              borderColor: Colors.black,
              backgroundColor: controller.currentTab.value == 0
                  ? Colors.black
                  : AppColors.appBg,
              titleColor: controller.currentTab.value == 0
                  ? Colors.white
                  : Colors.black,
              isIcon: false,
              image: AppImages.chatIcon1,
              iconColor: controller.currentTab.value == 0
                  ? Colors.white
                  : Colors.black,
              onTap: () {
                controller.goToTab(0);
              },
              showPrefixIcon: true,
              addStandardMargin: false),
          SizedBox(width: 16),
          TabItem(
              addEdgeInsets: EdgeInsets.all(0),
              width: 80,
              fontSize: 14,
              fontType: AppFont.SemiBold,
              cornerRadius: 5,
              leftIcon: Icons.chat,
              title: "Call",
              borderColor: Colors.black,
              backgroundColor: controller.currentTab.value == 1
                  ? Colors.black
                  : AppColors.appBg,
              titleColor: controller.currentTab.value == 1
                  ? Colors.white
                  : Colors.black,
              isIcon: false,
              image: AppImages.callIcon,
              iconColor: controller.currentTab.value == 1
                  ? Colors.white
                  : Colors.black,
              onTap: () {
                controller.goToTab(1);
              },
              showPrefixIcon: true,
              addStandardMargin: false),
          SizedBox(width: 16),
          TabItem(
              addEdgeInsets: EdgeInsets.all(0),
              width: 80,
              fontSize: 14,
              fontType: AppFont.SemiBold,
              cornerRadius: 5,
              leftIcon: Icons.chat,
              title: "Video",
              borderColor: Colors.black,
              backgroundColor: controller.currentTab.value == 2
                  ? Colors.black
                  : AppColors.appBg,
              titleColor: controller.currentTab.value == 2
                  ? Colors.white
                  : Colors.black,
              isIcon: false,
              image: AppImages.videoIcon,
              iconColor: controller.currentTab.value == 2
                  ? Colors.white
                  : Colors.black,
              onTap: () {
                controller.goToTab(2);
              },
              showPrefixIcon: true,
              addStandardMargin: false),
          Spacer(),
          IconButton(
              onPressed: () {
                !controller.searchActive.value
                    ? controller.goToTab(3)
                    : {
                        controller.searchActive.value = false,
                        controller.goToTab(controller.currentTab.value)
                      };
              },
              icon: (controller.searchActive.value)
                  ? SvgPicture.asset(
                      AppImages.xmarkIcon,
                      height: 27,
                      width: 27,
                    )
                  : SvgPicture.asset(
                      AppImages.searchIcon,
                      height: 27,
                      width: 27,
                    ))
        ],
      ),
    );
  }

  Widget _buildFilterOptions() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              _showBottomSheet();
            },
            child: Image.asset(
              "assets/images/filtericon.png",
              width: 25,
              height: 25,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              _showBottomSheet();
            },
            child: Text(
              "Sort: Featured",
              style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Avenir,
                  fs: 14,
                  fontType: AppFont.Bold,
                  height: 1.2,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "|",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              _showAddFilterSheet();
            },
            child: Image.asset(
              "assets/images/filter.png",
              width: 25,
              height: 25,
            ),
          ),
          GestureDetector(
            onTap: () {
              _showAddFilterSheet();
            },
            child: Text(
              "Add Subject Filter",
              style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Avenir,
                  fs: 14,
                  fontType: AppFont.Bold,
                  height: 1.2,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildAddSubjectFavourites() {
  //   return Center(
  //     child: Container(
  //       width: 343,
  //       height: 64,
  //       decoration: BoxDecoration(
  //         border: Border.all(
  //           color: Color(0x18181826),
  //           width: 1.3,
  //         ),
  //         borderRadius: BorderRadius.circular(8),
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.only(left: 16.0),
  //             child: Row(
  //               children: [
  //                 SizedBox(width: 8),
  //                 Obx(() => Text(
  //                       controller.isBookmarked.value
  //                           ? "Subject added to Favourites"
  //                           : "Add Subject to Favourites",
  //                       style: GetAppFont.getInstance().addStyle(
  //                           name: AppFont.Avenir,
  //                           fs: 14,
  //                           fontType: AppFont.SemiBold,
  //                           height: 1.2,
  //                           color: Colors.black),
  //                     )),
  //               ],
  //             ),
  //           ),
  //           InkWell(
  //             onTap: () {
  //               controller.addbookMarkForSubject(controller.addsubject.value);
  //               print("Tick badge tapped!");
  //             },
  //             child: Padding(
  //               padding: const EdgeInsets.only(right: 16.0),
  //               child: Obx(() => SvgPicture.asset(
  //                     controller.isBookmarked.value
  //                         ? 'assets/images/tickbadge.svg'
  //                         : 'assets/images/tickbadgeblack.svg',
  //                     width: 24.0,
  //                     height: 24.0,
  //                   )),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildAddSubjectFavourites(
      String subjectId, HomeController controller) {
    return Center(
      child: Container(
        width: 343,
        height: 64,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0x18181826),
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  SizedBox(width: 8),
                  Obx(() {
                    bool isBookmarked =
                        controller.bookmarkedSubjects[subjectId] ?? false;
                    return Text(
                      isBookmarked
                          ? "Subject added to Favourites"
                          : "Add Subject to Favourites",
                      style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 14,
                        fontType: AppFont.SemiBold,
                        height: 1.2,
                        color: Colors.black,
                      ),
                    );
                  }),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                controller.addbookMarkForSubject(subjectId);
                print("Tick badge tapped for subject $subjectId!");
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Obx(() => SvgPicture.asset(
                      controller.bookmarkedSubjects[subjectId] ?? false
                          ? 'assets/images/tickbadge.svg'
                          : 'assets/images/tickbadgeblack.svg',
                      width: 14.63,
                      height: 18.69,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget ExpertListItem(BuildContext context,
  //     {Color? bgColor = AppColors.cardBg,
  //     bool? isDetailPage = false,
  //     required int position,
  //     required UserData userdata,
  //     required,
  //     required String tabtype}) {
  //   // Change MySubjectResponse to UserData
  //   return Padding(
  //     padding: EdgeInsets.only(top: 10, bottom: 10),
  //     child: Container(
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.all(
  //               Radius.circular(AppPMStandards.shared.cardCorner)),
  //           border: isDetailPage == true
  //               ? Border.all(
  //                   width: 1, color: AppColors.cardStroke.withOpacity(0.15))
  //               : null,
  //           color: bgColor,
  //           boxShadow: [
  //             isDetailPage == true
  //                 ? BoxShadow(
  //                     offset: Offset(0, 4),
  //                     spreadRadius: 0,
  //                     color: Colors.black.withOpacity(0.25),
  //                     blurRadius: 2)
  //                 : BoxShadow()
  //           ]),
  //       margin: EdgeInsets.only(left: 2, right: 2),
  //       padding: EdgeInsets.only(left: 14, right: 13, top: 12, bottom: 13),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           userImage(
  //             context,
  //             userdata.image,
  //           ),
  //           const SizedBox(width: 15),
  //           Container(
  //               width: 153,
  //               padding: EdgeInsets.only(top: 6),
  //               child: userText(context, userdata.name, userdata.yourOneLiner,
  //                   userdata.languages?.join(","), userdata.mySubject,
  //                   isDetailPage: isDetailPage ?? false, position: position)),
  //           const Spacer(),
  //           Container(
  //               padding: const EdgeInsets.only(top: 6),
  //               child: ExpertBadgeItem(
  //                   context,
  //                   tabtype,
  //                   position,
  //                   isDetailPage ?? false,
  //                   bgColor,
  //                   userdata.pricePerMinute, // Corrected to pricePerMinute
  //                   userdata.userId))
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget ExpertListItem(BuildContext context,
      {Color? bgColor = AppColors.cardBg,
      bool? isDetailPage = false,
      required int position,
      required UserData userdata,
      required String tabtype}) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: GestureDetector(
        onTap: () {
          if (userdata != null) {
            controller.otherProfiledata(userdata.userId);
            controller.onChangeNameAndImage(userdata.name, userdata.image);
          }
        },
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
                isDetailPage == true
                    ? BoxShadow(
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 2)
                    : BoxShadow()
              ]),
          margin: EdgeInsets.only(left: 2, right: 2),
          padding: EdgeInsets.only(left: 14, right: 13, top: 12, bottom: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              userImage(
                context,
                userdata.image,
              ),
              const SizedBox(width: 15),
           Expanded(
              flex: 4,
              child: Container(
                  padding: EdgeInsets.only(top: 6),
                  child: userText(context, userdata.name, userdata.yourOneLiner,
                      userdata.languages?.join(","), userdata.mySubject,
                      isDetailPage: isDetailPage ?? false, position: position))),
              const Spacer(),
              Container(
                  padding: const EdgeInsets.only(top: 6),
                  child: ExpertBadgeItem(
                      context,
                      tabtype,
                      position,
                      isDetailPage ?? false,
                      bgColor,
                      userdata.pricePerMinute,
                      userdata.userId))
            ],
          ),
        ),
      ),
    );
  }

  Widget ExpertBadgeItem(
      BuildContext context,
      String type,
      int position,
      bool isDetailPage,
      Color? bgColor,
      String? priceperminute,
      String? userId) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                // Call the controller method to toggle bookmark status
                controller.bookMarkForSubjectUser(userId, position);
              },
              child: Obx(() {
                // Use Obx to rebuild widget when isExpertBookmarkedList changes
                return SvgPicture.asset(
                  controller.isExpertBookmarkedListuser[position]
                      ? 'assets/images/tickbadge.svg'
                      : 'assets/images/tickbadgeblack.svg',
                  width: 14.63,
                  height: 18.69,
                );
              }),
            ),
            const SizedBox(width: 5),
            SvgPicture.asset(AppImages.redBadgeIcon)
          ],
        ),
        SizedBox(height: 22),
        Text(
          '\$ $priceperminute /min',
          style: GetAppFont.getInstance().addStyle(
              name: AppFont.Recoleta,
              height: 2,
              fs: 14,
              fontType: AppFont.SemiBold,
              color: Colors.black),
        ),
        SizedBox(height: 6),
        TabItem(
            addEdgeInsets: EdgeInsets.all(0),
            width: 77,
            height: 28,
            cornerRadius: 4,
            leftIcon: Icons.add,
            title: isDetailPage == true
                ? "Online"
                : type == 'chat'
                    ? 'Chat now'
                    : type == 'call'
                        ? 'Call now'
                        : 'Video call',
            fontType: AppFont.SemiBold,
            fontSize: 12,
            borderColor: AppColors.darkGreen,
            backgroundColor: bgColor ?? Colors.white,
            titleColor: AppColors.darkGreen,
            isIcon: false,
            image: '',
            iconColor: Colors.black,
            onTap: () {},
            showPrefixIcon: false,
            addStandardMargin: false)
      ],
    );
  }

  Widget userText(BuildContext context, String? name, String? yourOneLiner,
      String? languages, List<String>? mySubject,
      {bool isDetailPage = false, required int position}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name!,
          overflow: TextOverflow.ellipsis,
          style: GetAppFont.getInstance().addStyle(
              name: AppFont.Recoleta,
              fs: 18,
              height: 1,
              fontType: AppFont.SemiBold,
              color: Colors.black),
        ),
        SizedBox(height: 12),
        Text(
          yourOneLiner!,
          maxLines: 1,
          style: GetAppFont.getInstance().addStyle(
              name: AppFont.Avenir,
              height: 1.63,
              fs: 12,
              fontType: AppFont.Medium,
              color: Colors.black),
        ),
        Text(
          'Speaks $languages',
          overflow: TextOverflow.ellipsis,
          style: GetAppFont.getInstance().addStyle(
              name: AppFont.Avenir,
              height: 1.63,
              fs: 12,
              fontType: AppFont.Medium,
              color: Colors.black),
        ),
        SizedBox(height: 10),
        TabItem(
            addEdgeInsets: EdgeInsets.only(left: 8, right: 8),
            cornerRadius: 4,
            title: (mySubject != null && mySubject.isNotEmpty)
                ? (position % 2 == 0 ? mySubject.first : mySubject.first)
                : 'No Subject',
            height: 28,
            fontType: AppFont.SemiBold,
            fontSize: 12,
            borderColor: Colors.transparent,
            backgroundColor:
                isDetailPage != true ? Color(0xFFEAEAEA) : AppColors.btnBlack,
            titleColor: isDetailPage != true ? Colors.black : AppColors.white,
            isIcon: false,
            suffixImage: AppImages.forwardIcon,
            suffixIconHeight: 10,
            suffixIconWidth: 10,
            showSuffixIcon: false,
            image: '',
            iconColor: isDetailPage != true ? Colors.black : AppColors.white,
            onTap: () {},
            showPrefixIcon: false,
            addStandardMargin: false),
      ],
    );
  }

  Widget userImage(BuildContext context, String? image) {
    return Container(
      width: 78,
      child: Column(
        children: [
          CircleAvatar(
            radius: 39,
            backgroundColor: Colors.transparent,
            child: image != null && image.isNotEmpty
                ? ClipOval(
                    child: Image.network(
                      '${Url.imageUrl}$image',
                      fit: BoxFit.cover,
                      width: 78.0,
                      height: 78.0,
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black, // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 70.0,
                      color: Colors.black,
                    ),
                  ),
          ),
          const SizedBox(height: 6),
          const RatingStars(
            value: 5.0,
            starCount: 5,
            starSize: 14,
            valueLabelVisibility: false,
            starColor: AppColors.starColor,
          ),
          SizedBox(height: 2),
          Text(
            '847 Sessions',
            style: GetAppFont.getInstance().addStyle(
                name: AppFont.Avenir,
                fs: 10,
                fontType: AppFont.SemiBold,
                color: AppColors.btnBlack),
          ),
        ],
      ),
    );
  }
}

void _showBottomSheet() {
  showModalBottomSheet(
    context: Get.context!,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
    ),
    builder: (BuildContext context) => Container(
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(0, -4),
              color: Colors.black.withOpacity(0.25))
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Adjust height based on content
        children: [
          Container(
            height: 550, // Set the fixed height for the bottom sheet
            child: SingleChildScrollView(
              child: SortFilterWidgets(),
            ),
          ),
        ],
      ),
    ),
  );
}

void _showAddFilterSheet() {
  final double screenHeight = MediaQuery.of(Get.context!).size.height;
  showModalBottomSheet(
    context: Get.context!,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
    ),
    builder: (BuildContext context) => Container(
      decoration: BoxDecoration(
        color: Colors.white, // Set the background color
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(0, -4),
              color: Colors.black.withOpacity(0.25))
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Adjust height based on content
        children: [
          Container(
            height: screenHeight *
                0.78, // Set the fixed height for the bottom sheet
            child: SingleChildScrollView(
              child: AddFilterBottomSheet(),
            ),
          ),
        ],
      ),
    ),
  );
}
