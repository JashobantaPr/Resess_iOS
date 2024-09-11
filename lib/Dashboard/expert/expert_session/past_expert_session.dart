import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/Utility/item_tab.dart';
import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/controllers/expert/expert_session_controller.dart';
import 'package:recess/models/exper_model/expert_session_upcoming_model.dart';

class PastExpertSession extends GetWidget<ExpertSessionController> {
  PastExpertSession({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appBg,
      child: controller.expertpastData.isEmpty
          ? Container(child: Text("No bookings found for this expert."))
          : ListView.separated(
              itemCount: controller.expertpastData.length,
              itemBuilder: (context, position) {
                return learningSessionItem(
                    item: controller.expertpastData[position]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 10,
                  color: Colors.transparent,
                );
              },
            ),
    );
  }
}

class learningSessionItem extends StatelessWidget {
  final ExpertSessionUpcomingModel? item;
  learningSessionItem({super.key, required this.item});

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
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          learningItemTop(item),
          SizedBox(height: 20),
          Divider(height: 1),
          SizedBox(height: 20),
          Text.rich(
            TextSpan(
              text: "Level: ",
              style: GetAppFont.getInstance().addStyle(
                name: AppFont.Avenir,
                fs: 12,
                fontType: AppFont.Bold,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: item
                      ?.levelOfSubjectKnowledge, // Change this to "Beginner"
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => print('Tap Here onTap'),
                  style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Avenir,
                    fs: 12,
                    fontType: AppFont.Medium,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              text: "Message: ",
              style: GetAppFont.getInstance().addStyle(
                name: AppFont.Avenir,
                fs: 12,
                fontType: AppFont.Bold,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: item?.message, // Change this to "Beginner"
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => print('Tap Here onTap'),
                  style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Avenir,
                    fs: 12,
                    fontType: AppFont.Medium,
                    color: Colors.black,
                  ),
                ),
                // can add more TextSpans here...
              ],
            ),
          ),
          SizedBox(height: 30),
          Divider(height: 1),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AppImages.cancelRedIcon),
                    SizedBox(width: 5),
                    Text(
                      'Cancel session',
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Avenir,
                          fs: 12,
                          fontType: AppFont.SemiBold,
                          color: AppColors.red),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row learningItemTop(ExpertSessionUpcomingModel? item) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(item?.user?.name ?? "",
                  style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Recoleta,
                      fs: 15,
                      fontType: AppFont.Bold,
                      color: Colors.black)),
              SizedBox(
                height: 10,
              ),
              Text("Now",
                  style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Recoleta,
                      fs: 15,
                      fontType: AppFont.Bold,
                      color: Colors.black)),
            ],
          ),
        ),
        TabItem(
            cornerRadius: 5,
            title: item?.preferredSessionType ?? "",
            borderColor: AppColors.btnBlack,
            backgroundColor: AppColors.white,
            titleColor: const Color.fromARGB(255, 15, 56, 4),
            isIcon: false,
            image: "",
            iconColor: Colors.transparent,
            onTap: () {},
            showPrefixIcon: false,
            addStandardMargin: false)
      ],
    );
  }
}
