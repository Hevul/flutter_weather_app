import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/constants/themes/export.dart';
import 'package:http/http.dart' as http;
import 'package:weather/models/forecast.dart';
import 'package:weather/models/weather_data.dart';

class Controller extends GetxController {
  final _theme = Rx<BaseTheme>(Cloudy1());

  BaseTheme get theme => _theme.value;

  final _weatherData = Rx<WeatherData?>(null);

  WeatherData? get weatherData => _weatherData.value;

  @override
  void onInit() async {
    super.onInit();
    _weatherData.value = await _fetchData('Minsk');
  }

  void refreshForecast(String city) async {
    _weatherData.value = await _fetchData(city);
  }

  Future<WeatherData> _fetchData(String city) async {
    final apiUrl =
        'http://api.weatherapi.com/v1/forecast.json?key=668b8d7eb7de436189f81806242205&q=$city&days=1&aqi=no&alerts=no';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final city = data['location']['name'];
      final country = data['location']['country'];
      final temperature = data['current']['temp_c'];
      final currentDate = DateTime.now();
      final feelsLikeTemperature = data['current']['feelslike_c'];
      final sunsetTime = _formatSunsetTime(
          data['forecast']['forecastday'][0]['astro']['sunset']);
      final condition = data['current']['condition']['code'];

      final list = data['forecast']['forecastday'][0]['hour'];
      final forecasts = <Forecast>[];
      for (final item in list) {
        String dateString = item['time'];
        DateTime dateTime = DateTime.parse(dateString);
        forecasts.add(Forecast(temperature: item['temp_c'], time: dateTime));
      }

      final weather = WeatherData(
        city: city,
        country: country,
        temperature: temperature,
        date: currentDate,
        forecasts: forecasts,
        feelsLikeTemperature: feelsLikeTemperature,
        sunsetTime: sunsetTime,
        conditionCode: condition,
      );

      _setThemeByCurrentWeather(weather);

      return weather;
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

  void _setThemeByCurrentWeather(WeatherData weather) {
    final random = Random();
    String condition = weather.getWeatherGroup();

    switch(condition) {
      case 'Cloudy':
        final cloudy = [Cloudy1(), Cloudy2(), Cloudy3(), Cloudy4()];
        _theme.value = cloudy[random.nextInt(4)];
        break;
      case 'Sunny':
        final sunny = [Sunny1(), Sunny2()];
        _theme.value = sunny[random.nextInt(2)];
        break;
      case 'Rainy':
        final sunny = [Rainy1(), Rainy2(), Rainy3()];
        _theme.value = sunny[random.nextInt(3)];
        break;
      case 'Snowy':
        final sunny = [Snowy1(), Snowy2()];
        _theme.value = sunny[random.nextInt(2)];
        break;
    }
  }

  String _formatSunsetTime(String sunset) {
    String inputFormat = 'hh:mm a';
    String outputFormat = 'HH:mm';

    DateTime dateTime = DateFormat(inputFormat).parse(sunset);
    String formattedTime = DateFormat(outputFormat).format(dateTime);

    return formattedTime;
  }
}
