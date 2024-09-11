import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
class Responsive{
  static width(double p,BuildContext context)
  {
    return MediaQuery.of(context).size.width*(p/100);
  }
  static height(double p,BuildContext context)
  {
    return MediaQuery.of(context).size.height*(p/100);
  }
  static getSize(BuildContext context) {

    if (MediaQuery.of(context).size.width >= 1150.0) {
      return ScreenSize.desktop;
    } else if (MediaQuery.of(context).size.width < 1150.0 && MediaQuery.of(context).size.width >= 625.0) {
      return ScreenSize.tab;
    } else if (kIsWeb && MediaQuery.of(context).size.width < 480.0) {
      return ScreenSize.kMobile;
    } else {
      return ScreenSize.mobile;
    }
    // tabletChangePoint: 625.0,
    // watchChangePoint: 250.0,
    // return ScreenSize.mobile;
    // return ScreenSize.tab;
    // return ScreenSize.desktop;
  }
}

enum ScreenSize{
  mobile,tab,desktop,kMobile
}