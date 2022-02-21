import 'package:coach/commons/icons_data.dart';
import 'package:coach/commons/theme_manager.dart';
import 'package:coach/commons/translations.dart';
import 'package:coach/components/get_image.dart';
import 'package:coach/components/get_widget_cover.dart';
import 'package:coach/modules/home/domain/entities/thumb_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ThumbModal extends StatelessWidget {
  final ThumbEntity thumb;

  final Function()? onShowThoughtClick;

  const ThumbModal({Key? key, required this.thumb, this.onShowThoughtClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Modular.get<ThemeManager>().themeMode == ThemeMode.dark;
    return Material(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: isDark ? Colors.grey[900] : Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [_image(), _info(isDark, context)],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                " - ${thumb.author} -",
                style:
                    TextStyle(color: isDark ? Colors.white70 : Colors.black87),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: onShowThoughtClick,
                    child: Text(Translation.showThought)),
                TextButton.icon(
                    onPressed: () {},
                    icon: IconsApp.add(),
                    label: Text(Translation.memories))
              ],
            )
          ],
        ),
      ),
    );
  }

  _image() {
    return thumb.image.isNotEmpty
        ? getImageNetwork(thumb.image, height: 150, width: 100)
        : getWidgetCoverThumb(thumb, height: 150, width: 100);
  }

  _info(bool isDark, BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 2.0, left: 8, bottom: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  thumb.title,
                  maxLines: 2,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                )),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.cancel))
              ],
            ),
            Row(
              children: [
                Text(
                  thumb.year,
                  style: TextStyle(
                      color: isDark ? Colors.white70 : Colors.black87),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Modular.to.pop();
                  },
                  child: Icon(Icons.book,
                      color: isDark ? Colors.white70 : Colors.black87),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  thumb.timeToRead,
                  style: TextStyle(
                      color: isDark ? Colors.white70 : Colors.black87),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(child: Text(thumb.description))
          ],
        ),
      ),
    );
  }
}
