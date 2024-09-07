import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AccuWeatherService with ChangeNotifier {
  final String apiKey = 'N9t7KpWBaKG2VdxVHhIZTSzcAXigOwQR'; // Replace with your actual AccuWeather API key
  final String locationKey = '348735'; // Replace with your location key
  List<Map<String, dynamic>> weatherData = [];
  bool isLoading = false;

  Future<void> fetchWeatherData() async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await http.get(
        Uri.parse(
          'https://dataservice.accuweather.com/forecasts/v1/daily/7day/$locationKey?apikey=$apiKey&metric=true',
        ),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        weatherData = List<Map<String, dynamic>>.from(data['DailyForecasts']);
        notifyListeners();
      } else {
        print('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching weather data: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
