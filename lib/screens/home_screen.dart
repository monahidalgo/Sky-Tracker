import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/accuweather_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherService = Provider.of<AccuWeatherService>(context);

    // Fetch weather data when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      weatherService.fetchWeatherData();
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sky Tracker Weather '),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Current Weather Card
            _buildCurrentWeatherCard(),

            const SizedBox(height: 16.0),

            // Daily Forecast Card
            _buildDailyForecastCard(),

            const SizedBox(height: 16.0),

            // Monthly Trends Card
            _buildMonthlyTrendsCard(),

            const SizedBox(height: 16.0),

            // Weather News Card
            _buildWeatherNewsCard(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Details',
          ),
        ],
      ),
    );
  }

  // Current Weather Card
  Widget _buildCurrentWeatherCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.wb_sunny, size: 50, color: Colors.orange), // Placeholder icon
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Current Weather',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('City: Big Bear, CA'),
                Text('Cold and Snowy'),
                Text('Sunrise: 06:00 AM'),
                Text('Sunset: 8:00 PM'),
                Text('Sunny, 28°C'),
                Text('Humidity: 10%'),
                Text('Wind: 10 km/h SW'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Daily Forecast Card
  Widget _buildDailyForecastCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daily Forecast',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildForecastRow('Monday', 'Sunny', '28°C', Icons.wb_sunny),
            _buildForecastRow('Tuesday', 'Cloudy', '24°C', Icons.cloud),
            _buildForecastRow('Wednesday', 'Rainy', '22°C', Icons.umbrella),
            _buildForecastRow('Thursday', 'Stormy', '20°C', Icons.thunderstorm),
            _buildForecastRow('Friday', 'Sunny', '25°C', Icons.wb_sunny),
          ],
        ),
      ),
    );
  }

  Widget _buildForecastRow(String day, String weather, String temp, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 30, color: Colors.blue),
          const SizedBox(width: 16),
          Text(day, style: const TextStyle(fontSize: 16)),
          const Spacer(),
          Text(weather),
          const SizedBox(width: 16),
          Text(temp),
        ],
      ),
    );
  }

  // Monthly Trends Card
  Widget _buildMonthlyTrendsCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Monthly Trends',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Average Temperature: 25°C'),
            Text('Total Rainfall: 50 mm'),
            Text('Days of Sunshine: 20 days'),
          ],
        ),
      ),
    );
  }

  // Weather News Card
  Widget _buildWeatherNewsCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Weather News',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Severe storm expected in the coming week. Stay prepared!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Heatwave warning for the next few days with temperatures rising above 35°C.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
