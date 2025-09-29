import 'dart:math';

import 'package:flutter/material.dart';

class LiquidFillButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color liquidColor;
  final Color textColor;
  final Duration fillDuration;

  const LiquidFillButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 200,
    this.height = 60,
    this.liquidColor = const Color(0xFF4A00E0),
    this.textColor = Colors.white,
    this.fillDuration = const Duration(milliseconds: 800),
  }) : super(key: key);

  @override
  _LiquidFillButtonState createState() => _LiquidFillButtonState();
}

class _LiquidFillButtonState extends State<LiquidFillButton>
    with TickerProviderStateMixin {
  late AnimationController _fillController;
  late AnimationController _waveController;
  late Animation<double> _fillAnimation;
  late Animation<double> _waveAnimation;
  late Animation<double> _scaleAnimation;

  bool _isFilling = false;
  bool _isFilled = false;

  @override
  void initState() {
    super.initState();

    _fillController = AnimationController(
      duration: widget.fillDuration,
      vsync: this,
    );
    _waveController = AnimationController(
      duration: widget.fillDuration,
      vsync: this,
    );

    _fillAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fillController, curve: Curves.easeInOut),
    );

    _waveAnimation = Tween<double>(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: _waveController, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: _fillController, curve: Curves.easeInOut),
    );

    _fillController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isFilling = false;
          _isFilled = true;
        });
        // Call the actual onPressed after animation completes
        widget.onPressed();
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          _isFilled = false;
          // _isFilling = false;
        });
      }
    });
  }

  void _startFillAnimation() {
    if (_isFilling) return;

    setState(() {
      _isFilling = true;
    });
    _fillController.forward();
    _waveController.forward();
    _waveController.repeat(reverse: true, count: 10);
  }

  void _resetAnimation() {
    _isFilling = false;
    _fillController.reverse();
  }

  @override
  void dispose() {
    _fillController.dispose();
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _startFillAnimation,
      onDoubleTap: _resetAnimation,
      child: AnimatedBuilder(
        animation: _fillController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: widget.liquidColor.withOpacity(0.3),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: widget.liquidColor.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                  if (_isFilled)
                    BoxShadow(
                      color: widget.liquidColor.withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Stack(
                  children: [
                    // Background
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.9),
                            Colors.white.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),

                    // Liquid Fill
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        height: widget.height * _fillAnimation.value,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              widget.liquidColor.withOpacity(0.9),
                              widget.liquidColor.withOpacity(0.7),
                            ],
                          ),
                        ),
                        child: CustomPaint(
                          painter: _WavePainter(
                            waveValue: _waveAnimation.value,
                            fillProgress: _fillAnimation.value,
                            color: widget.liquidColor,
                          ),
                        ),
                      ),
                    ),

                    // Glass morphism overlay
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 1,
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white.withOpacity(0.2),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Shine effect
                    Positioned(
                      top: -10,
                      left: -10,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              Colors.white.withOpacity(0.4),
                              Colors.white.withOpacity(0.0),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Button text
                    Center(
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: TextStyle(
                          color: _fillAnimation.value > 0.5
                              ? widget.textColor
                              : widget.liquidColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                        child: Text(widget.text),
                      ),
                    ),

                    // Ripple effect
                    if (_isFilling)
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white.withOpacity(0.1),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _WavePainter extends CustomPainter {
  final double waveValue;
  final double fillProgress;
  final Color color;

  _WavePainter({
    required this.waveValue,
    required this.fillProgress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (fillProgress == 0) return;

    final paint = Paint()
      ..color = color.withOpacity(0.8)
      ..style = PaintingStyle.fill;

    final path = Path();
    final waveHeight = 8.0;
    final baseHeight = size.height;

    // Start from bottom-left
    path.moveTo(0, baseHeight);

    // Create wave effect along the top of the liquid
    for (double x = 0; x <= size.width; x++) {
      final normalizedX = x / size.width;
      final wave = sin((normalizedX * 4 * pi) + (waveValue * pi)) * waveHeight;
      final y = baseHeight - (baseHeight * fillProgress) + wave;

      path.lineTo(x, y);
    }

    // Complete the path
    path.lineTo(size.width, baseHeight);
    path.lineTo(0, baseHeight);
    path.close();

    canvas.drawPath(path, paint);

    // Add bubble effects
    if (fillProgress > 0.3) {
      _drawBubbles(canvas, size, fillProgress);
    }
  }

  void _drawBubbles(Canvas canvas, Size size, double progress) {
    final bubblePaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final bubbleCount = (5 * progress).round();

    for (int i = 0; i < bubbleCount; i++) {
      final bubbleX = (size.width * 0.2) + (i * size.width * 0.15);
      final bubbleY = size.height * (1 - progress * 0.8) - (i * 5);
      final bubbleRadius = 1.0 + (i * 0.5);

      canvas.drawCircle(Offset(bubbleX, bubbleY), bubbleRadius, bubblePaint);
    }
  }

  // double sin(double x) => (x % (2 * pi)).sin();

  @override
  bool shouldRepaint(_WavePainter oldDelegate) {
    return waveValue != oldDelegate.waveValue ||
        fillProgress != oldDelegate.fillProgress ||
        color != oldDelegate.color;
  }
}

// Advanced version with multiple states
class AdvancedLiquidButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color primaryColor;

  const AdvancedLiquidButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.primaryColor = const Color(0xFF4A00E0),
  }) : super(key: key);

  @override
  _AdvancedLiquidButtonState createState() => _AdvancedLiquidButtonState();
}

