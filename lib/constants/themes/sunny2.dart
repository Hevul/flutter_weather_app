import 'package:flutter/material.dart';
import 'package:weather/constants/themes/base_theme.dart';

class Sunny2 extends BaseTheme {
  @override
  LinearGradient get gradient => LinearGradient(colors: [
    const Color(0xff8ECA96).withOpacity(0.7),
    const Color(0xff8ECA96).withOpacity(0.3)
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  @override
  String get image => 'assets/images/sunny_2.png';

  @override
  Color get primary => const Color(0xff9FDCA8);

  @override
  Color get secondary => const Color(0xff71A78F);
}