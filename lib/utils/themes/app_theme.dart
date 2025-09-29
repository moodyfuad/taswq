import 'package:flutter/material.dart';
import 'package:taswq/utils/constants/colors.dart';
import 'package:taswq/utils/themes/appbar_theme.dart';
import 'package:taswq/utils/themes/card_theme.dart';
import 'package:taswq/utils/themes/elevated_button_theme.dart';
import 'package:taswq/utils/themes/icon_theme.dart';
import 'package:taswq/utils/themes/outlined_button_theme.dart';
import 'package:taswq/utils/themes/text_theme.dart';

class XAppTheme {
  XAppTheme._();
  static final base = ThemeData.light();

  static final ThemeData light = base.copyWith(
    textTheme: XTextTheme.light,
    primaryTextTheme: XTextTheme.light,

    scaffoldBackgroundColor: XColors.paperLight,
    colorScheme: base.colorScheme.copyWith(
      primary: XColors.electricMagenta,
      secondary: XColors.softNeon,
      background: XColors.paperLight,

      surface: XColors.surfaceLight,
      onPrimary: Colors.white,
      onSurface: XColors.secondaryText,
    ),
    appBarTheme: XAppBarTheme.light,
    cardTheme: XCardTheme.light,
    elevatedButtonTheme: XElevatedButtonTheme.light,
    outlinedButtonTheme: XOutlinedButtonTheme.light,
    iconTheme: XIconTheme.light,

    // textDirection: TextDirection.rtl,
  );
}