class _AdvancedLiquidButtonState extends State<AdvancedLiquidButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fillAnimation;
  late Animation<double> _successAnimation;

  ButtonState _currentState = ButtonState.idle;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fillAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.7, curve: Curves.easeInOut),
      ),
    );

    _successAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _currentState = ButtonState.success;
        });
        widget.onPressed();

        // Auto reset after success
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            _reset();
          }
        });
      }
    });
  }

  void _onTap() {
    if (_currentState != ButtonState.idle) return;

    setState(() {
      _currentState = ButtonState.loading;
    });
    _controller.forward();
  }

  void _reset() {
    _controller.reverse().then((_) {
      if (mounted) {
        setState(() {
          _currentState = ButtonState.idle;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: 200,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: widget.primaryColor.withOpacity(0.3),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: widget.primaryColor.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                children: [
                  // Background
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.9),
                          Colors.white.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),

                  // Liquid fill
                  if (_currentState == ButtonState.loading)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 60 * _fillAnimation.value,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              widget.primaryColor.withOpacity(0.9),
                              widget.primaryColor.withOpacity(0.7),
                            ],
                          ),
                        ),
                      ),
                    ),

                  // Success checkmark
                  if (_currentState == ButtonState.success)
                    Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 30 * _successAnimation.value,
                      ),
                    ),

                  // Text
                  if (_currentState != ButtonState.success)
                    Center(
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: TextStyle(
                          color: _fillAnimation.value > 0.5
                              ? Colors.white
                              : widget.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        child: Text(widget.text),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

enum ButtonState { idle, loading, success }

// Demo page
class LiquidButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LiquidFillButton(
              text: 'Get Started',
              onPressed: () {
                print('Button pressed!');
              },
              liquidColor: const Color(0xFF4A00E0),
            ),

            const SizedBox(height: 40),

            LiquidFillButton(
              text: 'Subscribe Now',
              onPressed: () {
                print('Subscribe pressed!');
              },
              liquidColor: const Color(0xFF00C6FB),
              width: 220,
              height: 70,
            ),

            const SizedBox(height: 40),

            AdvancedLiquidButton(
              text: 'Complete Purchase',
              onPressed: () {
                print('Purchase completed!');
              },
              primaryColor: const Color(0xFF8E2DE2),
            ),

            const SizedBox(height: 20),

            Text(
              'Tap to fill • Double tap to reset',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
