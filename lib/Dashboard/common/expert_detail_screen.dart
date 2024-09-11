import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_svg/svg.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:get/get.dart';
import 'package:recess/Dashboard/home/book_session_screen.dart';
import 'package:recess/Utility/app_back_btn.dart';
import 'package:recess/Utility/expert_list_item.dart';
import 'package:recess/Utility/item_tab.dart';
import 'package:recess/Utility/responsive.dart';
import 'package:recess/app_constants/app_colors.dart';
import 'package:recess/app_constants/app_pm_standards.dart';
import 'package:recess/components/web_footer.dart';

import '../../Auth/login_options_screen.dart';
import '../../Utility/AppImages.dart';
import '../../Utility/custom_avatar.dart';

class ExpertDetailScreen extends StatelessWidget {
  ExpertDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Responsive.getSize(context) == ScreenSize.kMobile ||
              Responsive.getSize(context) == ScreenSize.mobile
          ? ExpertDetailMobileScreen()
          : ExpertDetailWebScreen(),
    );
  }
}

class ReviewItem extends StatelessWidget {
  final double rating;
  final String userName, reviewTxt;

  const ReviewItem({
    super.key,
    required this.rating,
    required this.userName,
    required this.reviewTxt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.all(
              Radius.circular(AppPMStandards.shared.cardCorner)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.25),
                blurRadius: 2)
          ]),
      child: Column(children: [
        Row(
          children: [
            Text(
              userName,
              style: GetAppFont.getInstance().addStyle(
                  name: AppFont.Avenir,
                  fs: 12,
                  fontType: AppFont.Bold,
                  color: Colors.black),
            ),
            SizedBox(width: 10),
            RatingStars(
              value: rating,
              starCount: 5,
              starSize: 10,
              valueLabelVisibility: false,
              starColor: AppColors.starColor,
            )
          ],
        ),
        Text(reviewTxt,
            style: GetAppFont.getInstance().addStyle(
                name: AppFont.Avenir,
                fs: 13,
                fontType: AppFont.Medium,
                color: Colors.black))
      ]).paddingAll(10).marginAll(5),
    );
  }
}

// Expert Details Mobile

