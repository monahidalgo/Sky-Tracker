import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Add this import
import 'package:skytracker/screens/search_screen.dart';
import 'package:skytracker/screens/settings_screen.dart';
import 'package:skytracker/screens/sign_in_screen.dart';
import 'package:skytracker/screens/weather_details_screen.dart';
import '../widget/weather_widget.dart';
import '../services/weather_service.dart'; // Import the weather service

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access WeatherService
    final weatherService = Provider.of<WeatherService>(context);

    // Fetch weather data when the screen is built
    weatherService.fetchWeatherData();

    return Scaffold(
      appBar: AppBar(
        title: const Text('SkyTracker'),
      ),
      drawer: AppDrawer(),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/weather.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Snow effect
          Positioned.fill(
            child: SnowEffect(),
          ),
          // Weather content
          Center(
            child: Consumer<WeatherService>(
              builder: (context, weatherService, child) {
                if (weatherService.isLoading) {
                  return const CircularProgressIndicator();
                } else {
                  return WeatherWidget(weatherData: weatherService.weatherData);
                }
              },
            ),
          ),
          // Live temperature icon
          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width * 0.25,
            child: Consumer<WeatherService>(
              builder: (context, weatherService, child) {
                final temp = weatherService.weatherData['main']?['temp'] ?? 0;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.ac_unit, // Replace with weather icon
                      size: 50,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${temp.toStringAsFixed(1)}°C',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WeatherDetailsScreen(),
            ),
          );
        },
        child: const Icon(Icons.info),
        tooltip: 'More Weather Details',
      ),
    );
  }
}

// AppDrawer class remains the same
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: const Text(
              'SkyTracker Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Search'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Sign In'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignInScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Add logout logic here
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class SnowEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(
        100,
            (index) => Positioned(
          top: (index % 10) * 50.0,
          left: (index % 10) * 30.0,
          child: Opacity(
            opacity: 0.7,
            child: Icon(
              Icons.ac_unit,
              size: 10,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
