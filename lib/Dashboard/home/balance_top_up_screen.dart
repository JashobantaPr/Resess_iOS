import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Dashboard/Home/invite_earn_screen.dart';
import 'package:recess/Utility/AppImages.dart';

import '../../Utility/app_back_btn.dart';
import '../../app_constants/app_colors.dart';

class BalanceTopUpScreen extends StatelessWidget {
  const BalanceTopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBg,
        title: null,
        leadingWidth: 100,
        leading: AppBackBtn(),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 15),
            // color: Colors.brown,
            // height: 60,
            child: InkWell(
              onTap: () {
                Get.to(InviteEarnScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      padding: EdgeInsets.only(right: 4),
                      child: SvgPicture.asset(AppImages.giftIcon, width: 25)),
                  Text(
                    "Invite & earn",
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Recoleta,
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
      body: Container(
          color: AppColors.appBg,
          padding: EdgeInsets.only(left: 25, right: 25,bottom: 30),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _balanceCard(),
                SizedBox(height: 30),
                Text(
                  'Top-up your balance',
                  style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Recoleta,
                      fs: 22,
                      fontType: AppFont.Bold,
                      color: Colors.black),
                ),
                SizedBox(height: 10),
                _topupTextField(),
                SizedBox(height: 10),
                Positioned(
                  bottom: 100,
                  child: Container(
                    child: GridView.count(
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 3.5),
                      // Generate 100 widgets that display their index in the List.
                      children: List.generate(6, (index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: AppColors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(
                                      2.0, 2.0), // shadow direction: bottom right
                                )
                              ]),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Top-up',
                                  style: GetAppFont.getInstance().addStyle(
                                      name: AppFont.Recoleta,
                                      fs: 12,
                                      fontType: AppFont.Medium,
                                      color: Colors.black),
                                ),
                                Text(
                                  '\$10',
                                  style: GetAppFont.getInstance().addStyle(
                                      name: AppFont.Recoleta,
                                      fs: 18,
                                      fontType: AppFont.Bold,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                SizedBox(height:10),
                Divider(height: 5),
                SizedBox(height:20),
              ])),
    );
  }
}

class _topupTextField extends StatelessWidget {
  const _topupTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      color: Colors.white,
      child: Row(
        children: [
          SvgPicture.asset(AppImages.dollarIcon),
          Expanded(
            child: TextField(
                obscureText: false,
                autofocus: false,
                style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Recoleta,
                    fs: 13,
                    fontType: AppFont.Medium,
                    color: Colors.black),
                decoration: InputDecoration(
                    hintText: 'Enter amount in USD',
                    contentPadding:
                        EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: InputBorder.none)),
          ),
          AppButton(
              cornerRadius: 4,
              leftIcon: Icons.add,
              title: 'Proceed',
              borderColor: Colors.black,
              backgroundColor: Colors.black,
              titleColor: Colors.white,
              isIcon: false,
              image: '',
              iconColor: Colors.black,
              onTap: () {},
              showPrefixIcon: false,
              addStandardMargin: false)
        ],
      ),
    );
  }
}

class _balanceCard extends StatelessWidget {
  const _balanceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            AppImages.walletIcon,
            width: 50,
          ),
          Column(
            children: [
              Text(
                'Available balance',
                style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Recoleta,
                    fs: 12,
                    fontType: AppFont.SemiBold,
                    color: Colors.black),
              ),
              Text(
                '\$20.00',
                style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Recoleta,
                    fs: 22,
                    fontType: AppFont.Bold,
                    color: Colors.black),
              )
            ],
          )
        ],
      ),
    );
  }
}
