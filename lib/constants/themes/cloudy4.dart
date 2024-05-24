import 'package:flutter/material.dart';
import 'package:weather/constants/themes/base_theme.dart';

class Cloudy4 extends BaseTheme {
  @override
  LinearGradient get gradient => LinearGradient(colors: [
    secondary.withOpacity(0.7),
    secondary.withOpacity(0.3)
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  @override
  String get image => 'assets/images/cloudy_4.png';

  @override
  Color get primary => const Color(0xff9090AC);

  @override
  Color get secondary => const Color(0xff484A82);
}