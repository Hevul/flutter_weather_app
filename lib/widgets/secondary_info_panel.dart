import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/controller/controller.dart';
import 'package:weather/models/forecast.dart';
import 'package:weather/widgets/export.dart';

class SecondaryInfoPanel extends StatelessWidget {
  const SecondaryInfoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GetX<Controller>(builder: (Controller value) {
      int now = DateTime.now().hour;
      int beginIndex = now > 14 ? 14 : now;

      return Container(
          width: size.width * .84,
          height: size.height * .23,
          decoration: BoxDecoration(
              gradient: value.theme.gradient,
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _getForecastGroup(
                        begin: beginIndex,
                        forecasts: value.weatherData!.forecasts),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 1,
                      color: Colors.white.withOpacity(.5),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _getForecastGroup(
                        begin: beginIndex + 5,
                        forecasts: value.weatherData!.forecasts),
                  )
                ],
              ),
            ),
          ));
    });
  }

  List<Widget> _getForecastGroup(
      {required int begin, required List<Forecast> forecasts}) {
    final forecastGroup = <Widget>[];

    final currentHour = DateTime.now().hour;

    for (int i = 0; i < 5; i++) {
      final item = forecasts[i + begin];
      final givenHour = forecasts[i + begin].time.hour;

      forecastGroup.add(ForecastItem(
          time: currentHour == givenHour
              ? 'Now'
              : DateFormat('ha').format(item.time),
          temperature: item.temperature.toInt()));
    }

    return forecastGroup;
  }
}
