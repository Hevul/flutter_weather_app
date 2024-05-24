import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weather/controller/controller.dart';

class Temperature extends StatelessWidget {
  final int temperature;

  const Temperature({super.key, required this.temperature});

  @override
  Widget build(BuildContext context) {
    return GetX<Controller>(
      builder: (Controller controller) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          SvgPicture.asset('assets/icons/clouds.svg',
              width: 80,
              colorFilter: ColorFilter.mode(
                  controller.theme.secondary, BlendMode.srcIn)),
          const Spacer(),
          Text(
            temperature.toString(),
            style: TextStyle(
                fontSize: 84,
                fontWeight: FontWeight.w500,
                color: controller.theme.secondary),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 76),
            child: SvgPicture.asset('assets/icons/degrees.svg',
                width: 13,
                colorFilter: ColorFilter.mode(
                    controller.theme.secondary, BlendMode.srcIn)),
          ),
          const Spacer(
            flex: 3,
          )
        ],
      ),
    );
  }
}
