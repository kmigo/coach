import 'package:auto_size_text/auto_size_text.dart';
import 'package:coach/commons/theme.dart';
import 'package:coach/modules/home/domain/entities/thumb_entity.dart';
import 'package:flutter/material.dart';

getWidgetCoverThumb(ThumbEntity thumb, {double? height, double? width}) {
  return Material(
    child: Container(
      color: SystemDesign.fromHex(thumb.color),
      height: height ?? 250,
      width: width ?? 200,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      child: AutoSizeText(
        thumb.title,
        maxLines: 7,
        style: TextStyle(
            fontSize: 35, color: SystemDesign.fromHex(thumb.fontColor)),
      ),
    ),
  );
}
