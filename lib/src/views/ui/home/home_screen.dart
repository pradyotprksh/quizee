import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The main home screen which will be shown for the authenticated users.
class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Get.theme.backgroundColor,
    );
}
