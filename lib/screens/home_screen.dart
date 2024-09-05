import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skytracker/screens/search_screen.dart';
import 'package:skytracker/screens/settings_screen.dart';
import 'package:skytracker/screens/sign_in_screen.dart';
import 'package:skytracker/screens/weather_details_screen.dart';
import 'package:skytracker/services/weather_service.dart';
import 'package:skytracker/widgets/snow_effect.dart'; // Import the SnowEffect widget
import '../widgets/weather_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SkyTracker'),
      ),
      drawer: const AppDrawer(),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/weather.jpg', // Ensure you have this image in your assets
              fit: BoxFit.cover,
            ),
          ),
          // Snow effect
          const Positioned.fill(
            child: SnowEffect(), // Snow effect widget
          ),
          // Weather content
          Center(
            child: Consumer<WeatherService>(
              builder: (context, weatherService, child) {
                if (weatherService.isLoading) {
                  return CircularProgressIndicator();
                } else if (weatherService.weatherData.isNotEmpty) {
                  return WeatherWidget(
                    weatherData: weatherService.weatherData,
                  );
                } else {
                  return Text('Failed to load weather data');
                }
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
        tooltip: 'More Weather Details',
        child: const Icon(Icons.info),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

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
        ],
      ),
    );
  }
}
