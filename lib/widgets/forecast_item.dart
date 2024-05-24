import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForecastItem extends StatelessWidget {
  final String time;
  final int temperature;
  const ForecastItem({super.key, required this.time, required this.temperature});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _text(time),
        Row(
          children: [
            SvgPicture.asset('assets/icons/clouds.svg',
                width: 13,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
            _spacer(),
            _text(temperature.toString()),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SvgPicture.asset('assets/icons/degrees.svg',
                  width: 3,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
            ),
          ],
        )
      ],
    );
  }

  Widget _text(String text) {
    return Text(text,
        style: const TextStyle(fontSize: 13, color: Colors.white));
  }

  Widget _spacer() {
    return const SizedBox(width: 4);
  }
}
