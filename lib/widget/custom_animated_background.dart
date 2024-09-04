// custom_animated_background.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomAnimatedBackground extends StatelessWidget {
  final Widget child;
  final String weatherCondition;

  const CustomAnimatedBackground({
    required this.child,
    required this.weatherCondition,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Determine which animation to display based on the weather condition
    String animationAsset;
    switch (weatherCondition.toLowerCase()) {
      case 'rain':
        animationAsset = 'assets/animations/rain.json';
        break;
      case 'snow':
        animationAsset = 'assets/animations/snow.json';
        break;
      case 'clear':
      default:
        animationAsset = 'assets/animations/sun.json';
        break;
    }

    return Stack(
      children: [
        Lottie.asset(
          animationAsset,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        child,
      ],
    );
  }
}
