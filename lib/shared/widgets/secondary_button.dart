// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:taswq/utils/constants/colors.dart';
import 'package:taswq/utils/constants/sizes.dart';

class XSecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Widget? leading;
  final Widget? trailing;

  const XSecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: XColors.lumenIndigo,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(XSizes.borderRadius),
        ),
        side: BorderSide(color: XColors.lumenIndigo.withOpacity(0.12)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      child: Row(
        children: [
          if (leading != null) ...[leading!, const SizedBox(width: 8)],
          Text(
            label,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: XColors.lumenIndigo,
            ),
          ),
          if (trailing != null) ...[const SizedBox(width: 8), trailing!],
        ],
      ),
    );
  }
}
