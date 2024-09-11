import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:recess/Auth/login_options_screen.dart';
import 'package:recess/Dashboard/expert/onboard/expert_screen.dart';
import 'package:recess/Dashboard/main_dashboard_screen.dart';

class AppRoute {
  static Future? go(String routeName,
      {dynamic arguments, bool preventDuplicates = true}) =>
      Get.toNamed(
        routeName,
        arguments: arguments,
        preventDuplicates: preventDuplicates,
      );

  static void pop() => Get.back();

  static void pushAndRemoveUntil(
      String name, {
        dynamic arguments,
      }) =>
      Get.offAllNamed(
        name,
        arguments: arguments,
      );
}

class AppRouteName {
  static const String splashScreen = '/splash_screen',
      loginScreen = '/login_screen',
      homeScreen = '/home_screen',
      welcomeScreen = '/welcome_screen',
      homeWorkScreen = '/home_work_screen',
      forgotPassword = '/forgot_password',
      dailyAssignment = '/daily_assignment',
      expertScreen = '/expert';
  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: homeScreen,
      page: () => MainDashboardScreen(),
    ),
    GetPage(
      name: expertScreen,
      page: () => ExpertScreen(),
    ),
  ];
}