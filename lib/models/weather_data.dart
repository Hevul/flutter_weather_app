import 'package:weather/models/forecast.dart';

class WeatherData {
  final String city;
  final String country;
  final double temperature;
  final double feelsLikeTemperature;
  final DateTime date;
  final String sunsetTime;
  final List<Forecast> forecasts;
  final int conditionCode;

  WeatherData(
      {required this.feelsLikeTemperature,
      required this.conditionCode,
      required this.sunsetTime,
      required this.city,
      required this.country,
      required this.temperature,
      required this.date,
      required this.forecasts});

  String getWeatherGroup() {
    final weatherGroups = {
      'Sunny': [1000],
      'Cloudy': [1003, 1006, 1009, 1030, 1135, 1147],
      'Rainy': [1063, 1150, 1153, 1168, 1171, 1180, 1183, 1186, 1189, 1192, 1195, 1198, 1201, 1243, 1246],
      'Snowy': [1066, 1069, 1072, 1114, 1117, 1204, 1207, 1210, 1213, 1216, 1219, 1222, 1225, 1237, 1240, 1249, 1252, 1255, 1258, 1261, 1264],
    };

    for (final entry in weatherGroups.entries) {
      if (entry.value.contains(conditionCode)) {
        return entry.key;
      }
    }

    return 'Unknown';
  }
}
