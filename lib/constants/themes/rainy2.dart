import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather/constants/themes/base_theme.dart';

class Rainy2 extends BaseTheme {
  @override
  LinearGradient get gradient => LinearGradient(colors: [
    const Color(0xffCCDAFF).withOpacity(0.7),
    const Color(0xffCCDAFF).withOpacity(0.3)
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  @override
  String get image => 'assets/images/rainy_2.png';

  @override
  Color get primary => const Color(0xff615273);

  @override
  Color get secondary => const Color(0xffC2B8FF);
}