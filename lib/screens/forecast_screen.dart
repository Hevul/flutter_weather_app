import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/controller/controller.dart';
import 'package:weather/widgets/export.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GetX<Controller>(
        init: Controller(),
        builder: (Controller controller) {
          if (controller.weatherData == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            body: Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(controller.theme.image),
                      fit: BoxFit.fill)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.07),
                    const PrimaryInfoPanel(),
                    SizedBox(height: size.height * 0.04),
                    const SecondaryInfoPanel(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
