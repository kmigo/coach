import 'package:coach/commons/theme.dart';
import 'package:coach/commons/translations.dart';
import 'package:coach/commons/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

Future<T?> customColorPicker<T>(Color pickerColor,
    {Function(Color)? onColorChanged}) async {
  final context = NavigationService.navigatorKey.currentContext;
  Color? color;
  return await showDialog(
      context: context!,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        Translation.colorPickerTitle,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      ColorPicker(
                          pickerColor: pickerColor,
                          onColorChanged: (_color) {
                            color = _color;
                            if (onColorChanged != null) {
                              onColorChanged(_color);
                            }
                          }),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed: () {},
                                child: Text(Translation.cancel)),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(color);
                                },
                                child: Text(
                                  Translation.ok,
                                  style: const TextStyle(
                                      color: SystemDesign.buttonConfirmColor,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
}
