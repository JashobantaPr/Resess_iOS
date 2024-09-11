import 'package:get/get.dart';
import 'package:recess/Dashboard/home/audio_call.dart';
import 'package:recess/binding/home_binding.dart';
import 'package:recess/binding/main_dashboard_binding.dart';
import 'package:recess/binding/video_call_binding/video_audio_binding.dart';

import '../Dashboard/expert/onboard/verification_success_screen.dart';
import '../Dashboard/home/home_screen.dart';
import '../Dashboard/home/video_call_screen.dart';
import '../Dashboard/main_dashboard_screen.dart';
import '../Dashboard/settings/learningsession/learning_scession_screen.dart';
import '../Dashboard/settings/notification_screen.dart';
import '../binding/expert/admin_status_binding.dart';
import '../binding/settings/learning_session_binding.dart';
import '../binding/settings/notification_settings_binding.dart';
import '../binding/splash_binding.dart';
import '../splash_screen.dart';

class AppRoutes {
  static const String splashScreen = "/splash_screen.dart";
  static const String learningSessionScreen = "/learning_scession_screen.dart";
  static const String homeScreen = "/home_screen.dart";
  static const String mainDashboardScreen = "/main_dashboard_screen.dart";
  static const String adminSucessScreen = "/verification_success_screen.dart";
  static const String videoCallScreen = "/video_call_screen.dart";
  static const String audioCallScreen = "/audio_call.dart";
  static const String notificationScreen = "/notification_screen.dart";

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: learningSessionScreen,
      page: () => LearningSessionScreen(),
      bindings: [
        LearningSessionBinding(),
      ],
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: mainDashboardScreen,
      page: () => MainDashboardScreen(),
      bindings: [
        MainDashboardBinding(),
      ],
    ),
    GetPage(
      name: adminSucessScreen,
      page: () => VerificationScuccessScreen(),
      bindings: [
        AdminStatusBinding(),
      ],
    ),
    GetPage(
      name: videoCallScreen,
      page: () => VideoCall(),
      bindings: [
        VideoAudioBinding(),
      ],
    ),
    GetPage(
      name: audioCallScreen,
      page: () => AudioCall(),
      bindings: [
        VideoAudioBinding(),
      ],
    ),
    GetPage(
        name: notificationScreen,
        page: () => NotificationScreen(),
        bindings: [
          NotificationSettingsBinding(),
        ])
  ];
}
