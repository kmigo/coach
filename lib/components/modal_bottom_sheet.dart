import 'dart:io';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<T> modalBottomSheet<T>(BuildContext context, Widget child) async {
  if (Platform.isIOS) {
    return await showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => child,
    );
  } else {
    return await showMaterialModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: child,
      ),
    );
  }
}
