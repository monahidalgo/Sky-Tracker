import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  const WeatherWidget({Key? key, required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final temp = weatherData['main']?['temp'] ?? 0;
    final description = weatherData['weather']?[0]?['description'] ?? '';
    final iconCode = weatherData['weather']?[0]?['icon'] ?? '';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${temp.toStringAsFixed(1)}°C',
          style: Theme
              .of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          description,
          style: Theme
              .of(context)
              .textTheme
              .titleMedium
              ?.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        // You can add an Image widget here to display the weather icon based on iconCode
      ],
    );
  }
}