import 'package:flutter/material.dart';
import 'package:weather/constants/themes/export.dart';

class Cloudy2 extends BaseTheme {
  @override
  LinearGradient get gradient => LinearGradient(colors: [
    const Color(0xff5A8BAB).withOpacity(0.7),
    const Color(0xff5A8BAB).withOpacity(0.3)
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  @override
  String get image => 'assets/images/cloudy_2.png';

  @override
  Color get primary => const Color(0xff5A8BAB);

  @override
  Color get secondary => const Color(0xffAED5E4);
}