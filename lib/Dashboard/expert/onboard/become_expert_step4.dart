import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:recess/Utility/AppImages.dart';
import 'package:recess/app_constants/app_pm_standards.dart';
import 'package:recess/controllers/expert/become_expert_step4_controller.dart';

import '../../../Auth/login_options_screen.dart';
import '../../../Utility/app_back_btn.dart';
import '../../../app_constants/app_colors.dart';

class BecomeExpertStep4 extends StatelessWidget {
  BecomeExpertStep4({Key? key}) : super(key: key);

  BecomeExpertStep4Controller controller =
      Get.put(BecomeExpertStep4Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBg,
      appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.appBg,
          title: null,
          leadingWidth: 126,
          leading: AppBackBtn(),
          actions: [
            Container(
              padding:
                  EdgeInsets.only(right: AppPMStandards.shared.leftPadding),
              // color: Colors.brown,
              // height: 60,
              child: InkWell(
                  onTap: () {},
                  child: Text(
                    "Step 4/4",
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Avenir,
                        fs: 14,
                        fontType: AppFont.SemiBold,
                        color: Colors.black),
                  )),
            )
          ]),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.appBg,
          padding: EdgeInsets.only(
              top: 12,
              left: AppPMStandards.shared.leftPadding,
              right: AppPMStandards.shared.leftPadding),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Become an Expert",
                style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Recoleta,
                    fs: 26,
                    fontType: AppFont.Bold,
                    color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                "Add a payment method",
                style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Avenir,
                    fs: 16,
                    fontType: AppFont.SemiBold,
                    color: Colors.black),
              ),
              SizedBox(height: 20),
              Divider(
                thickness: 1,
              ),
              SizedBox(height: 10),
              Text(
                "Recess partners with Stripe, the global payments platform, to give you a comprehensive, simple and secure way to manage your earnings",
                style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Avenir,
                    fs: 14,
                    fontType: AppFont.Medium,
                    color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Connect your Stripe account below, or create a new one to continue.",
                style: GetAppFont.getInstance().addStyle(
                    name: AppFont.Avenir,
                    fs: 14,
                    fontType: AppFont.Medium,
                    color: Colors.black),
              ),
              SizedBox(height: 30),

              Divider(
                thickness: 1,
              ),
              SizedBox(height: 20),
              ListTile(
                contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                leading: SvgPicture.asset(AppImages.stripeIcon),
                title: Text(
                  "Connect Stripe Account",
                  style: GetAppFont.getInstance().addStyle(
                      name: AppFont.Avenir,
                      fs: 14,
                      fontType: AppFont.Medium,
                      color: Colors.black),
                ),
                trailing: SvgPicture.asset(AppImages.forwardIcon),
              ),
              SizedBox(height: 20),
              Divider(height: 1),
              // ListTile(
              //   contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
              //   leading: SvgPicture.asset(AppImages.paypalIcon),
              //   title: Text(
              //     "Connect PayPal Account",
              //     style: GetAppFont.getInstance().addStyle(
              //         name: AppFont.Avenir,
              //         fs: 14,
              //         fontType: AppFont.Medium,
              //         color: Colors.black),
              //   ),
              //   trailing: SvgPicture.asset(AppImages.forwardIcon),
              // ),
              // Divider(height: 1, color: AppColors.txtFillColor),
              // ListTile(
              //   contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
              //   leading: SvgPicture.asset(AppImages.bankIcon),
              //   title: Text(
              //     "Connect Bank Account",
              //     style: GetAppFont.getInstance().addStyle(
              //         name: AppFont.Avenir,
              //         fs: 14,
              //         fontType: AppFont.Medium,
              //         color: Colors.black),
              //   ),
              //   trailing: SvgPicture.asset(AppImages.forwardIcon),
              // ),
              // Divider(height: 1),
              // SizedBox(height: 20),
              // Text.rich(TextSpan(
              //     text: "Note:",
              //     style: GetAppFont.getInstance().addStyle(
              //         name: AppFont.Avenir,
              //         fs: 12,
              //         fontType: AppFont.SemiBold,
              //         color: Colors.black),
              //     children: [
              //       TextSpan(
              //         text:
              //             " A small charge of \$0.01 might be made to your card to verify the payment information",
              //         style: GetAppFont.getInstance().addStyle(
              //             name: AppFont.Avenir,
              //             fs: 12,
              //             fontType: AppFont.Medium,
              //             color: Colors.black),
              //       )
              //     ])),
              SizedBox(height: 40),
              // Divider(height: 1),
              // SizedBox(height: 20),
              Container(
                width: 150,
                child: AppButton(
                    cornerRadius: 5,
                    title: 'Continue',
                    borderColor: Colors.black,
                    backgroundColor: Colors.black,
                    titleColor: Colors.white,
                    isIcon: false,
                    image: '',
                    iconColor: Colors.black,
                    onTap: () {
                      // Get.toNamed(AppRoutes.adminSucessScreen);
                      controller.getAdminResponse();
                    },
                    showPrefixIcon: false,
                    addStandardMargin: false),
              ),
              SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
