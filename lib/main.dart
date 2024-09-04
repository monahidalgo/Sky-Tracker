import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherpal/services/weather_service.dart';
import 'package:weatherpal/utils/theme_provider.dart';
import 'package:weatherpal/screens/home_screen.dart'; // Ensure the path is correct
import 'package:weatherpal/screens/search_screen.dart'; // Import the SearchScreen
import 'package:weatherpal/screens/weather_details_screen.dart'; // Import WeatherDetailsScreen
import 'package:weatherpal/utils/route_transition.dart'; // Import the FadePageRoute

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
          home: HomeScreen(), // HomeScreen as the main screen
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




