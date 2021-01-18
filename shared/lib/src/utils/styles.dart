import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared/shared.dart';

/// A chunk of styles used in the application.
abstract class Styles {
  static String baseFontFamily = GoogleFonts.ptSans().fontFamily;

  static RoundedRectangleBorder buttonShapeBorder = RoundedRectangleBorder(
    side: const BorderSide(
      color: Colors.white,
      width: Dimens.one,
      style: BorderStyle.solid,
    ),
    borderRadius: BorderRadius.circular(
      Dimens.fifty,
    ),
  );

  static RoundedRectangleBorder border15 = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(
      Dimens.fifteen,
    ),
  );

  // light theme data
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    accentColorBrightness: Brightness.dark,
    primaryColor: ColorsValue.primaryColor,
    backgroundColor: ColorsValue.backgroundColor,
    primarySwatch: const MaterialColor(
      ColorsValue.primaryColorHex,
      ColorsValue.primaryColorSwatch,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: baseFontFamily,
    textTheme: TextTheme(
      bodyText1: bodyTextLight1,
      bodyText2: bodyTextLight2,
      subtitle1: subtitleLight1,
      subtitle2: subtitleLight2,
      caption: captionLight,
      button: buttonLight,
      headline1: headlineLight1,
      headline2: headlineLight2,
      headline3: headlineLight3,
      headline4: headlineLight4,
      headline5: headlineLight5,
      headline6: headlineLight6,
    ),
    iconTheme: iconThemeData,
    buttonTheme: buttonThemeData,
  );

  // dark theme data
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.light,
    accentColorBrightness: Brightness.dark,
    primaryColor: ColorsValue.primaryColor,
    backgroundColor: ColorsValue.backgroundColor,
    primarySwatch: const MaterialColor(
      ColorsValue.primaryColorHex,
      ColorsValue.primaryColorSwatch,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: baseFontFamily,
    textTheme: TextTheme(
      subtitle1: subtitleDark1,
      subtitle2: subtitleDark2,
      bodyText1: bodyTextDark1,
      bodyText2: bodyTextDark2,
      caption: captionDark,
      button: buttonDark,
      headline1: headlineDark1,
      headline2: headlineDark2,
      headline3: headlineDark3,
      headline4: headlineDark4,
      headline5: headlineDark5,
      headline6: headlineDark6,
    ),
    iconTheme: iconThemeData,
    buttonTheme: buttonThemeData,
  );

  static IconThemeData iconThemeData = const IconThemeData(
    color: Colors.white,
    size: Dimens.eighteen,
  );

  static ButtonThemeData buttonThemeData = ButtonThemeData(
      buttonColor: ColorsValue.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Dimens.fifty,
        ),
      ));

  // Different style used in the application
  // light
  static TextStyle bodyTextLight1 = GoogleFonts.ptSans(
    fontSize: Dimens.fourteen,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
  static TextStyle bodyTextLight2 = GoogleFonts.ptSans(
    fontSize: Dimens.sixTeen,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
  static TextStyle subtitleLight1 = GoogleFonts.ptSans(
    color: ColorsValue.titleGreyColor,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.normal,
  );
  static TextStyle subtitleLight2 = GoogleFonts.ptSans(
    color: ColorsValue.titleGreyColor,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.normal,
  );
  static TextStyle buttonLight = GoogleFonts.ptSans(
    fontWeight: FontWeight.bold,
    fontSize: Dimens.sixTeen,
  );
  static TextStyle captionLight = GoogleFonts.ptSans(
    color: ColorsValue.titleGreyColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
  );
  static TextStyle headlineLight6 = GoogleFonts.ptSans(
    fontSize: Dimens.fourteen,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineLight5 = GoogleFonts.ptSans(
    fontSize: Dimens.sixTeen,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineLight4 = GoogleFonts.ptSans(
    fontSize: Dimens.eighteen,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineLight3 = GoogleFonts.ptSans(
    fontSize: Dimens.twenty,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineLight2 = GoogleFonts.ptSans(
    fontSize: Dimens.twentyTwo,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineLight1 = GoogleFonts.ptSans(
    fontSize: Dimens.twentyFour,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  // dark
  static TextStyle bodyTextDark1 = GoogleFonts.ptSans(
    fontSize: Dimens.fourteen,
    color: Colors.white,
  );
  static TextStyle bodyTextDark2 = GoogleFonts.ptSans(
    fontSize: Dimens.sixTeen,
    color: Colors.white,
  );
  static TextStyle subtitleDark1 = GoogleFonts.ptSans(
    fontSize: Dimens.fourteen,
    color: Colors.white,
  );
  static TextStyle subtitleDark2 = GoogleFonts.ptSans(
    fontSize: Dimens.twelve,
    color: Colors.white,
  );
  static TextStyle buttonDark = GoogleFonts.ptSans(
    fontWeight: FontWeight.bold,
    fontSize: Dimens.sixTeen,
  );
  static TextStyle captionDark = GoogleFonts.ptSans(
    fontSize: Dimens.fourteen,
    color: Colors.black,
  );
  static TextStyle headlineDark6 = GoogleFonts.ptSans(
    fontSize: Dimens.fourteen,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineDark5 = GoogleFonts.ptSans(
    fontSize: Dimens.sixTeen,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineDark4 = GoogleFonts.ptSans(
    fontSize: Dimens.eighteen,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineDark3 = GoogleFonts.ptSans(
    fontSize: Dimens.twenty,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineDark2 = GoogleFonts.ptSans(
    fontSize: Dimens.twentyTwo,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineDark1 = GoogleFonts.ptSans(
    fontSize: Dimens.twentyFour,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle boldAppColor16 = GoogleFonts.ptSans(
    fontWeight: FontWeight.bold,
    color: ColorsValue.primaryColor,
    fontSize: Dimens.sixTeen,
  );

  static TextStyle boldWhite16 = GoogleFonts.ptSans(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: Dimens.sixTeen,
  );

  static TextStyle boldWhite23 = GoogleFonts.ptSans(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: Dimens.twentyThree,
  );

  static TextStyle signPainterHS64White = const TextStyle(
    color: Colors.white,
    fontSize: Dimens.sixtyFour,
    fontFamily: 'SignPainterRegular',
  );

  static TextStyle white16 = GoogleFonts.ptSans(
    color: Colors.white,
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle lightGrey18 = GoogleFonts.ptSans(
    color: ColorsValue.lightGreyColor,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle white12 = GoogleFonts.ptSans(
    color: Colors.white,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.normal,
  );

  static TextStyle white12Underline = GoogleFonts.ptSans(
    color: Colors.white,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.underline,
  );

  static TextStyle white14 = GoogleFonts.ptSans(
    color: Colors.white,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle blackBold15 = GoogleFonts.ptSans(
    color: Colors.black,
    fontSize: Dimens.fifteen,
    fontWeight: FontWeight.bold,
  );

  static TextStyle grey14 = GoogleFonts.ptSans(
    color: ColorsValue.greyColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle orange16 = GoogleFonts.ptSans(
    color: ColorsValue.orangeColor,
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle orange14 = GoogleFonts.ptSans(
    color: ColorsValue.orangeColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle appColor18 = GoogleFonts.ptSans(
    color: ColorsValue.primaryColor,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle appColor14 = GoogleFonts.ptSans(
    color: ColorsValue.primaryColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle boldBlack36 = GoogleFonts.ptSans(
    color: Colors.black,
    fontSize: Dimens.thirtySix,
    fontWeight: FontWeight.bold,
  );

  static TextStyle boldBlack28 = GoogleFonts.ptSans(
    color: Colors.black,
    fontSize: Dimens.twentyEight,
    fontWeight: FontWeight.bold,
  );

  static TextStyle boldAppColor36 = GoogleFonts.ptSans(
    color: ColorsValue.primaryColor,
    fontSize: Dimens.thirtySix,
    fontWeight: FontWeight.bold,
  );

  static TextStyle black18 = GoogleFonts.ptSans(
    color: Colors.black,
    fontSize: Dimens.eighteen,
  );

  static TextStyle grey16 = GoogleFonts.ptSans(
    color: ColorsValue.greyColor,
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle boldAppColor30 = GoogleFonts.ptSans(
    fontWeight: FontWeight.bold,
    color: ColorsValue.primaryColor,
    fontSize: Dimens.thirty,
  );

  static TextStyle boldWhite30 = GoogleFonts.ptSans(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: Dimens.thirty,
  );

  static TextStyle boldWhite150 = GoogleFonts.ptSans(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: Dimens.oneHundredFifty,
  );

  static TextStyle boldBlack26 = GoogleFonts.ptSans(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: Dimens.twentySix,
  );

  static TextStyle boldBlack22 = GoogleFonts.ptSans(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: Dimens.twentyTwo,
  );

  static TextStyle black12 = GoogleFonts.ptSans(
    color: Colors.black,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.normal,
  );

  static TextStyle appColor10 = GoogleFonts.ptSans(
    color: ColorsValue.primaryColor,
    fontSize: Dimens.ten,
    fontWeight: FontWeight.normal,
  );

  static TextStyle white10 = GoogleFonts.ptSans(
    color: Colors.white,
    fontSize: Dimens.ten,
    fontWeight: FontWeight.normal,
  );

  static var outlineBorderRadius50 = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        Dimens.fifty,
      ),
    ),
    borderSide: BorderSide.none,
  );

  static var outlineBorderRadius15 = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        Dimens.fifteen,
      ),
    ),
    borderSide: BorderSide.none,
  );
}

/// A chunks of colors used
/// in the application
abstract class ColorsValue {
  static const Map<int, Color> primaryColorSwatch = {
    50: Color.fromRGBO(29, 49, 158, .1),
    100: Color.fromRGBO(29, 49, 158, .2),
    200: Color.fromRGBO(29, 49, 158, .3),
    300: Color.fromRGBO(29, 49, 158, .4),
    400: Color.fromRGBO(29, 49, 158, .5),
    500: Color.fromRGBO(29, 49, 158, .6),
    600: Color.fromRGBO(29, 49, 158, .7),
    700: Color.fromRGBO(29, 49, 158, .8),
    800: Color.fromRGBO(29, 49, 158, .9),
    900: Color.fromRGBO(29, 49, 158, 1),
  };

  static const Color primaryColorRgb = Color.fromRGBO(29, 49, 158, 1);

  static const Color primaryColorLight1Rgbo = Color.fromRGBO(29, 49, 158, .1);

  static const Color primaryColor = Color(
    primaryColorHex,
  );

  static const Color facebookColor = Color(
    facebookColorHex,
  );

  static const Color orangeColor = Color(
    orangeColorHex,
  );

  static const Color greyColor = Color(
    greyColorHex,
  );

  static const Color lightGreyColor = Color(
    lightGreyColorHex,
  );

  static const Color lightGreyColor1 = Color(
    lightGreyColor1Hex,
  );

  static const Color lightGreyColor2 = Color(
    lightGreyColor2Hex,
  );

  static const Color titleGreyColor = Color(
    titleGreyColorHex,
  );

  static Color backgroundColor = Colors.white;

  static const int primaryColorHex = 0xFF1D319E;

  static const int white70 = 0x701D319E;

  static const int orangeColorHex = 0xFFFDBB5E;

  static const int facebookColorHex = 0xFF4084EF;

  static const int greyColorHex = 0xFF9BA3B7;

  static const int lightGreyColor1Hex = 0xFFE2E2E2;

  static const int lightGreyColorHex = 0xFFE1E1E8;

  static const int titleGreyColorHex = 0xFFB2AEAE;

  static const int lightGreyColor2Hex = 0xFFFAFAFA;

  static const Color transparent = Color.fromARGB(0, 255, 255, 255);

  static const Color white = Color.fromARGB(255, 255, 255, 255);
}