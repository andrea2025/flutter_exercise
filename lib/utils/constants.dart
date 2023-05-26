
// Colors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


bool isEmail(String? email) {
  if (email == null || email.isEmpty) {
    return false;
  } else {
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = RegExp(p);

    return regExp.hasMatch(email);
  }
}


// Spacing
const double kPadding = 5;
const double kSmallPadding = 10;
const double kRegularPadding = 15;
const double kMediumPadding = 20;
const double kMacroPadding = 30;
const double kLargePadding = 40;
const double kFullPadding = 60;
const double kSupremePadding = 100;

const double kWidthRatio = 0.9;
const double kIconSize = 24;

const Color kPrimaryBlack = Color(0xff1C1D1F);
const Color kPrimaryGrey = Color(0xff868A90);
const Color kPrimaryWhite = Colors.white;
const Color kLightGreen = Color(0xffF7FFF3);
const Color darkGreen = Color(0xff3E6F26);
const Color mediumGreen = Color(0xff67A948);
const Color kWine = Color(0xff2E0507);
const Color kPink = Color(0xffFCDDEC);



const Color kTransparent = Colors.transparent;





// Border
const double kBorderWidth = 1;
const double kThickBorderWidth = 3;
const BorderRadius kBorderRadius = BorderRadius.all(Radius.circular(kPadding));
const BorderRadius kBorderSmallRadius =
BorderRadius.all(Radius.circular(kSmallPadding));
const BorderRadius kBorderMidRadius =
BorderRadius.all(Radius.circular(kRegularPadding));
const BorderRadius kFullBorderRadius = BorderRadius.all(Radius.circular(100));

BorderRadius kBoxRadius(double size) => BorderRadius.all(Radius.circular(size));

BoxDecoration kTextFieldBoxDecoration = const BoxDecoration(
    borderRadius: kBorderRadius, border: null, color: Colors.white);
BoxDecoration kBottomSheetBoxDecoration = const BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(25.0),
    topRight: Radius.circular(25.0),
  ),
);

InputBorder borderDesign = const OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.blueGrey,
  ),
);

InputBorder errorBorderDesign = const OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.red,
  ),
);

BoxShadow kBoxShadow(Color color) => BoxShadow(
  color: color,
  spreadRadius: 5,
  blurRadius: 7,
  offset: Offset(0, 2), // changes position of shadow
);

BoxShadow kBoxShadowMid(Color color) => BoxShadow(
  color: color,
  spreadRadius: 2,
  blurRadius: 4,
  offset: Offset(0, 5), // changes position of shadow
);

BoxShadow kBoxShadowCondensed(Color color) => BoxShadow(
  color: color,
  spreadRadius: 1,
  blurRadius: 1,
  offset: Offset(0, 3), // changes position of shadow
);

// Text
TextStyle kHeadline1TextStyle = const TextStyle(
  fontFamily: "Gilroy",
  fontWeight: FontWeight.w800,
  color: kPrimaryBlack,
  height: 1.3,
  fontSize: 26,
);

TextStyle kHeadline2TextStyle = const TextStyle(
  fontFamily: "Gilroy",
  fontWeight: FontWeight.w700,
  color: kPrimaryBlack,
  height: 1.2,
  fontSize: 24,
);
TextStyle kHeadline3TextStyle = const TextStyle(
  fontFamily: "Gilroy",
  fontWeight: FontWeight.w600,
  color: kPrimaryBlack,
  fontSize: 22,
);

TextStyle kHeadline4TextStyle = const TextStyle(
  fontFamily: "Gilroy",
  fontWeight: FontWeight.w500,
  color: kPrimaryBlack,
  fontSize: 20,
);

TextStyle kBodyText1Style = const TextStyle(
  fontFamily: "Gilroy",
  fontWeight: FontWeight.w500,
  color: kPrimaryBlack,
  fontSize: 18,
);

