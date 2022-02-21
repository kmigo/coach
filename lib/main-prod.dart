// ignore_for_file: file_names

import 'package:coach/modules/app_module.dart';
import 'package:coach/app_widget.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.PROD;
  runApp(ModularApp(
      module: AppModule(),
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const AppWidget(),
      )));
}
