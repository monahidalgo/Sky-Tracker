// weather_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';

class WeatherView extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  const WeatherView({required this.weatherData, super.key});

  WeatherType _getWeatherType(String condition) {
    switch (condition.toLowerCase()) {
      case 'thunderstorm':
        return WeatherType.thunder;
      case 'rain':
        return WeatherType.heavyRainy;
      case 'snow':
        return WeatherType.heavySnow;
      case 'clear':
        return WeatherType.sunny;
      case 'clouds':
        return WeatherType.cloudy;
      default:
        return WeatherType.sunny;
    }
  }

  @override
  Widget build(BuildContext context) {
    final weatherCondition = weatherData['weather'][0]['main'] as String;
    final weatherType = _getWeatherType(weatherCondition);

    return Stack(
      children: [
        WeatherBg(
          weatherType: weatherType,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherData['name'],
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                '${weatherData['main']['temp'].toStringAsFixed(1)}°C',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                'Humidity: ${weatherData['main']['humidity']}%',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'Wind: ${weatherData['wind']['speed']} m/s',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
