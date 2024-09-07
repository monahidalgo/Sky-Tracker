import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skytracker/screens/home_screen.dart';
import 'package:skytracker/screens/search_screen.dart';
import 'package:skytracker/screens/weather_details_screen.dart';
import 'package:skytracker/services/accuweather_service.dart'; // Make sure this matches your service name
import 'package:skytracker/utils/route_transition.dart';
import 'package:skytracker/utils/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AccuWeatherService()..fetchWeatherData()), // Use AccuWeatherService
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          title: 'SkyTracker',
          debugShowCheckedModeBanner: false,
          theme: themeProvider.lightTheme,
          darkTheme: themeProvider.darkTheme,
          themeMode: themeProvider.themeMode,
          home: const HomeScreen(), // Ensure HomeScreen is correctly set
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/search':
                return MaterialPageRoute(builder: (_) => const SearchScreen());
              case '/weatherDetails':
                return FadePageRoute(page: const WeatherDetailsScreen());
              default:
                return null;
            }
          },
        );
      },
    );
  }
}
