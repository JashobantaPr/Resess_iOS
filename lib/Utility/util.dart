import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class Util {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  static Future<String?> getDeviceId() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;
      return info.id;
    }
    return null;
  }
}
