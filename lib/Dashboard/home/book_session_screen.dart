import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/Utility/item_tab.dart';
import 'package:recess/app_constants/app_pm_standards.dart';
import 'package:recess/controllers/book_session_controller.dart';

import '../../Auth/login_options_screen.dart';

import '../../app_constants/app_colors.dart';
import '../../components/app_calendar.dart';
import '../../components/pre_session_view.dart';
import '../../models/home_screen_model/booking_session.dart';

class BookSessionScreen extends StatelessWidget {
  BookSessionScreen({super.key});

  final BookSessionController controller = Get.put(BookSessionController());

  final Rx<DateTime> _selectedDay = DateTime.now().obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBg,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.appBg,
        surfaceTintColor: AppColors.appBg,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Row(
            children: [
              Image.asset(
                "assets/images/arrowback.png",
                width: 20,
                height: 20,
              ),
              Text(
                "Back",
                textAlign: TextAlign.start,
                style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Avenir,
                    fs: 14,
                    fontType: AppFont.Bold,
                    color: Colors.black),
              ),
            ],
          ),
        ),
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
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: AppColors.appBg,
              padding: EdgeInsets.only(
                top: 28,
                left: AppPMStandards.shared.leftPadding,
                right: AppPMStandards.shared.leftPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Book a session',
                    style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Recoleta,
                      fs: 26,
                      fontType: AppFont.Bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${controller.homeController.bookingFlow.value?.preferredSessionType?.join(",")} With ${controller.homeController.selectedName}",
                    style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Avenir,
                      fs: 14,
                      fontType: AppFont.SemiBold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 15),
                  _buildSessionCostContainer(),
                  SizedBox(height: 15),
                  Divider(height: 1),
                  SizedBox(height: 16),
                  Text(
                    'Type of session',
                    style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Recoleta,
                      fs: 18,
                      fontType: AppFont.SemiBold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildTypeofSession(),
                  // _tabWidget(context),
                  SizedBox(height: 10),
                  Divider(height: 1),
                  SizedBox(height: 16),
                  Text(
                    'Choose a date',
                    style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Recoleta,
                      fs: 18,
                      fontType: AppFont.SemiBold,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          color: AppColors.btnBlack.withOpacity(0.25),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: AppCalendar(),
                  ),
                  SizedBox(height: 20),
                  Divider(height: 1),
                  SizedBox(height: 20),
                  Text(
                    'Choose the session duration',
                    style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Recoleta,
                      fs: 18,
                      fontType: AppFont.SemiBold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  _tabWidgetDuration(context),
                  SizedBox(height: 10),
                  Divider(height: 1),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Choose a time',
                          style: GetAppFont.getInstance().addStyle(
                            name: AppFont.Recoleta,
                            fs: 18,
                            fontType: AppFont.SemiBold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              RotatedBox(
                                quarterTurns: 2,
                                child: SvgPicture.asset(
                                  AppImages.forwardIcon,
                                  width: 10,
                                ),
                              ),
                              Text(
                                'Prev',
                                style: GetAppFont.getInstance().addStyle(
                                  name: AppFont.Avenir,
                                  fs: 12,
                                  fontType: AppFont.SemiBold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Row(
                            children: [
                              Text(
                                'Next',
                                style: GetAppFont.getInstance().addStyle(
                                  name: AppFont.Avenir,
                                  fs: 12,
                                  fontType: AppFont.SemiBold,
                                  color: Colors.black,
                                ),
                              ),
                              SvgPicture.asset(
                                AppImages.forwardIcon,
                                width: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Obx(() => SliverPadding(
                padding: EdgeInsets.only(
                    left: 20.0, right: 8), // Adjust the left padding as needed
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                    childAspectRatio: 1.8,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, position) {
                      // Access the specific item based on index
                      Slots? slot = controller.slotList[position];
                      return Obx(() => TabItem(
                            cornerRadius: 4,
                            title: slot.timing ?? "",
                            borderColor: AppColors.btnBlack,
                            backgroundColor: controller.getStatusColor(slot),
                            titleColor: controller.getTextColor(slot),
                            isIcon: false,
                            image: "",
                            iconColor: AppColors.btnBlack,
                            onTap: () {
                              controller.selectSlot(slot);
                              //  .selectedTimeSlotIndex.value = position;
                            },
                            showPrefixIcon: false,
                            addStandardMargin: false,
                          ));
                    },
                    childCount: controller.slotList.length,
                  ),
                ),
              )),
          SliverPadding(padding: EdgeInsets.symmetric(vertical: 10)),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Divider(height: 1),
              ),
              SizedBox(
                height: 20,
              )
            ]),
          ),
          SliverToBoxAdapter(child: PreSessionView()),
        ],
      ),
    );
  }

  //sessions

  Widget _buildTypeofSession() {
    return Obx(() => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            spacing: 10.0, // Space between items
            runSpacing: 10.0, // Space between rows
            children: List.generate(
              controller.currentTab.length,
              (index) {
                String option = controller.currentTab[index];
                bool isSelected = controller.selectedTabs == option;

                return SizedBox(
                  width: 120, // Set a fixed width for the TabItem
                  child: TabItem(
                    addEdgeInsets: EdgeInsets.all(0),
                    cornerRadius: 5,
                    leftIcon: Icons.chat,
                    title: option,
                    fontSize: 14,
                    fontType: AppFont.SemiBold,
                    borderColor: isSelected ? Colors.black : Colors.white,
                    backgroundColor: isSelected ? Colors.black : Colors.white,
                    titleColor: isSelected ? Colors.white : Colors.black,
                    isIcon: false,
                    image: option == "Chat"
                        ? AppImages.chatIcon1
                        : option == "Call"
                            ? AppImages.callIcon
                            : option == "Video"
                                ? AppImages.videoIcon
                                : AppImages.videoIcon,
                    iconColor: isSelected ? Colors.white : Colors.black,
                    onTap: () {
                      controller.onOptionSelected(option);
                    },
                    showPrefixIcon: true,
                    addStandardMargin: false,
                  ),
                );
              },
            ),
          ),
        ));
  }

  // Tab Widgets
  Widget _tabWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 12,
        bottom: 32,
        right: AppPMStandards.shared.homeRightPadding - 7,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Chat Tab
          if (controller.currentTab.contains("Chat"))
            TabItem(
              addEdgeInsets: EdgeInsets.all(0),
              width: 80,
              cornerRadius: 5,
              leftIcon: Icons.chat,
              title: "Chat",
              fontSize: 14,
              fontType: AppFont.SemiBold,
              borderColor: Colors.black,
              backgroundColor: Colors.black,
              titleColor: Colors.white,
              isIcon: false,
              image: AppImages.chatIcon1,
              iconColor: Colors.white,
              onTap: () {
                controller.goToTab("Chat");
              },
              showPrefixIcon: true,
              addStandardMargin: false,
            ),
          SizedBox(width: 16),
          // Call Tab
          if (controller.currentTab.contains("Call"))
            TabItem(
              addEdgeInsets: EdgeInsets.all(0),
              width: 80,
              fontSize: 14,
              fontType: AppFont.SemiBold,
              cornerRadius: 5,
              leftIcon: Icons.chat,
              title: "Call",
              borderColor: Colors.black,
              backgroundColor: Colors.black,
              titleColor: Colors.white,
              isIcon: false,
              image: AppImages.callIcon,
              iconColor: Colors.white,
              onTap: () {
                controller.goToTab("Call");
              },
              showPrefixIcon: true,
              addStandardMargin: false,
            ),
          SizedBox(width: 16),
          // Video Tab
          if (controller.currentTab.contains("Video"))
            TabItem(
              addEdgeInsets: EdgeInsets.all(0),
              width: 80,
              fontSize: 14,
              fontType: AppFont.SemiBold,
              cornerRadius: 5,
              leftIcon: Icons.chat,
              title: "Video",
              borderColor: Colors.black,
              backgroundColor: Colors.black,
              titleColor: Colors.white,
              isIcon: false,
              image: AppImages.videoIcon,
              iconColor: Colors.white,
              onTap: () {
                controller.goToTab("Video");
              },
              showPrefixIcon: true,
              addStandardMargin: false,
            ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _tabWidgetDuration(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 12,
        bottom: 32,
        right: AppPMStandards.shared.homeRightPadding - 7,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 15min Tab
          if (controller.currentTabDuration == "15min")
            TabItem(
              addEdgeInsets: EdgeInsets.all(0),
              width: 68,
              cornerRadius: 5,
              leftIcon: Icons.chat,
              title: "15min",
              borderColor: Colors.black,
              backgroundColor: Colors.black,
              titleColor: Colors.white,
              isIcon: false,
              image: '',
              iconColor: Colors.white,
              onTap: () {
                controller.goToTabDuration("15min");
              },
              showPrefixIcon: false,
              addStandardMargin: false,
            ),
          SizedBox(width: 16),
          // 30min Tab
          if (controller.currentTabDuration == "30min")
            TabItem(
              addEdgeInsets: EdgeInsets.all(0),
              width: 68,
              cornerRadius: 5,
              leftIcon: Icons.chat,
              title: "30 min",
              borderColor: Colors.black,
              backgroundColor: Colors.black,
              titleColor: Colors.white,
              isIcon: false,
              image: '',
              iconColor: Colors.white,
              onTap: () {
                controller.goToTabDuration("30min");
              },
              showPrefixIcon: false,
              addStandardMargin: false,
            ),
          SizedBox(width: 16),
          // 60min Tab
          if (controller.currentTabDuration == "60min")
            TabItem(
              addEdgeInsets: EdgeInsets.all(0),
              width: 68,
              cornerRadius: 5,
              leftIcon: Icons.chat,
              title: "60min",
              borderColor: Colors.black,
              backgroundColor: Colors.black,
              titleColor: Colors.white,
              isIcon: false,
              image: '',
              iconColor: Colors.white,
              onTap: () {
                if (controller.currentTabDuration != "60min") {
                  controller.showTimeDialog();
                }
                controller.goToTabDuration("60min");
              },
              showPrefixIcon: false,
              addStandardMargin: false,
            ),
        ],
      ),
    );
  }

  // Session Cost Container

  Widget _buildSessionCostContainer() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.grey),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Session Cost",
                style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Avenir,
                  fs: 14,
                  fontType: AppFont.SemiBold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              "\$ ${controller.homeController.bookingFlow.value?.setYourFeeForPreBookedSession ?? ""}",
              style: GetAppFont.getInstance().addStyle(
                name: AppFont.Recoleta,
                fs: 18,
                fontType: AppFont.SemiBold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
