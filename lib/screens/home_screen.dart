import 'package:flutter/material.dart';
import 'package:weatherpal/screens/weather_view.dart'; // Correct the path if needed
// Adjust this path based on your file structure


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example weather data for testing purposes
    final weatherData = {
      'name': 'New York',
      'weather': [
        {'main': 'Clear'}
      ],
      'main': {
        'temp': 25.0,
        'humidity': 60,
      },
      'wind': {'speed': 5.0},
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('SkyTracker'),
      ),
      body: WeatherView(weatherData: weatherData),
    );
  }
}
