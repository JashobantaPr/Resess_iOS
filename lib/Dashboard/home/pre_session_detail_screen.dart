import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:recess/controllers/pre_session_detail_controller.dart';

import '../../Auth/login_options_screen.dart';
import '../../app_constants/app_colors.dart';

class PreSessionDetailScreen extends GetWidget<PreSessionDetailController> {
  PreSessionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: AppColors.appBg,
      ),
      body: SingleChildScrollView(
        child: Container(
            color: AppColors.appBg,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Obx(
              () => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 100,
                        child: MaterialButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.arrow_back_ios),
                              Text('Back')
                            ],
                          ),
                        )),
                    SizedBox(height: 20),
                    Container(
                      child: Text(
                        'Pre-Session Details',
                        style: GetAppFont.getInstance().addStyle(
                            name: AppFont.Recoleta,
                            fs: 26,
                            fontType: AppFont.Bold,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                        child: Text(
                      'Tell us more so your Expert can offer you the best support during the session.',
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Recoleta,
                          fs: 13,
                          fontType: AppFont.Medium,
                          color: Colors.black),
                    )),
                    SizedBox(height: 10),
                    Divider(height: 0.2),
                    SizedBox(height: 10),
                    Text(
                      'Pre-Session Details',
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Recoleta,
                          fs: 18,
                          fontType: AppFont.SemiBold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    _tabWidget(context),
                    SizedBox(height: 10),
                    Divider(height: 0.2),
                    SizedBox(height: 10),
                    Text(
                      'Level of subject knowledge',
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Recoleta,
                          fs: 14,
                          fontType: AppFont.SemiBold,
                          color: Colors.black),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: controller.expLevel[0].isSelected.value,
                          onChanged: (value) {
                            print(value);
                            controller.expLevel[0].isSelected.value = value!;
                            controller.expLevel[1].isSelected.value = false;
                            controller.expLevel[2].isSelected.value = false;
                          },
                        ),
                        Text(controller.expLevel[0].title!)
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: controller.expLevel[1].isSelected.value,
                          onChanged: (value) {
                            controller.expLevel[1].isSelected.value = value!;
                            controller.expLevel[0].isSelected.value = false;
                            controller.expLevel[2].isSelected.value = false;
                          },
                        ),
                        Text(controller.expLevel[1].title!)
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: controller.expLevel[2].isSelected.value,
                          onChanged: (value) {
                            controller.expLevel[2].isSelected.value = value!;
                            controller.expLevel[0].isSelected.value = false;
                            controller.expLevel[1].isSelected.value = false;
                          },
                        ),
                        Text(controller.expLevel[2].title!)
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Message',
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Recoleta,
                          fs: 14,
                          fontType: AppFont.SemiBold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.txtHintColor,
                              blurRadius: 2.0,
                              spreadRadius: 0.0,
                              offset: Offset(
                                  2.0, 2.0), // shadow direction: bottom right
                            )
                          ]),
                      child: TextField(
                        obscureText: false,
                        autofocus: false,
                        maxLines: 5,
                        style: GetAppFont.getInstance().addStyle(
                            name: AppFont.Recoleta,
                            fs: 13,
                            fontType: AppFont.Medium,
                            color: Colors.black),
                        decoration: const InputDecoration(
                            hintText:
                                'Add questions or information about what you’re looking to get out of this session...',
                            fillColor: AppColors.txtFillColor,
                            filled: true,
                            contentPadding: EdgeInsets.only(
                                top: 10, right: 10, left: 10, bottom: 13),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(height: 0.2),
                    Container(
                      width: 200,
                      margin: EdgeInsets.only(top: 20),
                      child: AppButton(
                          cornerRadius: 10,
                          leftIcon: Icons.add,
                          title: 'Submit',
                          borderColor: Colors.transparent,
                          backgroundColor: Colors.black,
                          titleColor: Colors.white,
                          isIcon: false,
                          image: '',
                          iconColor: Colors.transparent,
                          onTap: () {},
                          showPrefixIcon: false,
                          addStandardMargin: false),
                    )
                  ]),
            )),
      ),
    );
  }

  Widget _tabWidget(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppButton(
              cornerRadius: 5,
              leftIcon: Icons.chat,
              title: "Chat",
              borderColor: Colors.black,
              backgroundColor:
                  controller.currentTab == 0 ? Colors.black : AppColors.appBg,
              titleColor:
                  controller.currentTab == 0 ? Colors.white : Colors.black,
              isIcon: true,
              image: '',
              iconColor:
                  controller.currentTab == 0 ? Colors.white : Colors.black,
              onTap: () {
                controller.currentTab.value = 0;
                controller.goToTab(0);
              },
              showPrefixIcon: true,
              addStandardMargin: false),
          AppButton(
              cornerRadius: 5,
              leftIcon: Icons.chat,
              title: "Call",
              borderColor: Colors.black,
              backgroundColor:
                  controller.currentTab == 1 ? Colors.black : AppColors.appBg,
              titleColor:
                  controller.currentTab == 1 ? Colors.white : Colors.black,
              isIcon: true,
              image: '',
              iconColor:
                  controller.currentTab == 1 ? Colors.white : Colors.black,
              onTap: () {
                controller.currentTab.value = 1;
                controller.goToTab(1);
              },
              showPrefixIcon: true,
              addStandardMargin: false),
          AppButton(
              cornerRadius: 5,
              leftIcon: Icons.chat,
              title: "Video",
              borderColor: Colors.black,
              backgroundColor:
                  controller.currentTab == 2 ? Colors.black : AppColors.appBg,
              titleColor:
                  controller.currentTab == 2 ? Colors.white : Colors.black,
              isIcon: true,
              image: '',
              iconColor:
                  controller.currentTab == 2 ? Colors.white : Colors.black,
              onTap: () {
                controller.currentTab.value = 2;
                controller.goToTab(2);
              },
              showPrefixIcon: true,
              addStandardMargin: false),
        ],
      ),
    );
  }
}
