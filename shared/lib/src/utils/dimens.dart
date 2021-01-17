import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Contains the dimensions and padding used
/// all over the application.
abstract class Dimens {
  static const double sixTeen = 16;
  static const double three = 3;
  static const double zero = 0;
  static const double eighteen = 18;
  static const double thirtySix = 36;
  static const double twentyEight = 28;
  static const double six = 6;
  static const double twentyTwo = 22;
  static const double fifty = 50;
  static const double one = 1;
  static const double twentyFour = 24;
  static const double twentyThree = 23;
  static const double thirtyNine = 39;
  static const double twentyFive = 25;
  static const double thirty = 30;
  static const double eighty = 80;
  static const double pointFive = 0.5;
  static const double twentySix = 26;
  static const double sixtyFour = 64;
  static const double twenty = 20;
  static const double ten = 10;
  static const double five = 5;
  static const double fifteen = 15;
  static const double four = 4;
  static const double two = 2;
  static const double fourteen = 14;
  static const double twelve = 12;
  static const double thirtyTwo = 32;
  static const double thirtyFive = 35;
  static const double fourty = 40;
  static const double thirtyFour = 34;
  static const double seven = 7;
  static const double ninetyEight = 98;
  static const double fiftyFive = 55;
  static const double hundred = 100;
  static const double oneHundredFifty = 150;
  static const double oneHundredTwenty = 120;
  static double eighteenPercent = Get.height * 0.18;
  static double thirtyPercent = Get.height * 0.3;
  static double twelvePercent = Get.height * 0.12;
  static double fourteenPercent = Get.height * 0.14;
  static double zeroSixtyFivePercent = Get.height * 0.065;
  static double fifteenPercent = Get.height * 0.15;
  static double fiftyPercent = Get.height * 0.5;
  static double twoPercent = Get.height * 0.2;
  static double fourtyNinePercent = Get.height * 0.49;
  static const EdgeInsets padding24_0_24_10 = EdgeInsets.fromLTRB(
    twentyFour,
    zero,
    twentyFour,
    ten,
  );
  static const EdgeInsets padding24_0_24_0 = EdgeInsets.fromLTRB(
    twentyFour,
    zero,
    twentyFour,
    zero,
  );
  static const EdgeInsets margin0_10_0_0 = EdgeInsets.fromLTRB(
    zero,
    ten,
    zero,
    zero,
  );
  static const EdgeInsets padding20_0_20_0 = EdgeInsets.fromLTRB(
    twenty,
    zero,
    twenty,
    zero,
  );
  static const EdgeInsets padding20_0_20_20 = EdgeInsets.fromLTRB(
    twenty,
    zero,
    twenty,
    twenty,
  );
  static const EdgeInsets padding20_120_20_50 = EdgeInsets.fromLTRB(
    twenty,
    oneHundredTwenty,
    twenty,
    fifty,
  );
  static const EdgeInsets padding24_0_40_34 = EdgeInsets.only(
    left: fourty,
    right: fourty,
    bottom: thirtyFour,
  );
  static const EdgeInsets padding0_30_0_50 =
      EdgeInsets.only(bottom: fifty, top: thirty);
  static const EdgeInsets padding30_0_30_30 = EdgeInsets.only(
    left: thirty,
    right: thirty,
    bottom: thirty,
  );
  static const EdgeInsets padding40_0_40_0 = EdgeInsets.only(
    left: fourty,
    right: fourty,
  );
  static const EdgeInsets padding50_0_50_0 = EdgeInsets.only(
    left: fifty,
    right: fifty,
  );
  static const EdgeInsets padding15 = EdgeInsets.all(
    fifteen,
  );
  static const EdgeInsets padding5 = EdgeInsets.all(
    five,
  );
  static const EdgeInsets padding40 = EdgeInsets.all(
    fourty,
  );
  static const EdgeInsets padding50_30_50_0 = EdgeInsets.only(
    left: fifty,
    right: fifty,
    top: thirty,
  );
  static const EdgeInsets padding10_0_10_5 = EdgeInsets.only(
    left: ten,
    right: ten,
    bottom: five,
  );
  static const EdgeInsets padding16 = EdgeInsets.all(
    sixTeen,
  );
  static const EdgeInsets padding20 = EdgeInsets.all(
    twenty,
  );
  static const EdgeInsets paddingBottom20 = EdgeInsets.only(
    bottom: twenty,
  );
  static const SizedBox boxHeight10 = SizedBox(
    height: ten,
  );
  static const SizedBox boxHeight32 = SizedBox(
    height: thirtyTwo,
  );
  static const SizedBox boxHeight35 = SizedBox(
    height: thirtyFive,
  );
  static const SizedBox boxHeight16 = SizedBox(
    height: sixTeen,
  );
  static const SizedBox boxHeight30 = SizedBox(
    height: thirty,
  );
  static const SizedBox boxWidth12 = SizedBox(
    width: twelve,
  );
  static const SizedBox boxWidth10 = SizedBox(
    width: ten,
  );
  static const SizedBox boxHeight20 = SizedBox(
    height: twenty,
  );
  static const SizedBox boxHeight25 = SizedBox(
    height: twentyFive,
  );
  static const SizedBox boxHeight15 = SizedBox(
    height: fifteen,
  );
  static const SizedBox boxHeight26 = SizedBox(
    height: twentySix,
  );
  static const SizedBox box0 = SizedBox(
    height: zero,
    width: zero,
  );
}
