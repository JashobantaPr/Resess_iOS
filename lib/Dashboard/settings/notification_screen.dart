import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:recess/Utility/app_back_btn.dart';
import 'package:recess/app_constants/app_colors.dart';

import '../../components/notification/get_notification_view.dart';
import '../../controllers/settings/notification_setting_controller.dart';
import '../../models/notification/get_notification_model.dart';
import 'notification_settings_screen.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);

  final NotificationSettingsController controller =
      Get.put(NotificationSettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBg,
          leadingWidth: 100,
          leading: AppBackBtn(),
          actions: [
            IconButton(
              icon: Icon(
                Icons.more_vert,
              ),
              onPressed: () {
                _showSettingDialog();
              },
            )
          ],
        ),
        body: Container(
          child: Obx(() => ListView.builder(
              itemCount: controller.getNotifications.length,
              itemBuilder: (context, index) {
                GetNotificationModel item = controller.getNotifications[index];
                return GetNotificationsWidget(item: item);
              })),
        ));
  }

  void _showSettingDialog() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return Align(
          alignment:
              Alignment.topRight, // Align to the bottom right of the screen
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              margin: EdgeInsets.only(
                  right: 16.0, bottom: 16.0), // Add some margin for spacing
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                  ),
                ],
              ),
              width: 220, // Adjust width as needed
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(Icons.settings_applications_rounded),
                    title: Text('Settings'),
                    onTap: () {
                      Get.back();
                      Get.to(NotificationSettingsScreen());
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
