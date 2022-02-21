import 'package:flutter/material.dart';

BoxDecoration linerGradientDecoration(
    {List<Color>? colors, List<double>? stops}) {
  return BoxDecoration(
      gradient: LinearGradient(
          colors: colors ?? [Colors.black, Colors.transparent],
          stops: stops ?? [0.1, 1],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter));
}
