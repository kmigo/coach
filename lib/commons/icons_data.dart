import 'package:flutter/material.dart';

class IconsApp {
  static settings({double? size}) => _icon(Icons.settings, size: size);
  static add({double? size}) => _icon(Icons.add, size: size);
  static _icon(icon, {double? size, Color? color}) => Icon(
        icon,
        size: size,
        color: color ?? Colors.black,
      );
  static colorLens({double? size, Color? color}) =>
      _icon(Icons.color_lens, size: size, color: color);
}
