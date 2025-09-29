import 'package:flutter/material.dart';
import 'package:taswq/utils/constants/colors.dart';
import 'package:taswq/utils/themes/text_theme.dart';

class XElevatedButtonTheme {
  XElevatedButtonTheme._();

  static final light = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: XColors.electricMagenta,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 6,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      textStyle: XTextTheme.light.titleLarge,
    ),
  );
}
