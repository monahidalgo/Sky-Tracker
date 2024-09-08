// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/accuweather_service.dart';
import 'screens/get_started_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AccuWeatherService()),
      ],
      child: MaterialApp(
        title: 'Sky Tracker',
        debugShowCheckedModeBanner: false,
        initialRoute: '/getStarted',
        routes: {
          '/getStarted': (context) => GetStartedScreen(),
          '/home': (context) => const HomeScreen(),
        },
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}
