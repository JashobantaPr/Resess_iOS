import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:recess/Auth/login_options_screen.dart';

import 'package:recess/Utility/item_tab.dart';
import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/controllers/book_session_controller.dart';
import 'package:recess/widgets/dotted_border.dart';

class ConfirmBookingScreen extends GetWidget<BookSessionController> {
  ConfirmBookingScreen({super.key});

  final BookSessionController controller = Get.put(BookSessionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appGray,
      appBar: AppBar(
        backgroundColor: AppColors.appGray,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                "assets/images/arrowback.png",
                width: 20,
                height: 20,
              ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Confirm booking",
                  style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Recoleta,
                    fs: 32,
                    fontType: AppFont.Bold,
                    color: Colors.black,
                  )),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 20,
              ),
              DottedBorderLines(
                borderType: BorderType.RRect,
                radius: Radius.circular(12),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    height: 175,
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 20, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              "${controller.homeController.bookingFlow.value?.preferredSessionType?.join(",")} With ${controller.homeController.selectedName}",
                              style: GetAppFont.getInstance().addStyle(
                                name: AppFont.Recoleta,
                                fs: 18,
                                fontType: AppFont.Bold,
                                color: Colors.black,
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "${controller.dateSummary.value}",
                            style: GetAppFont.getInstance().addStyle(
                              name: AppFont.Avenir,
                              fs: 14,
                              fontType: AppFont.Medium,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "${controller.selectedSlot.value?.timing ?? ""}",
                            style: GetAppFont.getInstance().addStyle(
                              name: AppFont.Avenir,
                              fs: 14,
                              fontType: AppFont.Medium,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "\$ ${controller.homeController.bookingFlow.value?.setYourFeeForPreBookedSession}",
                            style: GetAppFont.getInstance().addStyle(
                              name: AppFont.Recoleta,
                              fs: 16,
                              fontType: AppFont.Bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              _buildWalteDetails(),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 15,
              ),
              _buildNote(),
              SizedBox(
                height: 40,
              ),
              TabItem(
                  addEdgeInsets: EdgeInsets.all(0),
                  width: 160,
                  cornerRadius: 5,
                  title: "Confirm",
                  borderColor: Colors.black,
                  backgroundColor: Colors.black,
                  titleColor: Colors.white,
                  isIcon: false,
                  image: "",
                  iconColor: Colors.transparent,
                  onTap: () {
                    controller.userBookingSession();
                  },
                  showPrefixIcon: false,
                  addStandardMargin: false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWalteDetails() {
    return DottedBorderLines(
      borderType: BorderType.RRect,
      radius: Radius.circular(12),
      child: Container(
        height: 120,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                "assets/images/walet.png",
                width: 80,
                height: 80,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Available balance",
                    style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Avenir,
                      fs: 14,
                      fontType: AppFont.Medium,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "\$284.00",
                    style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Recoleta,
                      fs: 22,
                      fontType: AppFont.Bold,
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
  }

  Widget _buildNote() {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'Note:',
            style: GetAppFont.getInstance().addStyle(
              name: AppFont.Avenir,
              fs: 14,
              fontType: AppFont.Bold,
              color: Colors.black,
            ),
          ),
          // Second part: First two lines of text
          TextSpan(
            text:
                'The value of this session will be automatically deducted from your wallet.\n\n',
            style: GetAppFont.getInstance().addStyle(
              name: AppFont.Avenir,
              fs: 14,
              fontType: AppFont.Medium,
              color: Colors.black,
            ),
          ),

          TextSpan(
            text:
                'In the unlikely event that the session is cancelled by the Expert, the funds will be refunded to your wallet instantly.',
            style: GetAppFont.getInstance().addStyle(
              name: AppFont.Avenir,
              fs: 14,
              fontType: AppFont.Medium,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
