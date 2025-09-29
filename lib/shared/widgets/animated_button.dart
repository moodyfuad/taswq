import 'package:flutter/material.dart';
import 'package:taswq/utils/constants/colors.dart';

class XAnimatedButton extends StatefulWidget {
  final double width;
  final double height;
  final String label;
  final VoidCallback onTap;

  const XAnimatedButton({
    Key? key,
    required this.width,
    this.height = 56,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  State<XAnimatedButton> createState() => _XAnimatedButtonState();
}

class _XAnimatedButtonState extends State<XAnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _progress;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
    );
    _progress = CurvedAnimation(parent: _ctrl, curve: Curves.elasticOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _handleTap() async {
    // trigger animation
    try {
      await _ctrl.forward();
      await Future.delayed(const Duration(milliseconds: 160));
      await _ctrl.reverse();
    } catch (e) {}
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedBuilder(
        animation: _progress,
        builder: (context, child) {
          final p = _progress.value;
          // The 'liquid' fill is represented by a gradient whose center shifts
          final gradient = LinearGradient(
            begin: Alignment(-1 + 2 * p, -0.2),
            end: Alignment(1 - 2 * p, 0.2),
            colors: [
              XColors.softNeon.withOpacity(0.95),
              XColors.electricMagenta.withOpacity(0.95),
            ],
          );

          return Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary.withOpacity(0.18 * p),
                  blurRadius: 12 * p,
                  offset: Offset(0, 6 * p),
                ),
              ],
            ),
            child: Stack(
              children: [
                // base button
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black.withOpacity(0.04)),
                  ),
                ),
                // animated fill
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.2 + 0.8 * p,
                    child: Container(
                      decoration: BoxDecoration(gradient: gradient),
                    ),
                  ),
                ),
                // label centered
                Center(
                  child: Text(
                    widget.label,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: XColors.lumenIndigo,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
