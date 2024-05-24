import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/controller/controller.dart';
import 'package:weather/widgets/export.dart';

class PrimaryInfoPanel extends StatelessWidget {
  const PrimaryInfoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GetX<Controller>(
      builder: (Controller value) => Container(
        width: size.width * .84,
        height: size.height * .45,
        decoration: BoxDecoration(
            color: value.theme.primary,
            borderRadius: const BorderRadius.all(Radius.circular(35))),
        child: Column(
          children: [
            const Spacer(
              flex: 3,
            ),
            _text(text: 'Today', fontSize: 25),
            const Spacer(),
            Temperature(temperature: value.weatherData!.temperature.toInt()),
            _text(
                text: value.weatherData!.getWeatherGroup(),
                fontSize: 20,
                fontWeight: FontWeight.w600),
            const Spacer(
              flex: 2,
            ),
            _text(
                text:
                    '${value.weatherData!.city}, ${value.weatherData!.country}',
                fontWeight: FontWeight.w400),
            const Spacer(),
            _text(
                text: DateFormat('dd MMM yyyy').format(value.weatherData!.date),
                fontWeight: FontWeight.w400),
            const Spacer(),
            _text(
                text:
                    'Feels like ${value.weatherData!.feelsLikeTemperature.toStringAsFixed(0)} | Sunset ${value.weatherData!.sunsetTime}',
                fontWeight: FontWeight.w400),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _text(
      {required String text,
      double fontSize = 15,
      FontWeight fontWeight = FontWeight.w500}) {
    return GetX<Controller>(
      builder: (Controller controller) => Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: controller.theme.secondary),
      ),
    );
  }
}
