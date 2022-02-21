import 'package:flutter/material.dart';

const colorPrimary = Colors.deepOrangeAccent;
const colorAccent = Colors.orange;

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class SystemDesign {
  static const primary = colorPrimary;
  static const accent = colorAccent;
  static const accentLight = Colors.orangeAccent;
  static const primaryTextColor = Colors.white;
  static const shadowBlack12 = Colors.black12;
  static const shadowBlack54 = Colors.black54;
  static const buttonConfirmColor = Colors.brown;
  static Color fromHex(String hex) {
    return HexColor.fromHex(hex);
  }
}

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: colorPrimary,
    scaffoldBackgroundColor: Colors.white,
    tabBarTheme: const TabBarTheme(
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 5, color: Colors.white)),
      labelColor: Colors.orange,
      unselectedLabelColor: Colors.white70,
      indicatorSize: TabBarIndicatorSize.tab,
    ),
    /*appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        color: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black)),*/
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: colorAccent),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
            backgroundColor: MaterialStateProperty.all<Color>(colorAccent))),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.withOpacity(.1)));

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    tabBarTheme: const TabBarTheme(
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 5, color: Colors.orange)),
      labelColor: Colors.orange,
      unselectedLabelColor: Colors.white70,
      indicatorSize: TabBarIndicatorSize.tab,
    ),
    colorScheme: const ColorScheme.dark(primary: Colors.white),
    switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all<Color>(Colors.grey),
        thumbColor: MaterialStateProperty.all<Color>(Colors.white)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          overlayColor: MaterialStateProperty.all<Color>(Colors.black26)),
    ),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey.withOpacity(.1)));
