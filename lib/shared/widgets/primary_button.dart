// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:taswq/utils/constants/sizes.dart';

class XPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool enabled;
  final Widget? leading;
  final Widget? trailing;

  const XPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.enabled = true,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(XSizes.borderRadius),
        ),
        elevation: 6,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          if (leading != null) ...[leading!, const SizedBox(width: 8)],
          Text(
            textAlign: TextAlign.center,
            label,
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
          if (trailing != null) ...[const SizedBox(width: 8), trailing!],
        ],
      ),
    );
  }
}
