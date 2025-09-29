import 'package:flutter/material.dart';
import 'package:taswq/utils/constants/colors.dart';
import 'package:taswq/utils/themes/text_theme.dart';

class XOutlinedButtonTheme {
  XOutlinedButtonTheme._();

  static final light = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: XColors.lumenIndigo,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: XColors.lumenIndigo.withOpacity(0.12)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        textStyle: XTextTheme.light.bodyMedium,
      ),
    );
}
