import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recess/Auth/welcome_screen.dart';

import '../../Auth/enter_email_screen.dart';
import '../../Utility/get_prefs.dart';
import '../../models/complete_onboard_model.dart';
import '../../network/networking_client.dart';
import '../../network_services/api_end_points.dart';
import '../../network_services/app_consts.dart';

class LoginOptionsController extends GetxController {
  Rx<LoadingState> loadingState = LoadingState.Loading.obs;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    var userDetails =
        await FirebaseAuth.instance.signInWithCredential(credential);

    userDetails?.user != null
        ? socialLogin('google', userDetails)
        : Get.snackbar("Login Error", "Google Sign in issue");

    return userDetails;
  }

  Future<UserCredential> signInWithApple() async {
    await FirebaseAuth.instance.signOut();
    //Make sure we store the details at first signin else will not get data.
    final appleProvider = AppleAuthProvider();
    appleProvider.addScope('email');
    appleProvider.addScope('name');

    if (kIsWeb) {
      var userDetails =
          await FirebaseAuth.instance.signInWithPopup(appleProvider);
      userDetails?.user != null
          ? Get.to(() =>
              WelcomeScreen(userName: userDetails.user?.displayName ?? ""))
          : Get.snackbar("Login Error", "Google Sign in issue");
      return userDetails;
    } else {
      var userDetails =
          await FirebaseAuth.instance.signInWithProvider(appleProvider);
      userDetails?.user != null
          ? socialLogin('apple', userDetails)
          : Get.snackbar("Login Error", "Google Sign in issue");
      return userDetails;
    }
  }

  Future socialLogin(String platform, UserCredential userDetails) async {
    //  Call email signup api
    loadingState.value = LoadingState.Loading;

    String email = userDetails?.user?.email ?? "";
    if (email.isEmpty) {
      email = "email";
    }

    String name = userDetails?.user?.displayName ?? "";
    if (name.isEmpty) {
      const _chars =
          'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
      Random _rnd = Random();

      String getRandomString(int length) =>
          String.fromCharCodes(Iterable.generate(
              length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
      name = "platform${getRandomString(9)}";
    }

    final response =
        await DioClient.instance.post(ApiEndpoints.socialLogin, data: {
      "email": email,
      "fullName": name,
      "platform": platform,
      "userDetails": {
        "platformId": userDetails?.user?.uid ?? "",
        "name": userDetails?.user?.displayName ?? "",
        "imageUrl": userDetails?.user?.photoURL ?? ""
      }
    });

    print(response.toString());
    try {
      var resp = CompleteOnboardModel.fromJson(response);

      if (resp.response?.status == true) {
        print('Response, ${resp.response?.message}!');
        loadingState.value = LoadingState.Loaded;
        GetPrefs.setBool(GetPrefs.isLoggedIn, true);
        GetPrefs.setString(AppConst.userId, resp.data?.user?.fullName ?? "");
        GetPrefs.setString(AppConst.email, resp.data?.user?.email ?? "");
        GetPrefs.setString(AppConst.userName, resp.data?.user?.fullName ?? "");
        GetPrefs.setString(
            AppConst.token, resp.data?.tokens?.accessToken ?? "");
        GetPrefs.setString(AppConst.userType, platform);

        Get.to(() => WelcomeScreen(userName: resp.data?.user?.fullName ?? ""));
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
      loadingState.value = LoadingState.Loaded;
    }
  }
}
