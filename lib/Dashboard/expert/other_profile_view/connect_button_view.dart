import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:recess/Utility/AppImages.dart';
import 'package:recess/Utility/item_tab.dart';
import 'package:recess/app_constants/app_pm_standards.dart';

import 'package:recess/widgets/check_box_widget.dart';

import '../../../Auth/login_options_screen.dart';
import '../../../app_constants/app_colors.dart';
import '../../../controllers/book_session_controller.dart';

class ConnectButtonView extends StatelessWidget {
  ConnectButtonView({super.key});

  final BookSessionController controller = Get.put(BookSessionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.profileBorder,
        surfaceTintColor: AppColors.white,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pre-session information",
                style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Recoleta,
                  fs: 28,
                  fontType: AppFont.SemiBold,
                  color: Colors.black,
                )),
            SizedBox(
              height: 20,
            ),
            Text(
              "Tell us more so your Expert can offer you the best support during the session.",
              style: GetAppFont.getInstance().addStyle(
                name: AppFont.Avenir,
                fs: 14,
                fontType: AppFont.Avenir,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Type of Session",
              style: GetAppFont.getInstance().addStyle(
                name: AppFont.Recoleta,
                fs: 20,
                fontType: AppFont.SemiBold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _tabWidget(),
            SizedBox(
              height: 20,
            ),
            Text(
              "Level of subject knowledge",
              style: GetAppFont.getInstance().addStyle(
                name: AppFont.Avenir,
                fs: 14,
                fontType: AppFont.SemiBold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            _buildCheckBox(),
            SizedBox(
              height: 10,
            ),
            Text(
              "Message",
              style: GetAppFont.getInstance().addStyle(
                name: AppFont.Avenir,
                fs: 16,
                fontType: AppFont.Bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: AppColors.appGray, // Background color of the container
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.btnBlack.withOpacity(0.25),
                      blurRadius: 1.0,
                      spreadRadius: 0.0,
                      offset:
                          Offset(-3.0, 3.0), // shadow direction: bottom right
                    )
                  ]),
              child: TextField(
                controller: controller.preSessionmessageController,
                maxLines: 5,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your text here',
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 10,
            ),
            TabItem(
                addEdgeInsets: EdgeInsets.all(0),
                width: 150,
                cornerRadius: 5,
                title: "Submit",
                borderColor: Colors.black,
                backgroundColor: Colors.black,
                titleColor: Colors.white,
                isIcon: false,
                image: "",
                iconColor: Colors.transparent,
                onTap: () {
                  controller.preSessionSubmit();
                },
                showPrefixIcon: false,
                addStandardMargin: false),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckBox() {
    return Obx(
      () => Column(
        children: controller.options.map((option) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                CustomCheckbox(
                  value: controller.isPreSessionOptionSelected(option),
                  onChanged: (bool? isSelected) {
                    if (isSelected != null && isSelected) {
                      controller.preSelectOption(option);
                    }
                  },
                  fillColor: AppColors
                      .appGray, // Fill color for both checked and unchecked
                  checkColor: Colors.black, // Color of the checkmark
                  borderColor:
                      AppColors.appGray, // Border color of the checkbox
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(option),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _tabWidget() {
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
          if (controller.currentConnectNowTab.value == "Chat")
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
              iconColor: controller.currentConnectNowTab.value == "Chat"
                  ? Colors.white
                  : Colors.black,
              onTap: () {
                controller.goToTabDuration("Chat");
              },
              showPrefixIcon: true,
              addStandardMargin: false,
            ),
          SizedBox(width: 16),
          if (controller.currentConnectNowTab.value == "Call")
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
              iconColor: controller.currentConnectNowTab.value == "Call"
                  ? Colors.white
                  : Colors.black,
              onTap: () {
                controller.goToTabDuration("Call");
              },
              showPrefixIcon: true,
              addStandardMargin: false,
            ),
          SizedBox(width: 16),
          if (controller.currentConnectNowTab.value == "Video")
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
              iconColor: controller.currentConnectNowTab.value == "Video"
                  ? Colors.white
                  : Colors.black,
              onTap: () {
                controller.goToconnectNow("Video" as List<String>);
              },
              showPrefixIcon: true,
              addStandardMargin: false,
            ),
          Spacer(),
        ],
      ),
    );
  }
}
