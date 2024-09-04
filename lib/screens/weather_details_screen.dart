// weather_details_screen.dart
import 'package:flutter/material.dart';

class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Details'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Today\'s Forecast',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          // Add weather details and hourly forecast here
          SizedBox(height: 20),
          Text(
            'Weekly Forecast',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          // Add weekly forecast widgets
        ],
      ),
    );
  }
}
