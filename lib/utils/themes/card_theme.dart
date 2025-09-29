import 'package:flutter/material.dart';
import 'package:taswq/utils/constants/colors.dart';

class XCardTheme {
  XCardTheme._();

  static final light = CardThemeData(
    
    color: XColors.surfaceLight,
    elevation: 6,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
  );
}
