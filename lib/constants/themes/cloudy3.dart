import 'package:flutter/material.dart';
import 'package:weather/constants/themes/base_theme.dart';

class Cloudy3 extends BaseTheme {
  @override
  LinearGradient get gradient => LinearGradient(colors: [
    primary.withOpacity(0.7),
    primary.withOpacity(0.3)
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  @override
  String get image => 'assets/images/cloudy_3.png';

  @override
  Color get primary => const Color(0xffAC736A);

  @override
  Color get secondary => const Color(0xffF6C8A4);
}