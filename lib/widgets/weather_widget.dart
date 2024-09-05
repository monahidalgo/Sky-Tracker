import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  const WeatherWidget({required this.weatherData, super.key});

  @override
  Widget build(BuildContext context) {
    // Safely extract values with default fallbacks
    final locationName = weatherData['location']?['name'] ?? 'Unknown Location';
    final temp = weatherData['current']?['temp_c']?.toStringAsFixed(1) ?? 'N/A';
    final description = weatherData['current']?['condition']?['text'] ?? 'No description';
    final humidity = weatherData['current']?['humidity']?.toString() ?? 'N/A';
    final windSpeed = weatherData['current']?['wind_kph']?.toString() ?? 'N/A';

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
          'Wind: $windSpeed kph',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
