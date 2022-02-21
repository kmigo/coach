import 'dart:math';

import 'package:flutter/material.dart';

import 'custom_bottom_description.dart';

class DataCutRectangle extends StatelessWidget {
  final Size size;
  final double percent;
  const DataCutRectangle({Key? key, required this.percent, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                child: Text(
                  'Stranger Things',
                  style: TextStyle(
                      fontSize: percent > 0.48 ? 19 : 17,
                      fontWeight:
                          percent > 0.48 ? FontWeight.bold : FontWeight.normal),
                ),
                padding: EdgeInsets.only(
                    left: percent > 0.13
                        ? size.width * pow(percent, 5.5).clamp(0.0, 0.2)
                        : 0,
                    top: size.width *
                        (percent > 0.48
                            ? pow(percent, 10.5).clamp(0.0, 0.13)
                            : 0.0))),
            if (percent < 0.5) ...[
              const SizedBox(
                height: 2,
              ),
              AnimatedOpacity(
                  child: const CustomBottomDescription(),
                  opacity: (1 - pow(percent, 0.001)) + 0.0,
                  duration: const Duration(milliseconds: 200))
            ]
          ],
        ),
        padding: EdgeInsets.only(left: size.width * .34, top: 8));
  }
}
