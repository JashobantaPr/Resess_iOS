import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:recess/binding/initial_binding.dart';
import 'package:recess/controllers/auth/enter_email_controller.dart';

import 'package:recess/routes/app_routes.dart';

import 'package:responsive_design/responsive_design.dart';

import 'Utility/decorated_input_border.dart';
import 'Utility/get_prefs.dart';
import 'controllers/auth/create_password_controller.dart';
import 'controllers/settings/favourites_subjects_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await GetPrefs.init();

  initializeDateFormatting('en');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? apnsToken = await messaging.getAPNSToken();

  if (apnsToken != null || Platform.isAndroid) {
    String? fcmToken = await messaging.getToken();
    print("FCM Token: $fcmToken");
  } else {
    print("APNS token not available yet.");
  }

  ResponsiveSettings.instance.setCustomSettings(
    screenChangePoints: const ScreenChangePoints(
      desktopChangePoint: 1150.0,
      tabletChangePoint: 625.0,
      watchChangePoint: 250.0,
    ),
  );

  Get.put(EnterEmailController());
  Get.put(CreatePasswordController());
  Get.put(FavouritesExpertController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'recess',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff181818)),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          border: DecoratedInputBorder(
            child: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
            shadow: const BoxShadow(
              color: Colors.blue,
              blurRadius: 15,
            ),
          ),
        ),
      ),
      initialBinding: InitialBinding(),
      initialRoute: AppRoutes.splashScreen,
      getPages: AppRoutes.pages,
    );
  }
}
