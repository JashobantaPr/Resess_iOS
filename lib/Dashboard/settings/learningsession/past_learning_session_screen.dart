import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/Utility/custom_avatar.dart';
import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/core/url.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';

import '../../../Utility/item_tab.dart';
import '../../../controllers/settings/learning_session_controller.dart';
import '../../../models/settings_model/learner_past_session.dart';

class PastLearningSessionScreen extends GetWidget<LearningSessionController> {
  PastLearningSessionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appBg,
      child: controller.pastdata.isEmpty
          ? Center(
              child: Text(
                "No Past Learner Sessions \n                  data",
                style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Recoleta,
                    fs: 24,
                    fontType: AppFont.Bold,
                    color: Colors.black),
              ),
            )
          : Obx(() => ListView.separated(
                primary: false,
                shrinkWrap: true,
                itemCount: controller.pastdata.length,
                itemBuilder: (context, position) {
                  LearnerPassSessionsModel? item =
                      controller.pastdata[position];

                  return learningSessionItem(item: item);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 10,
                    color: Colors.transparent,
                  );
                },
              )),
    );
  }
}

class learningSessionItem extends StatelessWidget {
  learningSessionItem({
    super.key,
    required this.item,
  });
  final LearningSessionController controller =
      Get.put(LearningSessionController());

  final LearnerPassSessionsModel? item;
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
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          item?.rating != null
              ? Column(
                  children: [
                    learningItemTop(),
                    SizedBox(height: 20),
                    Divider(height: 1),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text.rich(TextSpan(
                            text: controller.formatDate(
                                controller.pastdata.first?.chooseDate ?? ""),
                            style: GetAppFont.getInstance().addStyle(
                                name: AppFont.Avenir,
                                fs: 12,
                                fontType: AppFont.Bold,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    ',${controller.pastdata.first?.chooseTime}',
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
                      ],
                    ),
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
                        Text.rich(TextSpan(
                            text: 'Chat Session',
                            style: GetAppFont.getInstance().addStyle(
                                name: AppFont.Avenir,
                                fs: 12,
                                fontType: AppFont.Bold,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    ' - \$${controller.pastdata.first?.amount ?? ""}',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => print('Tap Here onTap'),
                                style: GetAppFont.getInstance().addStyle(
                                    name: AppFont.Avenir,
                                    fs: 12,
                                    fontType: AppFont.Medium,
                                    color: Colors.black),
                              )
                              // can add more TextSpans here...
                            ]))
                      ],
                    ),
                  ],
                )
              : _buildAddReviews(),
          SizedBox(height: 10),
          item?.rating?.rating != null
              ? Column(
                  children: [
                    Divider(height: 1),
                    Row(
                      children: [
                        Text(
                          "Your Review",
                          style: GetAppFont.getInstance().addStyle(
                              name: AppFont.Avenir,
                              fs: 14,
                              fontType: AppFont.Bold,
                              color: Colors.black),
                        ),
                        RatingBar.readOnly(
                          filledIcon: Icons.star,
                          emptyIcon: Icons.star_border,
                          initialRating: item?.rating?.rating.toDouble() ?? 0.0,
                          maxRating: 5,
                        )
                      ],
                    ),
                    Text(
                      item?.rating?.description ?? "",
                      style: GetAppFont.getInstance().addStyle(
                          name: AppFont.Avenir,
                          fs: 12,
                          fontType: AppFont.Medium,
                          color: Colors.black),
                    ),
                    item?.rating?.reply == null
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 0),
                            child: Container(
                              width: double.infinity,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: AppColors.appBg,
                                  borderRadius: BorderRadius.circular(28),
                                  border: Border.all(color: AppColors.white)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item?.rating?.reply?.commentDetails
                                              ?.name ??
                                          "",
                                      style: GetAppFont.getInstance().addStyle(
                                          name: AppFont.Avenir,
                                          fs: 16,
                                          fontType: AppFont.Bold,
                                          color: Colors.black),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        item?.rating?.reply?.text ?? "",
                                        style: GetAppFont.getInstance()
                                            .addStyle(
                                                name: AppFont.Avenir,
                                                fs: 12,
                                                fontType: AppFont.Medium,
                                                color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ],
                )
              : Container(),
          SizedBox(height: 10),
          Column(
            children: [
              Divider(height: 1),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/contact.png",
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Contact support ',
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
                        SizedBox(width: 5),
                        Text(
                          'View chat',
                          style: GetAppFont.getInstance().addStyle(
                              name: AppFont.Avenir,
                              fs: 12,
                              fontType: AppFont.Bold,
                              color: AppColors.btnBlack),
                        ),
                        SvgPicture.asset(AppImages.forwardIcon)
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
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
        SizedBox(width: 10),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(children: [
                Text(controller.pastdata.first?.expert?.name ?? "",
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Recoleta,
                        fs: 15,
                        fontType: AppFont.Bold,
                        color: Colors.black)),
                SvgPicture.asset(AppImages.forwardIcon)
              ]),
            ),
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
        )
      ],
    );
  }

  //addReview Ui

  Widget _buildAddReviews() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: AppColors.appBg)),
          child: TextField(
            controller: controller.reviewController,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.appBg,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none, // Remove border if desired
              ),
            ),
            maxLines: 3,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Obx(() => Row(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        controller.updateRating(index + 1);
                      },
                      child: Icon(
                        index < controller.selectedRating.value
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.grey,
                        size: 40.0,
                      ),
                    );
                  }),
                ),
                Spacer(),
                TabItem(
                    width: 100,
                    cornerRadius: 5,
                    title: "Submit",
                    borderColor: AppColors.grey,
                    backgroundColor: AppColors.white,
                    titleColor: AppColors.grey,
                    isIcon: false,
                    image: "",
                    iconColor: Colors.transparent,
                    onTap: () {
                      controller.addRatings();
                    },
                    showPrefixIcon: false,
                    addStandardMargin: false),
              ],
            )),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
