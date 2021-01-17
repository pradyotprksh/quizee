import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';

/// A screen which will be shown when the selected route is not found.
class PageNotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Get.theme.backgroundColor,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: TextLiquidFill(
              boxHeight: double.infinity,
              boxWidth: double.infinity,
              text: StringConstants.pageNotFound,
              boxBackgroundColor: ColorsValue.primaryColor,
              textStyle: Styles.boldWhite150,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
}
