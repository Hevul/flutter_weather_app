import 'package:flutter/material.dart';

import 'base_theme.dart';

class Cloudy1 extends BaseTheme {
  @override
  final Color primary = const Color(0xff91B4C6);
  @override
  final Color secondary = const Color(0xffCAD7DF);
  @override
  final LinearGradient gradient = LinearGradient(colors: [
    const Color(0xff91B4C6).withOpacity(0.7),
    const Color(0xff91B4C6).withOpacity(0.3)
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
  @override
  final String image = 'assets/images/cloudy_1.png';
}
