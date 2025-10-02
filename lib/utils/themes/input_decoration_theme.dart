import 'package:flutter/material.dart';
import 'package:taswq/utils/constants/colors.dart';
import 'package:taswq/utils/constants/sizes.dart';

class XInputDecorationTheme {
  XInputDecorationTheme._();
  static final light = InputDecorationTheme(
    // filled: true,
    // fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(XSizes.borderRadius),
      borderSide: BorderSide(color: XColors.primaryText, width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(XSizes.borderRadius),
      borderSide: BorderSide(color: XColors.primaryText, width: 2),
      
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.blue, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),
    hintStyle: TextStyle(color: Colors.grey[600]),
    iconColor: XColors.primaryText,
    prefixIconColor: XColors.primaryText,
    suffixIconColor: XColors.primaryText,
  );
}
