import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/app_constants/app_pm_standards.dart';
import 'package:recess/components/cancel_back_header.dart';
import 'package:recess/controllers/auth/email_verification_controller.dart';

import '../app_constants/app_colors.dart';

class VerifyEmailScreen extends StatefulWidget {
  String email = '';

  VerifyEmailScreen({required this.email});

  EmailVerificationController controller =
      Get.put(EmailVerificationController());

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  void initState() {
    //  widget.textEditingController.text = widget.otp ?? "";

    // //to be removed
    // widget.controller.otp.value = widget.otp ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.grey,
        // appBar: AppBar(
        //   backgroundColor: AppColors.grey,
        //   title: null,
        //   leadingWidth: 30,
        //   leading: AppBackBtn(),
        //   automaticallyImplyLeading: false,
        //   // actions: [
        //   //   Container(
        //   //     padding: EdgeInsets.only(right: 33),
        //   //     child: Text(
        //   //       "Step 2/4",
        //   //       style: GetAppFont.getInstance().addStyle(
        //   //           name: AppFont.Avenir,
        //   //           fs: 14,
        //   //           fontType: AppFont.SemiBold,
        //   //           color: Colors.black),
        //   //     ),
        //   //   )
        //   // ],
        // ),
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.grey,
          toolbarHeight: 30,
          leading: null,
          automaticallyImplyLeading: false,
        ),
        body: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: AppColors.newGrey,
              boxShadow: [
                BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: Offset(0, -4),
                    color: Colors.black.withOpacity(0.25))
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            padding: EdgeInsets.only(
                top: 28,
                left: AppPMStandards.shared.leftPadding,
                right: AppPMStandards.shared.leftPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CancelBackHeader(),
                SizedBox(height: 20),
                SizedBox(
                  height: 49,
                  child: Text(
                    'Verify your email',
                    style: GetAppFont.getInstance().addStyle(
                        name: AppFont.Recoleta,
                        fs: 26,
                        fontType: AppFont.Bold,
                        color: Colors.black),
                  ),
                ),
                Text(
                  'Enter the code we’ve sent to ${widget.email}',
                  style: GetAppFont.getInstance().addStyle(
                      height: 2,
                      name: AppFont.Avenir,
                      fs: 13,
                      fontType: AppFont.Medium,
                      color: Colors.black),
                ),

                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: 'Change email',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.back(),
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontFamily: 'avenir',
                          fontWeight: FontWeight.bold,
                          fontSize: 13))
                ])),
                SizedBox(height: 20),
                Text(
                  'Enter code',
                  style: GetAppFont.getInstance()
                      .addStyle(
                          name: AppFont.Avenir,
                          fs: 13,
                          fontType: AppFont.Medium,
                          color: Colors.black)
                      .copyWith(
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 1.0), // Position of the shadow
                        blurRadius: 3.0, // Blur effect of the shadow
                        color: Colors.grey.withOpacity(
                            0.5), // Color and opacity of the shadow
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                // OTPTextField(
                //     isDense: false,
                //     controller: otpController,
                //     length: 6,
                //     width: MediaQuery.of(context).size.width,
                //     textFieldAlignment: MainAxisAlignment.spaceAround,
                //     fieldWidth: 45,
                //     fieldStyle: FieldStyle.box,
                //     outlineBorderRadius: 1,
                //     style: TextStyle(fontSize: 17),
                //     onChanged: (pin) {
                //       print("Changed: " + pin);
                //     },
                //     onCompleted: (pin) {
                //       print("Completed: " + pin);
                //     }),

                PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: AppColors.txtFillColor,
                    fontWeight: FontWeight.bold,
                  ),
                  autoUnfocus: true,
                  length: 6,
                  obscureText: false,
                  // obscuringCharacter: '*',
                  // obscuringWidget: const FlutterLogo(
                  //   size: 24,
                  // ),
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length < 3) {
                      return "";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(4),
                    fieldHeight: 40,
                    fieldWidth: 40,
                    activeBorderWidth: 1,
                    activeFillColor: AppColors.txtFillColor,
                    activeColor: AppColors.txtFillColor,
                    inactiveColor: AppColors.txtFillColor,
                    inactiveFillColor: AppColors.txtFillColor,
                    selectedFillColor: AppColors.txtFillColor,
                    selectedColor: AppColors.txtFillColor,
                    errorBorderWidth: 0,
                    inactiveBorderWidth: 6,
                    inActiveBoxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                    activeBoxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  enablePinAutofill: false,
                  // errorAnimationController: errorController,
                  controller: widget.controller.textEditingController,
                  keyboardType: TextInputType.number,
                  onCompleted: (v) {
                    // debugPrint("Completed");
                    // widget.controller.otp.value = v;
                  },
                  // onTap: () {
                  //   print("Pressed");
                  // },
                  onChanged: (value) {
                    debugPrint(value);
                    // setState(() {
                    //   currentText = value;
                    // });
                  },
                  beforeTextPaste: (text) {
                    debugPrint("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),
                Obx(() => Text(
                      widget.controller.errorMessage.value,
                      style: TextStyle(color: Colors.red),
                    )),

                Container(
                  width: 150,
                  margin: EdgeInsets.only(top: 20),
                  child: AppButton(
                      cornerRadius: 10,
                      leftIcon: Icons.add,
                      title: 'Continue',
                      borderColor: Colors.transparent,
                      backgroundColor: Colors.black,
                      titleColor: Colors.white,
                      isIcon: false,
                      image: '',
                      iconColor: Colors.transparent,
                      onTap: () {
                        // widget.controller.continueTapped(widget.email);
                        widget.controller.otpVerify();
                      },
                      showPrefixIcon: false,
                      addStandardMargin: false),
                ),
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            margin:
                                EdgeInsets.only(left: 0, right: 0, bottom: 50),
                            child: Row(children: [
                              Flexible(
                                fit: FlexFit.loose,
                                child: Text.rich(TextSpan(
                                    text: "Didn’t get a code?",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        widget.controller.resendOtp();
                                      },
                                    style: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontFamily: 'avenir',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600))),
                                // child: Text(
                                //     softWrap: false,
                                //     'We won’t share this information with anyone \n and it will remain confidential'),
                              ),
                              Spacer(),
                              Text(
                                "Step 2/4",
                                style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )
                            ]))))
                // CustomInputTextField(hint: 'Enter here', prefixImage: '', showPrefix: false, suffixImage: '', showSuffix: false, isIcon: false, iconData: null,)
              ],
            ),
          ),
        ));
  }
}
