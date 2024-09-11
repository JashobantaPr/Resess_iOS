import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/controllers/settings/learning_session_controller.dart';

class CancelBookingPopUp extends StatelessWidget {
  CancelBookingPopUp({super.key});

  final LearningSessionController controller =
      Get.put(LearningSessionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBg,
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.black,
                toolbarHeight: 50,
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'LogOut',
                      style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Recoleta,
                        fs: 18,
                        fontType: AppFont.Bold,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 15.5,
                        bottom: 10,
                      ),
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 70,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Are you sure you want to cancle It?',
                    style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Avenir,
                      fs: 16,
                      fontType: AppFont.SemiBold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(height: 1),
                  const SizedBox(height: 20),
                  _buildButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            controller.bookingCancel();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0),
                side: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          child: Text(
            'Yes',
            style: GetAppFont.getInstance().addStyle(
              name: AppFont.Avenir,
              fs: 16,
              fontType: AppFont.Recoleta,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 20),
        TextButton(
          onPressed: () {
            Get.back();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
          ),
          child: Text(
            'No',
            style: GetAppFont.getInstance().addStyle(
              name: AppFont.Recoleta,
              fs: 16,
              fontType: AppFont.SemiBold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
