import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:quizee/src/views/views.dart';
import 'package:shared/shared.dart';
import 'package:get/get.dart';

/// The initial page which will be shown when
/// the application starts.
class SplashScreen extends StatelessWidget {
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: ColorsValue.primaryColor,
        body: Center(
          child: TypewriterAnimatedTextKit(
            totalRepeatCount: 1,
            speed: const Duration(milliseconds: 200),
            text: [
              StringConstants.appName,
            ],
            repeatForever: false,
            textStyle: Styles.boldWhite30,
            onFinished: () {
              if (Get.find<CommonInterface>().isUserLoggedIn()) {
                RouteManagement.goToHome();
              } else {
                RouteManagement.goToLogin();
              }
            },
          ),
    ),
      );
}
