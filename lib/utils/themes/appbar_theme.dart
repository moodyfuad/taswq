import 'package:flutter/material.dart';
import 'package:taswq/utils/constants/colors.dart';
import 'package:taswq/utils/themes/text_theme.dart';

class XAppBarTheme {
  XAppBarTheme._();
  static final light = AppBarTheme(
    backgroundColor: XColors.surfaceLight,
    foregroundColor: XColors.lumenIndigo,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: XTextTheme.light.displaySmall,
    iconTheme: const IconThemeData(color: XColors.lumenIndigo),
  );
}
