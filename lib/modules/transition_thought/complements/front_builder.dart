import '../../../components/get_image.dart';
import '../../../components/get_widget_cover.dart';
import '../../../components/linear_gradient.dart';
import 'package:coach/modules/home/domain/entities/thumb_entity.dart';

import 'package:flutter/material.dart';

class FronBuilderThumb extends StatelessWidget {
  final ThumbEntity thumb;
  const FronBuilderThumb({Key? key, required this.thumb}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: thumb.id,
      child: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: thumb.image.isNotEmpty
                ? getImageNetwork(thumb.image,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover)
                : getWidgetCoverThumb(thumb,
                    height: double.infinity, width: double.infinity),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: linerGradientDecoration(
                colors: [Colors.black87, Colors.transparent]),
          ),
          Container(
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Expanded(child: Container()),
                  const CircularProgressIndicator(),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
