// ignore_for_file: file_names

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'flavors.dart';
import 'modules/app_module.dart';
import 'app_widget.dart';

void main() {
  F.appFlavor = Flavor.DEV;
  runApp(ModularApp(
      module: AppModule(),
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const AppWidget(),
      )));
}