class ExpertDetailMobileScreen extends StatelessWidget {
  ExpertDetailMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBg,
      appBar: AppBar(
        backgroundColor: AppColors.appBg,
        surfaceTintColor: Colors.transparent,
        leadingWidth: 126,
        leading: AppBackBtn(),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 15),
            // color: Colors.brown,
            // height: 60,
            child: InkWell(
              onTap: () {
                Get.to(BookSessionScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      padding: EdgeInsets.only(right: 4),
                      child:
                          SvgPicture.asset(AppImages.calendarIcon1, width: 20)),
                  Text(
                    "Book a session",
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 14,
                        fontType: AppFont.SemiBold,
                        color: Colors.black),
                  ),
                  Container(
                      padding: EdgeInsets.only(bottom: 4),
                      child: SvgPicture.asset(AppImages.forwardIcon, width: 15))
                ],
              ),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.only(top: 12),
              color: AppColors.appBg,
              child: ExpertListItem(
                  bgColor: AppColors.appBg, isDetailPage: true, position: 0),
            ),
            SizedBox(height: 28),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppPMStandards.shared.leftPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(height: 1),
                  SizedBox(height: 16),
                  Text(
                    'Tanya is available now',
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Recoleta,
                        fs: 18,
                        fontType: AppFont.SemiBold,
                        color: AppColors.btnBlack),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      TabItem(
                          addEdgeInsets: EdgeInsets.all(0),
                          width: 142,
                          height: 32,
                          fontSize: 12,
                          fontType: AppFont.SemiBold,
                          suffixImage: AppImages.forwardIcon,
                          suffixIconHeight: 10,
                          suffixIconWidth: 10,
                          showSuffixIcon: true,
                          cornerRadius: 4,
                          title: 'Connect now',
                          borderColor: AppColors.darkGreen,
                          backgroundColor: AppColors.cardBg,
                          titleColor: AppColors.darkGreen,
                          isIcon: false,
                          image: '',
                          iconColor: AppColors.darkGreen,
                          onTap: () {},
                          showPrefixIcon: false,
                          addStandardMargin: false),
                      SizedBox(width: 16),
                      TabItem(
                          addEdgeInsets: EdgeInsets.all(0),
                          width: 142,
                          height: 32,
                          suffixIconHeight: 10,
                          suffixIconWidth: 10,
                          fontSize: 12,
                          fontType: AppFont.SemiBold,
                          suffixImage: AppImages.forwardIcon,
                          showSuffixIcon: true,
                          cornerRadius: 4,
                          title: 'Book a session',
                          borderColor: AppColors.btnBlack,
                          backgroundColor: AppColors.cardBg,
                          titleColor: AppColors.btnBlack,
                          isIcon: false,
                          image: '',
                          iconColor: AppColors.btnBlack,
                          onTap: () {},
                          showPrefixIcon: false,
                          addStandardMargin: false)
                    ],
                  ),
                  SizedBox(height: 28),
                  Divider(height: 1),
                  SizedBox(height: 16),
                  Text(
                    'Bio',
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Recoleta,
                        fs: 18,
                        height: 2.6,
                        fontType: AppFont.SemiBold,
                        color: AppColors.btnBlack),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque id mauris elit. Nunc aliquet ligula tortor, consectetur consectetur justo rhoncus quis.\n\nIn id tellus diam. Donec imperdiet finibus augue. Quisque volutpat sapien nisl, vel gravida neque dictum ut. Aliquam pulvinar nec justo nec eleifend.',
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 13,
                        fontType: AppFont.Medium,
                        color: AppColors.btnBlack),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'jasonfriedman.com',
                        style: GetAppFont.getInstance().addStyle(
                            name: AppFont.Avenir,
                            fs: 13,
                            fontType: AppFont.SemiBold,
                            color: AppColors.btnBlack),
                      ),
                      SizedBox(width: 4),
                      SvgPicture.asset(AppImages.shareLinkIcon)
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(height: 1),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reviews',
                        style: GetAppFont.getInstance().addStyle(
                            name: AppFont.Recoleta,
                            fs: 18,
                            height: 2.6,
                            fontType: AppFont.SemiBold,
                            color: AppColors.btnBlack),
                      ),
                      Row(children: [
                        Text(
                          'View all',
                          style: GetAppFont.getInstance().addStyle(
                              name: AppFont.Avenir,
                              fs: 12,
                              fontType: AppFont.SemiBold,
                              color: AppColors.btnBlack),
                        ),
                        SizedBox(width: 2),
                        SvgPicture.asset(
                          AppImages.forwardIcon,
                          width: 10,
                        )
                      ]),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ])),
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppPMStandards.shared.leftPadding),
              child: ReviewItem(
                  rating: 4,
                  userName: 'John Smith',
                  reviewTxt:
                      'Vivamus tincidunt tempor elit, sed facilisis libero posuere placerat. Nunc sapien erat, egestas!'),
            );
          })),
        ],
      ),
    );
  }
}

// Expert Details Web
class ExpertDetailWebScreen extends StatelessWidget {
  ExpertDetailWebScreen({super.key});

