import 'dart:math';
import 'package:flutter/material.dart';

class SnowEffect extends StatefulWidget {
  const SnowEffect({super.key});

  @override
  _SnowEffectState createState() => _SnowEffectState();
}

class _SnowEffectState extends State<SnowEffect> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Snowflake> _snowflakes = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    for (int i = 0; i < 100; i++) {
      _snowflakes.add(Snowflake());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: SnowPainter(_snowflakes, _controller.value),
        );
      },
    );
  }
}

class Snowflake {
  double x = Random().nextDouble() * 400;
  double y = Random().nextDouble() * 800;
  double radius = Random().nextDouble() * 3 + 2;
  double speed = Random().nextDouble() * 2 + 1;

  void fall(double progress) {
    y += speed * progress * 5;
    if (y > 800) {
      y = 0;
      x = Random().nextDouble() * 400;
    }
  }
}

class SnowPainter extends CustomPainter {
  final List<Snowflake> snowflakes;
  final double progress;

  SnowPainter(this.snowflakes, this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;

    for (var snowflake in snowflakes) {
      snowflake.fall(progress);
      canvas.drawCircle(Offset(snowflake.x, snowflake.y), snowflake.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
