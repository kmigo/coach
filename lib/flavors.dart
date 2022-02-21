// ignore_for_file: constant_identifier_names

enum Flavor {
  DEV,
  PROD,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'COACH PROD';
      case Flavor.PROD:
        return 'COACH PROD';
      default:
        return 'title';
    }
  }
}
