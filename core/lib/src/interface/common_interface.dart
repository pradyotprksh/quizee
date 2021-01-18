import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// A controller which will be used to handle the basic
/// operations in the application. This will be used to separate the UI related
/// work like controllers, permission and etc.
class CommonInterface extends GetxController {
  /// This is used for internet change listener
  StreamSubscription _streamSubscription;

  @override
  void onInit() {
    _checkForInternetConnectivity();
    super.onInit();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  /// Starts the check for internet connectivity. If there is no connection
  /// with the internet a text message will be shown. If the application
  /// is not able to connect to the internet even if the connection is available
  /// will ask the user to check the internet permission.
  void _checkForInternetConnectivity() {
    _streamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result != ConnectivityResult.none) {
        Utility.closeDialog();
      } else {
        Utility.showNoInternetDialog();
      }
    });
  }

  /// Check if the user is logged in or not. Returns true if user is available.
  bool isUserLoggedIn() => FirebaseAuth.instance.currentUser != null;
}
