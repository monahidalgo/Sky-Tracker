import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  const WeatherWidget({required this.weatherData, super.key});

  @override
  Widget build(BuildContext context) {
    // Safely extract values with default fallbacks
    final locationName = weatherData['name'] ?? 'Unknown Location';
    final temp = weatherData['main']?['temp']?.toStringAsFixed(1) ?? 'N/A';
    final description = weatherData['weather']?.first['description'] ?? 'No description';
    final humidity = weatherData['main']?['humidity']?.toString() ?? 'N/A';
    final windSpeed = weatherData['wind']?['speed']?.toString() ?? 'N/A';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          locationName,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        Text(
          '$temp°C',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 5),
        Text(
          'Humidity: $humidity%',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'Wind: $windSpeed m/s',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
