import '../../../components/get_image.dart';
import '../../../components/get_widget_cover.dart';
import '../../theme_thought/presenter/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoverPhoto extends StatelessWidget {
  final Size size;
  const CoverPhoto({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final thumb = Modular.get<BlocThemeThoght>().thumb();
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      width: size.width * .27,
      height: size.height * .18,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: thumb.image.isNotEmpty
            ? getImageNetwork(thumb.image,
                height: size.width * .18, width: size.width * .27)
            : getWidgetCoverThumb(thumb,
                height: size.width * .18, width: size.width * .27),
      ),
    );
  }
}
