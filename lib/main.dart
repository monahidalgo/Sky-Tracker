import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skytracker/screens/home_screen.dart';
import 'package:skytracker/screens/search_screen.dart';
import 'package:skytracker/screens/weather_details_screen.dart';
import 'package:skytracker/services/weather_service.dart';
import 'package:skytracker/utils/route_transition.dart';
import 'package:skytracker/utils/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherService()..fetchWeatherData()), // Fetch weather data on startup
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
          home: const HomeScreen(), // HomeScreen as the main screen
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





