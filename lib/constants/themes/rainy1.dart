import 'package:flutter/material.dart';
import 'package:weather/constants/themes/base_theme.dart';

class Rainy1 extends BaseTheme {
  @override
  LinearGradient get gradient => LinearGradient(colors: [
    primary.withOpacity(0.7),
    primary.withOpacity(0.3)
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  @override
  String get image => 'assets/images/rainy_1.png';

  @override
  Color get primary => const Color(0xff40666A);

  @override
  Color get secondary => const Color(0xffC9E8E0);
}