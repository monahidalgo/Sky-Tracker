import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WeatherService with ChangeNotifier {
  String apiKey = '847b5e732ad44181ad683917240509'; // Replace with your WeatherAPI key
  String location = '35.1475,-107.8514'; // Coordinates for Grants, NM
  Map<String, dynamic> weatherData = {};
  bool isLoading = false;

  Future<void> fetchWeatherData() async {
    try {
      isLoading = true;
      notifyListeners(); // Notify listeners when loading starts
      final response = await http.get(
        Uri.parse('http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$location&aqi=no'),
      );

      print('API Response: ${response.body}'); // Debugging line

      if (response.statusCode == 200) {
        weatherData = json.decode(response.body);
        _cacheWeatherData(weatherData);
        notifyListeners();
      } else {
        print('Failed to load weather data: ${response.statusCode}');
        print('Response body: ${response.body}'); // Print response body for more details
        weatherData = await _getCachedWeatherData();
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching weather data: $e');
      weatherData = await _getCachedWeatherData();
      notifyListeners();
    } finally {
      isLoading = false;
      notifyListeners(); // Notify listeners when loading ends
    }
  }

  Future<void> _cacheWeatherData(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('cached_weather', json.encode(data));
  }

  Future<Map<String, dynamic>> _getCachedWeatherData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('cached_weather');
    if (data != null) {
      return json.decode(data);
    }
    return {};
  }

  fetchWeather(String text) {}
}
