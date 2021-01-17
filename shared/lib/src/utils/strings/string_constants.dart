import 'package:get/get.dart';

/// Contains the strings keys used in the application. This is used by the GetX
/// library to get the current locale string value from the translation file.
abstract class StringConstants {
  static String appName = 'Wiki Search';
  static String somethingWentWrong = 'somethingWentWrong'.tr;
  static String noInternet = 'noInternet'.tr;
  static String search = 'search'.tr;
  static String pageNotFound = 'pageNotFound'.tr;
  static String okay = 'okay'.tr;
  static String history = 'history'.tr;
  static String emptyText = 'emptyText'.tr;
}
