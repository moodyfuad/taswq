import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class XGlassContainer extends StatefulWidget {
  final Widget child;
  final double borderRadius;
  final double blur;
  final double opacity;
  final Color bgColor;
  final VoidCallback? onTap;
  final bool enableHover;
  final bool enableTapEffect;
  final Duration hoverDuration;
  final Duration tapDuration;

  const XGlassContainer({
    super.key,
    required this.child,
    this.borderRadius = 12.0,
    required this.blur,
    required this.opacity,
    this.bgColor = Colors.white,
    this.onTap,
    this.enableHover = true,
    this.enableTapEffect = true,
    this.hoverDuration = const Duration(milliseconds: 150),
    this.tapDuration = const Duration(milliseconds: 300),
  });

  @override
  State<XGlassContainer> createState() => _XGlassContainerState();
}

class _XGlassContainerState extends State<XGlassContainer>
    with TickerProviderStateMixin {
  late final AnimationController _hoverController;
  late final AnimationController _pressController;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      vsync: this,
      duration: widget.hoverDuration,
    )..addListener(() => setState(() {}));
    _pressController = AnimationController(
      vsync: this,
      duration: widget.tapDuration,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _hoverController.dispose();
    _pressController.dispose();
    super.dispose();
  }

  void _onEnter(PointerEnterEvent _) {
    if (!widget.enableHover) return;
    _hoverController.forward();
  }

  void _onExit(PointerExitEvent _) {
    if (!widget.enableHover) return;
    _hoverController.reverse();
  }

  void _onTapDown(TapDownDetails _) {
    if (!widget.enableTapEffect) return;
    _pressController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.enableTapEffect) _pressController.reverse();
    widget.onTap?.call();
  }

  void _onTapCancel() {
    if (widget.enableTapEffect) _pressController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    // hover: [0..1], press: [0..1]
    final double h = _hoverController.value;
    final double p = _pressController.value;
    // combine: hover increases scale, press slightly reduces it
    final double scale = (1.0 + 0.03 * h) * (1.0 - 0.03 * p);
    final double sigmaX = (widget.blur + h * 2 - p * 1).clamp(0.0, 50.0);
    final double sigmaY = (widget.blur + 1 + h * 2 - p * 1).clamp(0.0, 50.0);
    final double opacity = (widget.opacity + h * 0.06 - p * 0.03).clamp(
      0.0,
      1.0,
    );
    final double lightPosition = p * 5 - 50;

    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: Transform.scale(
          scale: scale,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
              child: Stack(
                children: [
                  Positioned(
                    top: lightPosition,
                    left: lightPosition,
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            Colors.white.withValues(alpha: 0.9),
                            // Colors.white.withValues(alpha: 0.8),
                            // widget.bgColor.withValues(alpha: 0.3),
                            widget.bgColor.withValues(alpha: 0.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: lightPosition,
                    right: lightPosition,
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            Colors.white.withValues(alpha: 0.8),
                            widget.bgColor.withValues(alpha: 0.3),
                            widget.bgColor.withValues(alpha: 0.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: widget.bgColor.withValues(alpha: opacity),
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      border: Border.all(
                        color: widget.bgColor.withValues(alpha: 0.2),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(
                            alpha: 0.08 + h * 0.04,
                          ),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                          spreadRadius: 2,
                        ),
                        BoxShadow(
                          color: widget.bgColor.withValues(
                            alpha: 0.18 + h * 0.06,
                          ),
                          blurRadius: 5,
                          offset: const Offset(0, -2),
                          spreadRadius: 2,
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          widget.bgColor.withValues(alpha: 0.7 + h * 0.1),
                          widget.bgColor.withValues(alpha: 0.3 + h * 0.06),
                        ],
                        stops: const [0.0, 0.8],
                      ),
                    ),
                    child: widget.child,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
