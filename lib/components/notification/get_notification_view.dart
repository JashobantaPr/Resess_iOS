import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recess/Utility/AppImages.dart';

import '../../Auth/login_options_screen.dart';
import '../../Utility/custom_avatar.dart';
import '../../app_constants/app_colors.dart';
import '../../controllers/settings/notification_setting_controller.dart';
import '../../models/notification/get_notification_model.dart';
import '../../widgets/popup_model_widget.dart';

class GetNotificationsWidget extends StatelessWidget {
  GetNotificationsWidget({super.key, required this.item});

  final GetNotificationModel? item;

  final NotificationSettingsController controller =
      Get.put(NotificationSettingsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              learningItemTop(),
              SizedBox(height: 20),
              Divider(height: 1),
              SizedBox(height: 20),
              Text.rich(
                TextSpan(
                  text: item?.notificationData?.title ??
                      "", // Add your main text here
                  style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Avenir,
                      fs: 12,
                      fontType: AppFont.Bold,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: ', Tap Here',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Tap Here onTap');
                          // Add your onTap functionality here
                        },
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Avenir,
                          fs: 12,
                          fontType: AppFont.Medium,
                          color: Colors.blue),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(
                    "assets/images/iconchat.png",
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(width: 5),
                  Text.rich(
                    TextSpan(
                      text: 'Chat Session',
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Avenir,
                          fs: 12,
                          fontType: AppFont.Bold,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' - \$25',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('Tap Here onTap');
                              // Add your onTap functionality here
                            },
                          style: GetAppFont.getInstance().addStyle(
                              name: AppFont.Avenir,
                              fs: 12,
                              fontType: AppFont.Medium,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              item?.type == "preBookSession"
                  ? Column(
                      children: [
                        Divider(
                          thickness: 1,
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showSucessDialog();
                                    },
                                    child: Icon(
                                      Icons.check,
                                      color: AppColors.green,
                                    ),
                                    // child: SvgPicture.asset(
                                    //     AppImages.cancelRedIcon),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Accept',
                                    style: GetAppFont.getInstance().addStyle(
                                        name: AppFont.Avenir,
                                        fs: 12,
                                        fontType: AppFont.Bold,
                                        color: AppColors.green),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  showCancelDialog();
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppImages.cancelRedIcon),
                                    SizedBox(width: 5),
                                    Text(
                                      'Cancel',
                                      style: GetAppFont.getInstance().addStyle(
                                          name: AppFont.Avenir,
                                          fs: 12,
                                          fontType: AppFont.Bold,
                                          color: AppColors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : item?.type == "preSessionApproved"
                      ? Column(
                          children: [
                            Divider(
                              thickness: 1,
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 10, right: 10, top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          showSucessDialog();
                                        },
                                        child: Image.asset(
                                          "assets/images/comments.png",
                                          width: 25,
                                          height: 25,
                                        ),
                                        // child: SvgPicture.asset(
                                        //     AppImages.cancelRedIcon),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "Start Now",
                                        style: GetAppFont.getInstance()
                                            .addStyle(
                                                name: AppFont.Avenir,
                                                fs: 12,
                                                fontType: AppFont.Bold,
                                                color: AppColors.green),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Container(),
            ],
          ),
        ),
      ),
    );
  }

  void showSucessDialog() {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(
              width: 330,
              height: 230,
              child: CustomPopUpModal(
                title: "Sure!",
                message: 'Are You Sure You Want this Session',
                onConfirm: () {
                  Get.back();
                  controller.acceptSession();
                },
                onCancel: () {
                  Get.back();
                },
              ),
            ),
          );
        });
  }

  void showCancelDialog() {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(
              width: 330,
              height: 230,
              child: CustomPopUpModal(
                title: "Sure!",
                message: 'Are You Sure You Cancel this Session',
                onConfirm: () {
                  Get.back();
                  controller.cancelSession();
                },
                onCancel: () {
                  Get.back();
                },
              ),
            ),
          );
        });
  }

  Row learningItemTop() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: AppColors.white,
          child: CustomAvatar(
            radius: 35,
            imageUrl: "", // Example image URL
            bgColor: AppColors.lightGrey,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item?.notificationData?.body ?? "",
                        style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Recoleta,
                          fs: 15,
                          fontType: AppFont.Bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    // SvgPicture.asset(AppImages.forwardIcon),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  item?.message ?? "",
                  style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Avenir,
                    fs: 15,
                    fontType: AppFont.SemiBold,
                    color: Colors.black,
                  ),
                  maxLines: 3,
                  overflow:
                      TextOverflow.ellipsis, // Ensures text does not overflow
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
