import 'dart:async';
import 'dart:ui';

import 'package:core/core.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:intl/intl.dart' as intl;
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:shared/shared.dart';

/// A chunk of methods which can be used to
/// the common operations performed everywhere
/// in the application.
abstract class Utility {
  /// Print debug log.
  ///
  /// [message] : The message which needed to be print.
  static void printDLog(String message) {
    Logger()..d('${StringConstants.appName} $message');
  }

  /// Print info log.
  ///
  /// [message] : The message which needed to be print.
  static void printILog(String message) {
    Logger()..i('${StringConstants.appName} $message');
  }

  /// Print error log.
  ///
  /// [message] : The message which needed to be print.
  static void printELog(String message) {
    Logger()..e('${StringConstants.appName} $message');
  }

  /// Returns [TextDirection.rtl] if the current locale has RTL support.
  static TextDirection isDirectionRTL(String languageCode) {
    if (intl.Bidi.isRtlLanguage(languageCode)) {
      return TextDirection.rtl;
    }
    return TextDirection.ltr;
  }

  /// Returns future bool value depending on the internet
  /// connectivity.
  static Future<bool> isNetworkAvailable() async =>
      await DataConnectionChecker().hasConnection;

  /// Close any open dialog.
  static void closeDialog() {
    if (Get.isDialogOpen ?? false) Get.back<void>();
  }

  /// Show a loading progress indicator
  /// on top of the screen.
  static void showLoadingDialog() {
    closeDialog();
    Get.dialog<void>(
      WillPopScope(
        onWillPop: () async => false,
        child: Align(
          alignment: Alignment.center,
          child: Wrap(
            children: [
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  ColorsValue.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  /// Close any open bottom sheet.
  static void closeBottomSheet() {
    if (Get.isBottomSheetOpen ?? false) Get.back<void>();
  }

  /// Show no internet dialog if there is no
  /// internet available.
  static void showNoInternetDialog() {
    closeDialog();
    Get.dialog<void>(
      Scaffold(
        backgroundColor: Colors.black12,
        body: Padding(
          padding: Dimens.padding15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                StringConstants.noInternet,
                textAlign: TextAlign.center,
                style: Styles.boldWhite23,
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  /// Show an error snack bar.
  ///
  /// [message] : error message.
  static void showError(String message) {
    closeDialog();
    Get.rawSnackbar(
      messageText: Text(
        message,
        style: Styles.white16,
      ),
      mainButton: FlatButton(
        onPressed: () {
          if (Get.isSnackbarOpen) {
            Get.back<void>();
          }
        },
        child: Text(
          StringConstants.okay,
          style: Styles.white14,
        ),
      ),
      backgroundColor: Colors.red,
      margin: Dimens.padding15,
      borderRadius: Dimens.fifteen,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  /// Create the object for classes which are required before the app starts.
  static void createInitialDi() {
    Get..put(RepositoryCalls())..put(UserBloc());
  }

  /// replace unicode from the string
  static String getUnicodeRemoveString(String value) {
    var unescape = HtmlUnescape();
    return unescape.convert(value);
  }

  static void showSuccess(String score) {
    Timer.periodic(
        const Duration(
          seconds: 3,
        ), (Timer timer) {
      Utility.closeBottomSheet();
      timer.cancel();
    });
    Get.bottomSheet<Future<void>>(
      Container(
        color: Colors.transparent,
        height: Dimens.eightyPercent,
        child: Container(
          height: Dimens.eightyPercent,
          padding: Dimens.padding15,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                Dimens.five,
              ),
              topRight: Radius.circular(
                Dimens.five,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Lottie.asset(
                AssetsConstants.congratulation,
                repeat: true,
              ),
              const Spacer(),
              Text(
                StringConstants.yourScore,
                style: Styles.black18,
                textAlign: TextAlign.center,
              ),
              Text(
                '$score / 10',
                style: Styles.boldAppColor80,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ).then((value) {
      Get.back<void>();
    });
  }

  /// Returns a String format date in 12th Nov 1992 format.
  /// Will be using custom suffix for adding th/st/nd and rd to the day of the
  /// date.
  ///
  /// [date] : the date which needs to be formatted.
  static String formatDate(DateTime date) {
    if (date == null) return '';
    var suffix = 'th';
    var digit = date.day % 10;
    if ((digit > 0 && digit < 4) && (date.day < 11 || date.day > 13)) {
      suffix = ['st', 'nd', 'rd'][digit - 1];
    }
    return intl.DateFormat("d'$suffix' MMMM yyyy, hh:mm a").format(date);
  }
}
