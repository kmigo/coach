import 'package:coach/commons/utils.dart';
import 'package:flutter/material.dart';

Future<T?> customShowModalBottomSheet<T>(Widget child) async {
  final context = NavigationService.navigatorKey.currentContext;
  return await showModalBottomSheet(
      isScrollControlled: true, context: context!, builder: (context) => child);
}
