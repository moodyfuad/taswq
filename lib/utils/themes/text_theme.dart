import 'package:flutter/material.dart';
import 'package:taswq/utils/constants/colors.dart';

class XTextTheme {
  XTextTheme._();

  static const TextTheme light = TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Tajawal',
      fontSize: 40,
      fontWeight: FontWeight.w700,
      color: XColors.lumenIndigo,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Tajawal',
      fontSize: 35,
      fontWeight: FontWeight.w700,
      color: XColors.lumenIndigo,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Tajawal',
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: XColors.lumenIndigo,
    ),
    // headlineLarge: TextStyle(
    //   fontFamily: 'Tajawal',
    //   fontSize: 28,
    //   fontWeight: FontWeight.w700,
    //   color: XColors.lumenIndigo,
    // ),
    // headlineMedium: TextStyle(
    //   fontFamily: 'Tajawal',
    //   fontSize: 25,
    //   fontWeight: FontWeight.w700,
    //   color: XColors.lumenIndigo,
    // ),
    // headlineSmall: TextStyle(
    //   fontFamily: 'Tajawal',
    //   fontSize: 20,
    //   fontWeight: FontWeight.w700,
    //   color: XColors.lumenIndigo,
    // ),
    titleLarge: TextStyle(
      fontFamily: 'Tajawal',
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: XColors.primaryText,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Tajawal',
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: XColors.primaryText,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Tajawal',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: XColors.primaryText,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Cairo',
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: XColors.secondaryText,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Cairo',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: XColors.secondaryText,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Cairo',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: XColors.secondaryText,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Cairo',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: XColors.secondaryText,
    ),
  );
}
