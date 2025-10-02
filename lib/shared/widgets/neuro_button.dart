// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import 'package:taswq/utils/constants/sizes.dart';

class XNeuroButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final Color? color;
  const XNeuroButton({Key? key, this.onPressed, this.child, this.color})
    : super(key: key);

  @override
  State<XNeuroButton> createState() => _XNeuroButtonState();
}

class _XNeuroButtonState extends State<XNeuroButton> {
  bool isPressed = false;
  static const Duration _animationDuration = Duration(milliseconds: 200);
  double get _brightness => 0.4;
  onTap() async {
    setState(() {
      isPressed = true;
    });
    await Future.delayed(_animationDuration, () {
      setState(() {
        isPressed = false;
      });
    });
    widget.onPressed?.call();
    print("pressed");
  }

  tapDown(TapDownDetails details) {
    setState(() {
      isPressed = true;
    });
  }

  tapUp() {
    setState(() {
      isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onTapDown: tapDown,
      onTapUp: (_) => tapUp(),
      onTapCancel: tapUp,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(XSizes.borderRadius),
          boxShadow: isPressed
              ? []
              : [
                  BoxShadow(
                    color: Colors.grey[500]!,
                    offset: const Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
        ),
        child: widget.child ?? const SizedBox.shrink(),
      ),
    );
  }
}
