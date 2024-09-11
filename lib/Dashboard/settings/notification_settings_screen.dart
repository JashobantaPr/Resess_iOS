import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Utility/app_back_btn.dart';
import 'package:recess/app_constants/app_colors.dart';

import '../../controllers/settings/notification_setting_controller.dart';

class NotificationSettingsScreen extends StatelessWidget {
  NotificationSettingsScreen({super.key});

  final NotificationSettingsController controller =
      Get.put(NotificationSettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBg,
        leadingWidth: 100,
        leading: AppBackBtn(),
      ),
      body: Container(
        color: AppColors.appBg,
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notifications',
              style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Recoleta,
                  fs: 26,
                  fontType: AppFont.Bold,
                  color: Colors.black),
            ),
            SizedBox(height: 5),
            Divider(height: 1),
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, position) {
                    return Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('New session alerts',
                                style: GetAppFont.getInstance().addStyle(
                                    name: AppFont.Avenir,
                                    fs: 16,
                                    fontType: AppFont.Medium,
                                    color: Colors.black)),
                            Container(
                                width: 100,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Switch(
                                    thumbColor:
                                        MaterialStateProperty.all<Color>(
                                            AppColors.white),
                                    activeTrackColor: AppColors.darkGreen,
                                    inactiveTrackColor: AppColors.txtHintColor,
                                    value: controller.isSwitched.value,
                                    onChanged: (bool value) {
                                      controller.isSwitched.value = value;
                                    },
                                  ),
                                )),
                          ]),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                            'Make sure this is enabled to ensure you are reminded of a new session starting.',
                            style: GetAppFont.getInstance().addStyle(
                                name: AppFont.Avenir,
                                fs: 12,
                                fontType: AppFont.Medium,
                                color: Colors.black)),
                      ),
                      SizedBox(height: 20)
                    ]);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(height: 1),
                  itemCount: 10),
            )
          ],
        ),
      ),
    );
  }
}