TextStyle kBodyText2Style = const TextStyle(
  fontFamily: "Gilroy",
  fontWeight: FontWeight.w400,
  color: kPrimaryGrey,
  fontSize: 16,
);

TextStyle kSubtitle1Style = const TextStyle(
  fontFamily: "Gilroy",
  fontWeight: FontWeight.w300,
  color: kPrimaryGrey,
  fontSize: 14,
);

TextStyle kSubtitle2Style = const TextStyle(
  fontFamily: "Gilroy",
  fontWeight: FontWeight.w300,
  color: kPrimaryGrey,
  fontSize: 13,
);

TextStyle kSubtitle3Style = const TextStyle(
  fontFamily: "Gilroy",
  fontWeight: FontWeight.w200,
  color: kPrimaryGrey,
  fontSize: 12,
);

ThemeData kThemeData = ThemeData.light().copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: kPrimaryWhite,
  iconTheme: const IconThemeData(size: 20, color: mediumGreen),
  dividerColor: Colors.transparent,
  primaryColor: mediumGreen,
  secondaryHeaderColor: Colors.green,
  highlightColor: Colors.green,
  canvasColor: kPrimaryWhite,
  backgroundColor: kPrimaryWhite,
  textSelectionTheme: const TextSelectionThemeData(
    selectionHandleColor: Colors.green,
    cursorColor: mediumGreen,
    selectionColor: Colors.green,
  ),
  dialogBackgroundColor: mediumGreen,
  appBarTheme: AppBarTheme(
    color: Colors.green,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    elevation: 0,
    iconTheme: const IconThemeData(size: 20, color: mediumGreen),
    titleTextStyle: kBodyText1Style,
  ),
  textTheme: TextTheme(
    headlineLarge: kHeadline1TextStyle,
    headlineMedium: kHeadline2TextStyle,
    headlineSmall: kHeadline3TextStyle,
    bodyLarge: kHeadline4TextStyle,
    bodyMedium: kBodyText1Style,
    bodySmall: kBodyText2Style,
    titleLarge: kSubtitle1Style,
    titleMedium: kSubtitle2Style,
    titleSmall: kSubtitle3Style,
  ),
);

ThemeData kThemeDataDark = ThemeData.dark().copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: mediumGreen,
  iconTheme: const IconThemeData(size: 20, color: kPrimaryWhite),
  dividerColor: Colors.transparent,
  primaryColor: mediumGreen,
  canvasColor: kPrimaryWhite,
  highlightColor: kPrimaryGrey,
  secondaryHeaderColor: kPrimaryWhite,
  textSelectionTheme: const TextSelectionThemeData(
    selectionHandleColor: Colors.green,
    cursorColor: mediumGreen,
    selectionColor: Colors.green,
  ),
  dialogBackgroundColor: mediumGreen,
  appBarTheme: AppBarTheme(
    color: mediumGreen,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    elevation: 0,
    iconTheme: const IconThemeData(size: 20, color: kPrimaryWhite),
    titleTextStyle: kBodyText1Style.copyWith(color: kPrimaryWhite),
  ),
  textTheme: TextTheme(
    headlineLarge: kHeadline1TextStyle.copyWith(color: kPrimaryWhite),
    headlineMedium: kHeadline2TextStyle.copyWith(color: kPrimaryWhite),
    headlineSmall: kHeadline3TextStyle.copyWith(color: kPrimaryWhite),
    bodyLarge: kHeadline4TextStyle.copyWith(color: kPrimaryWhite),
    bodyMedium: kBodyText1Style.copyWith(color: kPrimaryWhite),
    bodySmall: kBodyText2Style.copyWith(color: kPrimaryWhite),
    titleLarge: kSubtitle1Style.copyWith(color: kPrimaryWhite),
    titleMedium: kSubtitle2Style.copyWith(color: kPrimaryWhite),
    titleSmall: kSubtitle3Style.copyWith(color: kPrimaryWhite),
  ),
);
