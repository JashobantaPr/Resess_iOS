import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Dashboard/Home/search_screen.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/app_constants/app_pm_standards.dart';
import 'package:recess/controllers/home_controller.dart';

import '../../Utility/item_tab.dart';
import '../../Utility/responsive.dart';
import '../../models/home_screen_model/category_model.dart';

import 'chat_list_screen.dart';

import 'profiles_view_types/call_profiles_screen.dart';
import 'profiles_view_types/chat_profiles_screen.dart';
import 'profiles_view_types/video_profiles_screen.dart';
import 'widgets/add_filter_bottomsheet.widget.dart';
import 'widgets/category_list.widget.dart';
import 'widgets/sort_filter_bottomsheet.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Responsive.getSize(context) == ScreenSize.mobile ||
                Responsive.getSize(context) == ScreenSize.kMobile
            ? MobileHomeScreen()
            : Responsive.getSize(context) == ScreenSize.tab
                ? WebHomeScreen(isTablet: true)
                : WebHomeScreen());
  }

  //FIGMA
  Widget _tabWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: 17,
          left: AppPMStandards.shared.leftPadding,
          right: AppPMStandards.shared.homeRightPadding - 7),
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
}

class MobileHomeScreen extends StatelessWidget {
  MobileHomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    controller.getProfiles();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: AppPMStandards.shared.leftPadding,
        backgroundColor: AppColors.appBg,
        title: Row(
          children: [
            Text(
              "recess.",
              textAlign: TextAlign.start,
              style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Recoleta,
                  fs: 32,
                  fontType: AppFont.Bold,
                  color: Colors.black),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          Container(
            height: 30,
            padding:
                EdgeInsets.only(right: AppPMStandards.shared.homeRightPadding),
            // color: Colors.brown,
            // height: 60,
            child: InkWell(
              onTap: () {
                // Get.to(BalanceTopUpScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.only(right: 4),
                      child: SvgPicture.asset(AppImages.walletIcon, width: 30)),
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
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: SvgPicture.asset(AppImages.forwardIcon, width: 14))
                ],
              ),
            ),
          ),
          Responsive.getSize(context) == ScreenSize.kMobile
              ? Padding(
                  padding: EdgeInsets.only(
                      right: AppPMStandards.shared.homeRightPadding - 5),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppImages.hamburgerIcon),
                  ))
              : Container(width: 0, height: 0)
        ],
      ),
      body: Container(
        color: AppColors.appBg,
        height: MediaQuery.of(context).size.height,
        child: Obx(
          () => Column(
            children: [
              Obx(() => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Row(
                      children: [
                        _buildChat(
                            isActive: controller.typeView.value ==
                                typeViewSession.Chat),
                        SizedBox(
                          width: 10,
                        ),
                        _buildCall(
                            isActive: controller.typeView.value ==
                                typeViewSession.Call),
                        SizedBox(
                          width: 10,
                        ),
                        _buildVideo(
                            isActive: controller.typeView.value ==
                                typeViewSession.Video),
                      ],
                    ),
                  )),
              // _tabWidget(context),
              _buildDivider(),
              _buildFilterOptions(),
              SizedBox(
                height: 10,
              ),
              _buildCategoryList(),
              _buildDivider(),
              // Row(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: ElevatedButton(
              //           onPressed: () {
              //             // onJoin();
              //           },
              //           child: Text("VideoCall")),
              //     ),
              //     SizedBox(
              //       width: 10,
              //     ),
              //     ElevatedButton(
              //         onPressed: () {
              //           // onJoinAudioCall();
              //         },
              //         child: Text("Voice Call"))
              //   ],
              // ),
              // Expanded(
              //   child: Container(
              //     width: MediaQuery.of(context).size.width,
              //     child: PageView(
              //       onPageChanged: (index) {
              //         controller.goToTab(index);

              //         // Show bottom sheet based on the page index
              //         if (index == 0) {
              //         } else if (index == 1) {
              //           // _showBottomSheet(context, 'video');
              //         } else if (index == 2) {
              //           // _showBottomSheet(context, 'search');
              //         }
              //       },
              //       controller: controller.pageController,
              //       physics: NeverScrollableScrollPhysics(),
              //       children: [
              //         ChatListScreen(type: 'chat'),
              //         ChatListScreen(type: 'call'),
              //         ChatListScreen(type: 'video'),
              //         SearchScreen(),
              //       ],
              //     ),
              //   ),
              // ),
              if (controller.typeView.value == typeViewSession.Chat)
                Expanded(child: ChatProfilesScreen()),
              if (controller.typeView.value == typeViewSession.Call)
                Expanded(
                  child: CallProfilesScreen(),
                ),
              if (controller.typeView.value == typeViewSession.Video)
                Expanded(child: VideoProfilesScreen()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChat({bool isActive = false}) {
    return TabItem(
        addEdgeInsets: EdgeInsets.all(0),
        width: 80,
        fontSize: 14,
        fontType: AppFont.SemiBold,
        cornerRadius: 5,
        leftIcon: Icons.chat,
        title: "Chat",
        borderColor: Colors.black,
        backgroundColor: isActive ? AppColors.btnBlack : AppColors.white,
        titleColor:
            isActive ? AppColors.white : const Color.fromRGBO(0, 0, 0, 1),
        isIcon: false,
        image: AppImages.chatIcon,
        iconColor: isActive ? AppColors.white : AppColors.btnBlack,
        onTap: () {
          controller.changeTypeViewSession(typeViewSession.Chat);
        },
        showPrefixIcon: true,
        addStandardMargin: false);
  }

  Widget _buildCall({bool isActive = false}) {
    return TabItem(
        addEdgeInsets: EdgeInsets.all(0),
        width: 80,
        fontSize: 14,
        fontType: AppFont.SemiBold,
        cornerRadius: 5,
        leftIcon: Icons.chat,
        title: "Call",
        borderColor: Colors.black,
        backgroundColor: isActive ? AppColors.btnBlack : AppColors.white,
        titleColor: isActive ? AppColors.white : AppColors.btnBlack,
        isIcon: false,
        image: AppImages.callIcon,
        iconColor: isActive ? AppColors.white : AppColors.btnBlack,
        onTap: () {
          controller.changeTypeViewSession(typeViewSession.Call);
        },
        showPrefixIcon: true,
        addStandardMargin: false);
  }

  Widget _buildVideo({bool isActive = false}) {
    return TabItem(
        addEdgeInsets: EdgeInsets.all(0),
        width: 80,
        fontSize: 14,
        fontType: AppFont.SemiBold,
        cornerRadius: 5,
        leftIcon: Icons.chat,
        title: "Video",
        borderColor: Colors.black,
        backgroundColor: isActive ? AppColors.btnBlack : AppColors.white,
        titleColor: isActive ? AppColors.white : AppColors.btnBlack,
        isIcon: false,
        image: AppImages.videoIcon,
        iconColor: isActive ? AppColors.white : AppColors.btnBlack,
        onTap: () {
          controller.changeTypeViewSession(typeViewSession.Video);
        },
        showPrefixIcon: true,
        addStandardMargin: false);
  }

  Widget _tabWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: 17,
          left: AppPMStandards.shared.leftPadding,
          right: AppPMStandards.shared.homeRightPadding - 7),
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

  //Divider

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Divider(
        thickness: 1,
        color: AppColors.grey,
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
            height: MediaQuery.of(context).size.height *
                0.5, // Set the fixed height for the bottom sheet
            child: SortFilterWidgets(),
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
                0.90, // Set the fixed height for the bottom sheet
            child: SingleChildScrollView(
              child: AddFilterBottomSheet(),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildCategoryList() {
  final controller = Get.find<HomeController>();
  return Container(
      height: 60,
      child: Obx(
        () => ListView.builder(
            scrollDirection: Axis.horizontal,
            primary: false,
            shrinkWrap: true,
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              CategoryModel item = controller.categories[index];
              return CategoryListWidget(
                category: item,
                index: index,
                onTap: (index) {
                  controller.toggleCategorySelection(index);
                },
              );
            }),
      ));
}

class WebHomeScreen extends StatelessWidget {
  bool? isTablet;

  WebHomeScreen({super.key, isTablet = false});

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.init();
        },
        child: Column(
          children: [
            Container(
              color: AppColors.appBg,
              height: MediaQuery.of(context).size.height,
              child: Obx(
                () => Column(
                  children: [
                    Row(children: [
                      Expanded(child: _tabWidget(context)),
                      Container(
                        height: 30,
                        padding: EdgeInsets.only(
                            right: AppPMStandards.shared.homeRightPadding),
                        // color: Colors.brown,
                        // height: 60,
                        child: InkWell(
                          onTap: () {
                            // Get.to(BalanceTopUpScreen());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  padding: EdgeInsets.only(right: 4),
                                  child: SvgPicture.asset(AppImages.walletIcon,
                                      width: 30)),
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
                                      color: Colors.black),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: SvgPicture.asset(AppImages.forwardIcon,
                                      width: 14))
                            ],
                          ),
                        ),
                      )
                    ]),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height  - 220,
                        child: PageView(
                            onPageChanged: controller.goToTab,
                            controller: controller.pageController,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              ChatListScreen(type: 'chat'),
                              ChatListScreen(type: 'call'),
                              //CallListScreen(),
                              ChatListScreen(type: 'video'),
                              //VideoListScreen(),
                              SearchScreen(),
                            ]),
                      ),
                    ),
                    _buildDivider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      thickness: 1,
      color: Colors.black,
    );
  }

  Widget _tabWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
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
            titleColor:
                controller.currentTab.value == 0 ? Colors.white : Colors.black,
            isIcon: false,
            image: AppImages.chatIcon1,
            iconColor:
                controller.currentTab.value == 0 ? Colors.white : Colors.black,
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
            titleColor:
                controller.currentTab.value == 1 ? Colors.white : Colors.black,
            isIcon: false,
            image: AppImages.callIcon,
            iconColor:
                controller.currentTab.value == 1 ? Colors.white : Colors.black,
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
            titleColor:
                controller.currentTab.value == 2 ? Colors.white : Colors.black,
            isIcon: false,
            image: AppImages.videoIcon,
            iconColor:
                controller.currentTab.value == 2 ? Colors.white : Colors.black,
            onTap: () {
              controller.goToTab(2);
            },
            showPrefixIcon: true,
            addStandardMargin: false),
        SizedBox(width: 16),
        Expanded(
          child: Container(
              margin: EdgeInsets.all(10),
              width: 436,
              height: 40,
              decoration: BoxDecoration(
                  color: AppColors.txtFillColor,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.btnBlack.withOpacity(0.25),
                      blurRadius: 1.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(-3.0, 3.0), // shadow direction: bottom right
                    )
                  ]),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 18,
                        fontType: AppFont.Medium,
                        color: AppColors.txtHintColor),
                    labelStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "avenir"),
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              )),
        ),
      ],
    );
  }
}
