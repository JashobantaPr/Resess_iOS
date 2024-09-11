import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utility/text_field_with_header.dart';
import '../../../app_constants/app_colors.dart';

class SearchLearningSessionScreen extends StatelessWidget {
  const SearchLearningSessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        color: AppColors.appBg,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(10),
                child: txtFieldWithheader(
                  showHeader: false,
                  headerTxt: '',
                  hintTxt: 'Search',
                  icon: Icon(Icons.search),
                ))
          ],
        ),
      ),
    );
  }
}