  List<ReviewItem> reviewItems() => [
        ReviewItem(
            rating: 4,
            userName: 'John Smith',
            reviewTxt:
                'Vivamus tincidunt tempor elit, sed facilisis libero posuere placerat. Nunc sapien erat, egestas!'),
        ReviewItem(
            rating: 4,
            userName: 'John Smith',
            reviewTxt:
                'Vivamus tincidunt tempor elit, sed facilisis libero posuere placerat. Nunc sapien erat, egestas!')
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBg,
      appBar: AppBar(
        leadingWidth: 177,
        surfaceTintColor: AppColors.appBg,
        backgroundColor: AppColors.appBg,
        leading:
            Container(padding: EdgeInsets.only(left: 70), child: AppBackBtn()),
      ),
      // bottomNavigationBar: WebFooter(),
      body: FooterView(
        footer: Footer(
            backgroundColor: AppColors.appBg,
            padding: EdgeInsets.symmetric(horizontal: 77),
            child: Column(
              children: [
                Divider(
                  height: 1,
                ),
                SizedBox(height: 20),
                WebFooter(),
              ],
            )),
        children: [
          Container(
            padding: EdgeInsets.only(top: 40, left: 77, right: 77),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(
                  height: 1,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  color: AppColors.appBg,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: FittedBox(
                            child: InkWell(
                              onTap: () {
                                Get.to(ExpertDetailScreen());
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: AppColors.appBg,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            AppPMStandards.shared.cardCorner)),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 4),
                                          spreadRadius: 0,
                                          color: Colors.black.withOpacity(0.25),
                                          blurRadius: 2),
                                      BoxShadow(
                                          offset: Offset(0, -1),
                                          spreadRadius: 0,
                                          color: Colors.black.withOpacity(0.25),
                                          blurRadius: 2),
                                    ]),
                                // margin: EdgeInsets.only(left: 2, right: 2),
                                // padding: EdgeInsets.only(left: 14, right: 13, top: 12, bottom: 13),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 80,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomAvatar(
                                              radius: 40, imageUrl: ""),
                                          RatingStars(
                                            value: 5.0,
                                            starCount: 5,
                                            starSize: 14,
                                            valueLabelVisibility: false,
                                            starColor: AppColors.starColor,
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            '1034 Sessions',
                                            style: GetAppFont.getInstance()
                                                .addStyle(
                                                    name: AppFont.Avenir,
                                                    fs: 10,
                                                    fontType: AppFont.SemiBold,
                                                    color: AppColors.btnBlack),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // 1 row
                                        Container(
                                          // color: Colors.brown,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 200,
                                                child: const Text(
                                                  "Linda Anderson",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily: "avenir",
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              SizedBox(width: 20),
                                              Container(
                                                width: 50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(AppImages
                                                        .tickBadgeIcon),
                                                    SizedBox(width: 5),
                                                    SvgPicture.asset(
                                                        AppImages.redBadgeIcon)
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        SizedBox(height: 10),

                                        //   2 row
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              width: 200,
                                              child: Text(
                                                  "PhD in Behavioural Science\nSpeaks English, French",
                                                  overflow: TextOverflow.clip,
                                                  style: GetAppFont
                                                          .getInstance()
                                                      .addStyle(
                                                          name: AppFont.Avenir,
                                                          fs: 12,
                                                          fontType:
                                                              AppFont.Medium,
                                                          color: AppColors
                                                              .btnBlack) //TextStyle(fontSize: 12,fontFamily: "avenir",fontWeight: FontWeight.w500,color: AppColors.btnBlack),
                                                  ),
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              '\$10/min',
                                              style: GetAppFont.getInstance()
                                                  .addStyle(
                                                      name: AppFont.Recoleta,
                                                      height: 2,
                                                      fs: 14,
                                                      fontType:
                                                          AppFont.SemiBold,
                                                      color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        //   3 row

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            TabItem(
                                                addEdgeInsets: EdgeInsets.only(
                                                    left: 8, right: 8),
                                                cornerRadius: 4,
                                                title: 0 % 2 == 0
                                                    ? 'Hypnotherapy'
                                                    : 'Business',
                                                height: 28,
                                                fontType: AppFont.SemiBold,
                                                fontSize: 12,
                                                borderColor: Colors.transparent,
                                                backgroundColor: false != true
                                                    ? Color(0xFFEAEAEA)
                                                    : AppColors.btnBlack,
                                                titleColor: false != true
                                                    ? Colors.black
                                                    : AppColors.white,
                                                isIcon: false,
                                                suffixImage:
                                                    AppImages.forwardIcon,
                                                suffixIconHeight: 10,
                                                suffixIconWidth: 10,
                                                showSuffixIcon: false,
                                                image: '',
                                                iconColor: false != true
                                                    ? Colors.black
                                                    : AppColors.white,
                                                onTap: () {},
                                                showPrefixIcon: false,
                                                addStandardMargin: false),

                                            SizedBox(width: 80),
                                            // Chat Button
                                            TabItem(
                                                addEdgeInsets:
                                                    EdgeInsets.all(0),
                                                width: 77,
                                                height: 28,
                                                cornerRadius: 4,
                                                leftIcon: Icons.add,
                                                title: "Online",
                                                fontType: AppFont.SemiBold,
                                                fontSize: 12,
                                                borderColor:
                                                    AppColors.darkGreen,
                                                backgroundColor: Colors.white,
                                                titleColor: AppColors.darkGreen,
                                                isIcon: false,
                                                image: '',
                                                iconColor: Colors.black,
                                                onTap: () {},
                                                showPrefixIcon: false,
                                                addStandardMargin: false),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                      SizedBox(width: 50),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: AppPMStandards.shared.leftPadding,
                              right: AppPMStandards.shared.leftPadding),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tanya is available now',
                                style: GetAppFont.getInstance().addStyle(
                                    name: AppFont.Recoleta,
                                    fs: 18,
                                    fontType: AppFont.SemiBold,
                                    color: AppColors.btnBlack),
                              ),
                              SizedBox(height: 16),
                              FittedBox(
                                child: Row(
                                  children: [
                                    TabItem(
                                        addEdgeInsets: EdgeInsets.all(0),
                                        width: 142,
                                        height: 32,
                                        fontSize: 12,
                                        fontType: AppFont.SemiBold,
                                        suffixImage: AppImages.forwardIcon,
                                        suffixIconHeight: 10,
                                        suffixIconWidth: 10,
                                        showSuffixIcon: true,
                                        cornerRadius: 4,
                                        title: 'Connect now',
                                        borderColor: AppColors.darkGreen,
                                        backgroundColor: AppColors.cardBg,
                                        titleColor: AppColors.darkGreen,
                                        isIcon: false,
                                        image: '',
                                        iconColor: AppColors.darkGreen,
                                        onTap: () {},
                                        showPrefixIcon: false,
                                        addStandardMargin: false),
                                    SizedBox(width: 16),
                                    TabItem(
                                        addEdgeInsets: EdgeInsets.all(0),
                                        width: 142,
                                        height: 32,
                                        suffixIconHeight: 10,
                                        suffixIconWidth: 10,
                                        fontSize: 12,
                                        fontType: AppFont.SemiBold,
                                        suffixImage: AppImages.forwardIcon,
                                        showSuffixIcon: true,
                                        cornerRadius: 4,
                                        title: 'Book a session',
                                        borderColor: AppColors.btnBlack,
                                        backgroundColor: AppColors.cardBg,
                                        titleColor: AppColors.btnBlack,
                                        isIcon: false,
                                        image: '',
                                        iconColor: AppColors.btnBlack,
                                        onTap: () {},
                                        showPrefixIcon: false,
                                        addStandardMargin: false)
                                  ],
                                ),
                              ),
                              SizedBox(height: 28),
                              Divider(height: 1),
                              SizedBox(height: 16),
                              Text(
                                'Bio',
                                style: GetAppFont.getInstance().addStyle(
                                    name: AppFont.Recoleta,
                                    fs: 18,
                                    height: 2.6,
                                    fontType: AppFont.SemiBold,
                                    color: AppColors.btnBlack),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque id mauris elit. Nunc aliquet ligula tortor, consectetur consectetur justo rhoncus quis.\n\nIn id tellus diam. Donec imperdiet finibus augue. Quisque volutpat sapien nisl, vel gravida neque dictum ut. Aliquam pulvinar nec justo nec eleifend.',
                                style: GetAppFont.getInstance().addStyle(
                                    name: AppFont.Avenir,
                                    fs: 13,
                                    fontType: AppFont.Medium,
                                    color: AppColors.btnBlack),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Text(
                                    'jasonfriedman.com',
                                    style: GetAppFont.getInstance().addStyle(
                                        name: AppFont.Avenir,
                                        fs: 13,
                                        fontType: AppFont.SemiBold,
                                        color: AppColors.btnBlack),
                                  ),
                                  SizedBox(width: 4),
                                  SvgPicture.asset(AppImages.shareLinkIcon)
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Reviews',
                                  style: GetAppFont.getInstance().addStyle(
                                      name: AppFont.Recoleta,
                                      fs: 18,
                                      // height: 2.6,
                                      fontType: AppFont.SemiBold,
                                      color: AppColors.btnBlack),
                                ),
                                Row(children: [
                                  Text(
                                    'View all',
                                    style: GetAppFont.getInstance().addStyle(
                                        name: AppFont.Avenir,
                                        fs: 12,
                                        fontType: AppFont.SemiBold,
                                        color: AppColors.btnBlack),
                                  ),
                                  SizedBox(width: 2),
                                  SvgPicture.asset(
                                    AppImages.forwardIcon,
                                    width: 10,
                                  )
                                ]),
                              ],
                            ),
                            SizedBox(height: 20),
                            Divider(height: 1),
                            SizedBox(height: 16),
                            SizedBox(height: 16),
                            ...reviewItems(),
                            SizedBox(height: 16),
                            Divider(height: 1),
                            SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
