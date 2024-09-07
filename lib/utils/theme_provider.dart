import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  // Define light and dark themes with Roboto and matching fonts
  ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      primaryColor: Colors.blueAccent,
      hintColor: Colors.blueGrey,
      fontFamily: 'Roboto', // Use Roboto as the default font family
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          fontFamily: 'Roboto',
        ),
        titleMedium: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
          fontFamily: 'Roboto',
        ),
        titleSmall: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
          fontFamily: 'Roboto',
        ),
        displayMedium: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
          color: Colors.black87,
          fontFamily: 'Roboto',
        ),
        displayLarge: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
          color: Colors.black54,
          fontFamily: 'Roboto',
        ),
      ),
      cardColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.blueAccent),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 4,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: Colors.blueGrey,
      brightness: Brightness.dark,
      primaryColor: Colors.blueGrey,
      hintColor: Colors.tealAccent,
      fontFamily: 'Roboto', // Consistent font family for dark theme
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Roboto',
        ),
        titleSmall: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontFamily: 'Roboto',
        ),
        titleMedium: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: Colors.white70,
          fontFamily: 'Roboto',
        ),
        displayMedium: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
          color: Colors.white,
          fontFamily: 'Roboto',
        ),
        displayLarge: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
          color: Colors.white70,
          fontFamily: 'Roboto',
        ),
      ),
      cardColor: Colors.grey[850],
      iconTheme: const IconThemeData(color: Colors.tealAccent),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        elevation: 4,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }

  // Default theme mode set to system
  ThemeMode themeMode = ThemeMode.system;

  get isDarkMode => null;

  get unit => null;

  get notificationsEnabled => null;

  // Method to toggle theme mode between light and dark
  void toggleTheme(bool isDarkMode) {
    themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void toggleNotifications(bool value) {}

  void setUnit(String s) {}
}
