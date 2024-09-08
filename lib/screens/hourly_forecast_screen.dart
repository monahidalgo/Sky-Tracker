import 'package:flutter/material.dart';

class HourlyForecastScreen extends StatelessWidget {
  final String day;

  const HourlyForecastScreen({required this.day, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$day Forecast'),
        backgroundColor: Colors.blue[800],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[900]!, Colors.blue[500]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: 24, // Assume 24 hours for now
          itemBuilder: (context, index) {
            // Mock hourly data
            final hour = (index + 1) % 24;
            final isAM = hour < 12;
            final formattedHour = isAM ? '$hour AM' : '${hour % 12} PM';

            return Card(
              color: Colors.blue[600]!.withOpacity(0.8),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                leading: Icon(
                  Icons.wb_sunny,
                  color: Colors.yellow[700],
                  size: 40,
                ),
                title: Text(
                  formattedHour,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  '70°F - Mostly Sunny',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
