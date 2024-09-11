import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recess/app_constants/app_pm_standards.dart';

import '../../../Auth/login_options_screen.dart';
import '../../../Utility/AppImages.dart';
import '../../../Utility/app_back_btn.dart';
import '../../../Utility/item_tab.dart';
import '../../../Utility/text_field_with_header.dart';
import '../../../app_constants/app_colors.dart';
import '../../../controllers/expert/expert_setting_controller.dart';

class ExpertSettingScreen extends StatelessWidget {
  ExpertSettingScreen({super.key});

  final ExpertSettingController controller = Get.put(ExpertSettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBg,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.appBg,
        leadingWidth: 126,
        leading: AppBackBtn(),
        actions: [
          Container(
            padding: EdgeInsets.only(right: AppPMStandards.shared.leftPadding),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.appBg,
          padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: AppPMStandards.shared.leftPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Expert Settings",
                style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Recoleta,
                  fs: 26,
                  fontType: AppFont.Bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Divider(height: 1),
              SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hide expert profile',
                        style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Avenir,
                          fs: 16,
                          fontType: AppFont.Medium,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        width: 100,
                        alignment: Alignment.topRight,
                        child: Obx(
                          () => Switch(
                            thumbColor: MaterialStateProperty.all<Color>(
                              AppColors.white,
                            ),
                            activeTrackColor: AppColors.darkGreen,
                            inactiveTrackColor: AppColors.txtHintColor,
                            value: controller.isSwitched.value,
                            onChanged: (bool value) {
                              controller.isSwitched.value = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Your profile will be hidden from other Learners until you choose to show it again',
                      style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 12,
                        fontType: AppFont.Medium,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Divider(height: 1),
                  // SizedBox(height: 10),
                  Divider(height: 1),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('Preferred session types',
                          style: GetAppFont.getInstance().addStyle(
                              name: AppFont.Avenir,
                              fs: 18,
                              fontType: AppFont.Bold,
                              color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Obx(() => FittedBox(child: _tabWidget(context))),
                  SizedBox(height: 28),
                  Divider(height: 1),
                  SizedBox(height: 28),
                  Row(
                    children: [
                      Text('Payments',
                          style: GetAppFont.getInstance().addStyle(
                              name: AppFont.Avenir,
                              fs: 18,
                              fontType: AppFont.Bold,
                              color: Colors.black)),
                    ],
                  ),

                  SizedBox(height: 10),
                  // txtFieldWithheader(
                  //     headerTxt: '',
                  //     hintTxt: '1',
                  //     txtController: controller.nameTxtController),
                  txtFieldWithheader(
                    expOnboard: true,
                    txtController: controller.priceTxtController1,
                    iconRight: Icon(CupertinoIcons.search),
                    showRightIcon: true,
                    headerTxt: 'Price per minute (USD)',
                    hintTxt: "\$1",
                    isRightSvg: true,
                    svgPath: AppImages.editIcon,
                    marginBottom: controller.isEditingSubject.value ? 15 : 15,
                    onTap: () {
                      // controller.isEditingLanguage.value = false;
                    },
                    validator: (value) {
                      // controller.isEditingLanguage.value = false;
                      // value!.isEmpty
                      //     ? controller.isEditingSubject.value = false
                      //     : controller.isEditingSubject.value = true;
                    },
                    // onTapOut: (value){
                    //   controller.isEditingSubject.value = false;
                    // },
                  ),
                  SizedBox(height: 20), Divider(height: 1),
                  SizedBox(height: 28),
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.cameraIcon, width: 20),
                      SizedBox(
                        width: 14,
                      ),
                      Text(
                        'Manage payment method',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(height: 1), SizedBox(height: 20),

                  Row(
                    children: [
                      SvgPicture.asset(AppImages.contactSupport, width: 20),
                      SizedBox(
                        width: 14,
                      ),
                      Text(
                        'Contact support',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(height: 1), SizedBox(height: 20),

                  Row(
                    children: [
                      Text('My privacy',
                          style: GetAppFont.getInstance().addStyle(
                              name: AppFont.Recoleta,
                              fs: 18,
                              fontType: AppFont.Bold,
                              color: Colors.black)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Video call recordings',
                        style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Avenir,
                          fs: 16,
                          fontType: AppFont.Medium,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        width: 100,
                        alignment: Alignment.topRight,
                        child: Obx(
                          () => Switch(
                            thumbColor: MaterialStateProperty.all<Color>(
                              AppColors.white,
                            ),
                            activeTrackColor: AppColors.darkGreen,
                            inactiveTrackColor: AppColors.txtHintColor,
                            value: controller.isSwitched1.value,
                            onChanged: (bool value) {
                              controller.isSwitched1.value = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Choose your availability so Learners can schedule sessions with you ahead of time.',
                      style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 12,
                        fontType: AppFont.Medium,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(height: 1), SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Voice call recordings',
                        style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Avenir,
                          fs: 16,
                          fontType: AppFont.Medium,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        width: 100,
                        alignment: Alignment.topRight,
                        child: Obx(
                          () => Switch(
                            thumbColor: MaterialStateProperty.all<Color>(
                              AppColors.white,
                            ),
                            activeTrackColor: AppColors.darkGreen,
                            inactiveTrackColor: AppColors.txtHintColor,
                            value: controller.isSwitched3.value,
                            onChanged: (bool value) {
                              controller.isSwitched3.value = value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'Choose your availability so Learners can schedule sessions with you ahead of time.',
                      style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 12,
                        fontType: AppFont.Medium,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(height: 1), SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text('Pre-booked sessions',
                              style: GetAppFont.getInstance().addStyle(
                                  name: AppFont.Recoleta,
                                  fs: 18,
                                  fontType: AppFont.Bold,
                                  color: Colors.black)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Set available times',
                            style: GetAppFont.getInstance().addStyle(
                              name: AppFont.Avenir,
                              fs: 16,
                              fontType: AppFont.Medium,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            width: 100,
                            alignment: Alignment.topRight,
                            child: Obx(
                              () => Switch(
                                thumbColor: MaterialStateProperty.all<Color>(
                                  AppColors.white,
                                ),
                                activeTrackColor: AppColors.darkGreen,
                                inactiveTrackColor: AppColors.txtHintColor,
                                value: controller.isSwitched2.value,
                                onChanged: (bool value) {
                                  controller.isSwitched2.value = value;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Obx(() {
                        // Conditionally render the widgets when isSwitched2 is true
                        if (controller.isSwitched2.value) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  'Choose your availability so Learners can schedule sessions with you ahead of time.',
                                  style: GetAppFont.getInstance().addStyle(
                                    name: AppFont.Avenir,
                                    fs: 12,
                                    fontType: AppFont.Medium,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Divider(height: 1),
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  'Tip: If you’d like breaks between your sessions, choose your available times accordingly.',
                                  style: GetAppFont.getInstance().addStyle(
                                    name: AppFont.Avenir,
                                    fs: 12,
                                    fontType: AppFont.Medium,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              FittedBox(child: _tabWidget1(context)),
                              _tabWidget3(context),
                              SizedBox(height: 20),
                              Divider(height: 1),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.iconSun,
                                      width: 20),
                                  SizedBox(
                                    width: 14,
                                  ),
                                  Text(
                                    'Set unavailable dates',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Spacer(),
                                  Icon(Icons.keyboard_arrow_right)
                                ],
                              ),
                              SizedBox(height: 20),
                              Divider(height: 1),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  SvgPicture.asset(AppImages.calendarIcon,
                                      width: 20),
                                  SizedBox(
                                    width: 14,
                                  ),
                                  Text(
                                    'Sync with your calendar',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Spacer(),
                                  Icon(Icons.keyboard_arrow_right)
                                ],
                              ),
                              SizedBox(height: 20),
                              Divider(height: 1),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Text('Select your session duration',
                                      style: GetAppFont.getInstance().addStyle(
                                          name: AppFont.Recoleta,
                                          fs: 18,
                                          fontType: AppFont.Bold,
                                          color: Colors.black)),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  'Set the duration of sessions that Learners can book with you. You can pick more than one duration option.',
                                  style: GetAppFont.getInstance().addStyle(
                                    name: AppFont.Avenir,
                                    fs: 12,
                                    fontType: AppFont.Medium,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  FittedBox(child: _tabWidget2(context)),
                                ],
                              ),
                              SizedBox(height: 10),
                              Divider(height: 1),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text('Set your fee for pre-booked sessions',
                                      style: GetAppFont.getInstance().addStyle(
                                          name: AppFont.Recoleta,
                                          fs: 18,
                                          fontType: AppFont.Bold,
                                          color: Colors.black)),
                                ],
                              ),
                              SizedBox(height: 10),
                              txtFieldWithheader(
                                  expOnboard: true,
                                  txtController: controller.priceTxtController2,
                                  txtInputType: TextInputType.number,
                                  headerTxt:
                                      '${controller.getSelectedSession() ?? 'Select a session'} session price',
                                  hintTxt: '\$60'),
                            ],
                          );
                        } else {
                          return SizedBox
                              .shrink(); // Return an empty widget when isSwitched2 is false
                        }
                      }),
                    ],
                  ),
                  // SizedBox(height: 10),
                  // SizedBox(height: 10),
                  // txtFieldWithheader(
                  //     expOnboard: true,
                  //     txtController: controller.priceTxtController3,
                  //     txtInputType: TextInputType.number,
                  //     headerTxt: '30-min session price',
                  //     hintTxt: '\$100'),
                  // SizedBox(height: 20),
                  SizedBox(height: 20), SizedBox(height: 20),
                  Container(
                    width: 200,
                    margin: const EdgeInsets.only(top: 20),
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
                        onTap: () {
                          controller.createExpertSettings();
                        },
                        showPrefixIcon: false,
                        addStandardMargin: false),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabItem(
          addEdgeInsets: EdgeInsets.all(0),
          width: 80,
          height: 36,
          cornerRadius: 5,
          leftIcon: Icons.chat,
          title: "Chat",
          borderColor: Colors.black,
          backgroundColor:
              controller.selectedTabs[0] ? Colors.black : AppColors.appBg,
          titleColor: controller.selectedTabs[0] ? Colors.white : Colors.black,
          isIcon: false,
          image: AppImages.chatIcon1,
          iconColor: controller.selectedTabs[0] ? Colors.white : Colors.black,
          onTap: () {
            controller.selectTab(0);
          },
          showPrefixIcon: true,
          addStandardMargin: false,
        ),
        SizedBox(width: 16),
        TabItem(
          addEdgeInsets: EdgeInsets.all(0),
          width: 80,
          height: 36,
          cornerRadius: 5,
          leftIcon: Icons.call,
          title: "Call",
          borderColor: Colors.black,
          backgroundColor:
              controller.selectedTabs[1] ? Colors.black : AppColors.appBg,
          titleColor: controller.selectedTabs[1] ? Colors.white : Colors.black,
          isIcon: false,
          image: AppImages.callIcon,
          iconColor: controller.selectedTabs[1] ? Colors.white : Colors.black,
          onTap: () {
            controller.selectTab(1);
          },
          showPrefixIcon: true,
          addStandardMargin: false,
        ),
        SizedBox(width: 16),
        TabItem(
          addEdgeInsets: EdgeInsets.all(0),
          width: 80,
          height: 36,
          cornerRadius: 5,
          leftIcon: Icons.videocam,
          title: "Video",
          borderColor: Colors.black,
          backgroundColor:
              controller.selectedTabs[2] ? Colors.black : AppColors.appBg,
          titleColor: controller.selectedTabs[2] ? Colors.white : Colors.black,
          isIcon: false,
          image: AppImages.videoIcon,
          iconColor: controller.selectedTabs[2] ? Colors.white : Colors.black,
          onTap: () {
            controller.selectTab(2);
          },
          showPrefixIcon: true,
          addStandardMargin: false,
        ),
        SizedBox(width: 100),
      ],
    );
  }

  Widget _tabWidget1(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(controller.daysOfWeek.length, (index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: GestureDetector(
                  onTap: () => controller.updateIndex(index),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    decoration: BoxDecoration(
                      color: controller.selectedIndex.value == index
                          ? Colors.black
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: FittedBox(
                      child: Text(
                        controller.daysOfWeek[index],
                        style: TextStyle(
                          color: controller.selectedIndex.value == index
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }

  Widget _tabWidget2(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(controller.time.length, (index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: GestureDetector(
                  onTap: () => controller.selectedIndex1.value = index,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    decoration: BoxDecoration(
                      color: controller.selectedIndex1.value == index
                          ? Colors.black
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: FittedBox(
                      child: Text(
                        controller.time[index],
                        style: TextStyle(
                          color: controller.selectedIndex1.value == index
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }

  // Widget _tabWidget3(BuildContext context) {
  //   return SizedBox(
  //     height: 250,
  //     width: double.infinity,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Expanded(
  //           child: Obx(() {
  //             return ListView.builder(
  //               itemCount: controller.timeSlots.length,
  //               itemBuilder: (context, index) {
  //                 return Padding(
  //                   padding: const EdgeInsets.symmetric(vertical: 4.0),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       if (index == 0) Text('Monday'),
  //                       Expanded(
  //                         child: Container(
  //                           height: 40.0,
  //                           width: 60,
  //                           decoration: BoxDecoration(
  //                             color: Colors.grey[300],
  //                             borderRadius: BorderRadius.circular(8.0),
  //                           ),
  //                           child: Center(
  //                             child: Text(
  //              here i need to enter time but now not editable give correct code                  controller.timeSlots[index][0], // Start time
  //                               style: TextStyle(
  //                                 fontSize: 16.0,
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       SizedBox(width: 5),
  //                       Text('to'),
  //                       SizedBox(width: 5),
  //                       Expanded(
  //                         child: Container(
  //                           height: 40.0,
  //                           width: 60,
  //                           decoration: BoxDecoration(
  //                             color: Colors.grey[300],
  //                             borderRadius: BorderRadius.circular(8.0),
  //                           ),
  //                           child: Center(
  //                             child: Text(
  //                               controller.timeSlots[index][1], // End time
  //                               style: TextStyle(
  //                                 fontSize: 16.0,
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       if (index == 0)
  //                         IconButton(
  //                           icon: Icon(Icons.add_circle_outline_outlined),
  //                           onPressed: controller.addTimeSlot,
  //                         ),
  //                       if (index == 0 && controller.timeSlots.length > 1)
  //                         IconButton(
  //                           icon: Icon(Icons.remove_circle_outline),
  //                           onPressed: () => controller.removeTimeSlot(index),
  //                         ),
  //                     ],
  //                   ),
  //                 );
  //               },
  //             );
  //           }),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _tabWidget3(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            // Retrieve the abbreviation from the controller
            final selectedIndex = controller.selectedIndex.value;
            final abbreviation = (selectedIndex >= 0 &&
                    selectedIndex < controller.daysOfWeek.length)
                ? controller.daysOfWeek[selectedIndex]
                : '';

            // Fetch the full day name from the controller's mapping
            final selectedDay = controller.dayMap[abbreviation] ?? '';

            // Clear time slots and add a default slot if needed
            // Ensure to call `controller.timeSlots.clear()` outside of the build process
            if (controller.previousIndex.value != selectedIndex) {
              Future.microtask(() {
                controller.previousIndex.value = selectedIndex;
                controller.timeSlots.clear();
                controller
                    .addTimeSlot(); // Ensure at least one time slot is present
              });
            }

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                selectedDay, // Display the full name of the selected day
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }),
          Expanded(
            child: Obx(() {
              return SingleChildScrollView(
                child: Column(
                  children: List.generate(controller.timeSlots.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: TextFormField(
                                initialValue: controller.timeSlots[index][0],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  controller.timeSlots[index][0] = value;
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Text('to'),
                          SizedBox(width: 5),
                          Expanded(
                            child: Container(
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: TextFormField(
                                initialValue: controller.timeSlots[index][1],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  controller.timeSlots[index][1] = value;
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          if (index == controller.timeSlots.length - 1)
                            IconButton(
                              icon: Icon(Icons.add_circle_outline_outlined),
                              onPressed: controller.addTimeSlot,
                            ),
                          if (controller.timeSlots.length > 1)
                            IconButton(
                              icon: Icon(Icons.remove_circle_outline),
                              onPressed: () => controller.removeTimeSlot(index),
                            ),
                        ],
                      ),
                    );
                  }),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
