import 'package:coach/commons/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ButtonBack extends StatelessWidget {
  final Size size;
  final double percent;
  const ButtonBack({Key? key, required this.percent, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).padding.top,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back,
              size: 30,
              color: percent < .56
                  ? Colors.white.withOpacity(1 - percent)
                  : Modular.get<ThemeManager>().themeMode == ThemeMode.dark
                      ? Colors.white
                      : Colors.black),
        ));
  }
}
