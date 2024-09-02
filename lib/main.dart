// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherpal/services/weather_service.dart';
import 'package:weatherpal/utils/theme_provider.dart';
import 'package:weatherpal/screens/home_screen.dart'; // Ensure correct import

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WeatherService()),
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
        );
      },
    );
  }
}


