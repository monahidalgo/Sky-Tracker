import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WeatherService with ChangeNotifier {
  String apiKey = '8ac10eaf77f6433d634f808c6de7e508'; // Replace with your weather API key
  String location = 'New York';
  Map<String, dynamic> weatherData = {};
  bool isLoading = false;

  Future<void> fetchWeatherData() async {
    try {
      isLoading = true;
      final response = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apiKey&units=metric'),
      );

      if (response.statusCode == 200) {
        weatherData = json.decode(response.body);
        _cacheWeatherData(weatherData);
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching weather data: $e');
      weatherData = await _getCachedWeatherData();
      notifyListeners();
    } finally {
      isLoading = false;
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
