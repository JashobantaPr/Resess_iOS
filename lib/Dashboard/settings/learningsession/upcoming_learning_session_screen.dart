import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/core/url.dart';

import '../../../Auth/login_options_screen.dart';
import '../../../Utility/custom_avatar.dart';
import '../../../controllers/settings/learning_session_controller.dart';
import '../../../models/settings_model/upcomming_user_profile.model.dart';

class UpcomingLearningSessionScreen
    extends GetWidget<LearningSessionController> {
  UpcomingLearningSessionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          color: AppColors.appBg,
          child: controller.upComingUserBookingData.isEmpty
              ? Center(
                  child: Text(
                  "No Upcoming Learning \n         sessions Data",
                  style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Recoleta,
                      fs: 24,
                      fontType: AppFont.Bold,
                      color: Colors.black),
                ))
              : ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: controller.upComingUserBookingData.length,
                  itemBuilder: (context, position) {
                    UpcomingUserBookingsModel? item =
                        controller.upComingUserBookingData[position];
                    return learningSessionItem(item: item);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 10,
                      color: Colors.transparent,
                    );
                  },
                ),
        ));
  }
}

class learningSessionItem extends StatelessWidget {
  learningSessionItem({super.key, required, this.item});
  final LearningSessionController controller =
      Get.put(LearningSessionController());

  final UpcomingUserBookingsModel? item;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            learningItemTop(),
            SizedBox(height: 20),
            Divider(height: 1),
            SizedBox(height: 20),
            Text.rich(TextSpan(
                text: controller.formatDate(item?.chooseDate ?? ""),
                style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Avenir,
                    fs: 12,
                    fontType: AppFont.Bold,
                    color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: ',${item?.chooseTime}',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => print('Tap Here onTap'),
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 12,
                        fontType: AppFont.Medium,
                        color: Colors.black),
                  )
                  // can add more TextSpans here...
                ])),
            SizedBox(height: 10),
            Row(
              children: [
                Image.asset(
                  "assets/images/iconchat.png",
                  width: 20,
                  height: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    controller.getTocken(item?.sId, item?.preferredSessionType);
                    //      item?.preferredSessionType == "Call"
                    // ? controller.onJoinAudioCall()
                    // : item?.preferredSessionType == "Video"
                    //     ? controller.onJoin()
                    //     : Container();
                  },
                  child: Text.rich(TextSpan(
                      text: item?.preferredSessionType,
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Avenir,
                          fs: 12,
                          fontType: AppFont.Bold,
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' - \$${item?.amount}',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => print('Tap Here onTap'),
                          style: GetAppFont.getInstance().addStyle(
                              name: AppFont.Avenir,
                              fs: 12,
                              fontType: AppFont.Medium,
                              color: Colors.black),
                        )
                        // can add more TextSpans here...
                      ])),
                )
              ],
            ),
            SizedBox(height: 10),
            Divider(height: 1),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            controller.showPopUpDialog();
                          },
                          child: SvgPicture.asset(AppImages.cancelRedIcon)),
                      SizedBox(width: 5),
                      Text(
                        'Cancel session',
                        style: GetAppFont.getInstance().addStyle(
                            name: AppFont.Avenir,
                            fs: 12,
                            fontType: AppFont.Bold,
                            color: AppColors.red),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.calendarIcon),
                      SizedBox(width: 5),
                      Text(
                        'Add to Calendar',
                        style: GetAppFont.getInstance().addStyle(
                            name: AppFont.Avenir,
                            fs: 12,
                            fontType: AppFont.SemiBold,
                            color: AppColors.btnBlack),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row learningItemTop() {
    return Row(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: AppColors.white,
          child: CustomAvatar(
            radius: 35,
            imageUrl: ("${Url.imageUrl}${item?.expert?.image}"),
            bgColor: AppColors.lightGrey,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(children: [
                Text(item?.expert?.name ?? "",
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Recoleta,
                        fs: 15,
                        fontType: AppFont.Bold,
                        color: Colors.black)),
                SvgPicture.asset(AppImages.forwardIcon)
              ]),
              SizedBox(
                height: 10,
              ),
              AppButton(
                  cornerRadius: 4,
                  leftIcon: Icons.add,
                  title: item?.levelOfSubjectKnowledge ?? "",
                  borderColor: Colors.transparent,
                  backgroundColor: Color(0xFFEAEAEA),
                  titleColor: Colors.black,
                  isIcon: false,
                  image: '',
                  iconColor: Colors.black,
                  onTap: () {},
                  showPrefixIcon: false,
                  addStandardMargin: false,
                  suffixImage: AppImages.forwardIcon,
                  showSuffixIcon: true)
            ],
          ),
        )
      ],
    );
  }
}
