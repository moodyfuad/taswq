import 'package:flutter/material.dart';
import 'package:taswq/utils/constants/colors.dart';

class XAnimatedBadge extends StatefulWidget {
  final bool success;
  final String label;

  const XAnimatedBadge({super.key, required this.success, required this.label});

  @override
  State<XAnimatedBadge> createState() => _XAnimatedBadgeState();
}

class _XAnimatedBadgeState extends State<XAnimatedBadge> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 420),
      transitionBuilder: (child, anim) {
        return ScaleTransition(
          scale: anim,
          child: FadeTransition(opacity: anim, child: child),
        );
      },
      child: widget.success
          ? Container(
              key: const ValueKey('success'),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: XColors.aquaWave.withAlpha(30),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle, color: XColors.aquaWave, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    widget.label,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: XColors.lumenIndigo,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              key: const ValueKey('idle'),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: XColors.lumenIndigo,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.label,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: XColors.lumenIndigo,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
