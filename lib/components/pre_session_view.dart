import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Utility/item_tab.dart';
import 'package:recess/widgets/check_box_widget.dart';

import '../Dashboard/home/confirm_booking_screen.dart';
import '../app_constants/app_colors.dart';
import '../controllers/book_session_controller.dart';

class PreSessionView extends StatelessWidget {
  PreSessionView({
    super.key,
  });

  BookSessionController controller = Get.put(BookSessionController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pre-session information",
              style: GetAppFont.getInstance().addStyle(
                name: AppFont.Recoleta,
                fs: 20,
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
                    offset: Offset(-3.0, 3.0), // shadow direction: bottom right
                  )
                ]),
            child: TextField(
              controller: controller.messageController,
              maxLines: 5, // Sets the maximum number of lines
              decoration: InputDecoration(
                border: InputBorder.none, // Removes the default border
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
          Text(
            "Booking summary",
            style: GetAppFont.getInstance().addStyle(
              name: AppFont.Recoleta,
              fs: 16,
              fontType: AppFont.Bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "${controller.homeController.bookingFlow.value?.preferredSessionType?.join(",")} with ${controller.homeController.selectedName}",
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
          Obx(() => (controller.dateSummary.value != null &&
                      controller.dateSummary.value!.isNotEmpty) &&
                  (controller.selectedSlot.value != null &&
                      controller.selectedSlot.value?.timing != null)
              ? Text(
                  "${controller.dateSummary.value}, ${controller.selectedSlot.value?.timing}",
                  style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Avenir,
                    fs: 12,
                    fontType: AppFont.SemiBold,
                    color: Colors.black,
                  ),
                )
              : Container()),
          SizedBox(
            height: 5,
          ),
          Text(
            "Session value \$ ${controller.homeController.bookingFlow.value?.setYourFeeForPreBookedSession ?? ""}",
            style: GetAppFont.getInstance().addStyle(
              name: AppFont.Avenir,
              fs: 12,
              fontType: AppFont.SemiBold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: 20,
          ),
          TabItem(
              addEdgeInsets: EdgeInsets.all(0),
              width: 80,
              cornerRadius: 5,
              title: "Book now",
              borderColor: Colors.black,
              backgroundColor: Colors.black,
              titleColor: Colors.white,
              isIcon: false,
              image: "",
              iconColor: Colors.transparent,
              onTap: () {
                Get.to(
                  ConfirmBookingScreen(),
                );
              },
              showPrefixIcon: false,
              addStandardMargin: false),
          SizedBox(
            height: 20,
          ),
        ],
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
                  value: controller.isOptionSelected(option),
                  onChanged: (bool? isSelected) {
                    if (isSelected != null && isSelected) {
                      controller.selectOption(option);
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
}
