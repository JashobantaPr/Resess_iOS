import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:recess/controllers/settings/my_privacy_controller.dart';

import '../../Auth/login_options_screen.dart';
import '../../Utility/app_back_btn.dart';
import '../../app_constants/app_colors.dart';

class MyPrivacyScreen extends StatelessWidget {
  MyPrivacyScreen({super.key});

  MyPrivacyController controller = Get.put(MyPrivacyController());

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
              'My privacy',
              style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Recoleta,
                  fs: 26,
                  fontType: AppFont.Bold,
                  color: Colors.black),
            ),
            SizedBox(height: 20),
            Divider(height: 1),
            SizedBox(height: 10),
            Expanded(
                child: Column(
              children: [
                Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Chat history',
                            style: GetAppFont.getInstance().addStyle(
                                name: AppFont.Avenir,
                                fs: 16,
                                fontType: AppFont.Medium,
                                color: Colors.black)),
                        Container(
                            width: 100,
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Obx(
                                  () => Switch(
                                    thumbColor:
                                        MaterialStateProperty.all<Color>(
                                            AppColors.white),
                                    activeTrackColor: AppColors.darkGreen,
                                    inactiveTrackColor: AppColors.txtHintColor,
                                    value: controller.isSwitched.value,
                                    onChanged: (bool value) {
                                      controller.isSwitched.value = value;
                                      controller.setPrivacy();
                                    },
                                  ),
                                ))),
                      ]),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                        'If enabled by both you and the Expert, you can both review past chat session transcripts.',
                        style: GetAppFont.getInstance().addStyle(
                            name: AppFont.Avenir,
                            fs: 12,
                            fontType: AppFont.Medium,
                            color: Colors.black)),
                  ),
                  SizedBox(height: 20)
                ]),
                SizedBox(height: 5),
                Divider(height: 1),
                SizedBox(height: 5),
                Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Voice call recording',
                            style: GetAppFont.getInstance().addStyle(
                                name: AppFont.Avenir,
                                fs: 16,
                                fontType: AppFont.Medium,
                                color: Colors.black)),
                        Container(
                            width: 100,
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Obx(
                                  () => Switch(
                                    thumbColor:
                                        MaterialStateProperty.all<Color>(
                                            AppColors.white),
                                    activeTrackColor: AppColors.darkGreen,
                                    inactiveTrackColor: AppColors.txtHintColor,
                                    value: controller.isSwitched1.value,
                                    onChanged: (bool value) {
                                      controller.isSwitched1.value = value;
                                      controller.setPrivacy();
                                    },
                                  ),
                                ))),
                      ]),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                        'If enabled by both you and the Expert, you can both listen to past voice call sessions.',
                        style: GetAppFont.getInstance().addStyle(
                            name: AppFont.Avenir,
                            fs: 12,
                            fontType: AppFont.Medium,
                            color: Colors.black)),
                  ),
                  SizedBox(height: 20)
                ]),
                SizedBox(height: 5),
                Divider(height: 1),
                SizedBox(height: 5),
                Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Video call recording',
                            style: GetAppFont.getInstance().addStyle(
                                name: AppFont.Avenir,
                                fs: 16,
                                fontType: AppFont.Medium,
                                color: Colors.black)),
                        Container(
                            width: 100,
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Obx(
                                  () => Switch(
                                    thumbColor:
                                        MaterialStateProperty.all<Color>(
                                            AppColors.white),
                                    activeTrackColor: AppColors.darkGreen,
                                    inactiveTrackColor: AppColors.txtHintColor,
                                    value: controller.isSwitched2.value,
                                    onChanged: (bool value) {
                                      controller.isSwitched2.value = value;
                                      controller.setPrivacy();
                                    },
                                  ),
                                ))),
                      ]),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                        'If enabled by both you and the Expert, you can both review past video call sessions.',
                        style: GetAppFont.getInstance().addStyle(
                            name: AppFont.Avenir,
                            fs: 12,
                            fontType: AppFont.Medium,
                            color: Colors.black)),
                  ),
                  SizedBox(height: 20)
                ]),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
