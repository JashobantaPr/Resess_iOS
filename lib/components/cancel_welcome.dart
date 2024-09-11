import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Utility/AppImages.dart';
import '../Utility/app_routes.dart';

class CancelWelcomeHeader extends StatelessWidget {
  bool? showBack;
  CancelWelcomeHeader({super.key, this.showBack = true});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          IconButton(
              onPressed: () {
                AppRoute.pushAndRemoveUntil(AppRouteName.homeScreen);
              },
              icon: SvgPicture.asset(AppImages.xmarkIcon))
        ]);
  }
}
