import 'package:coach/components/get_image.dart';
import 'package:coach/components/get_widget_cover.dart';
import 'package:coach/components/modal_bottom_sheet.dart';
import 'package:coach/modules/home/complements/thumb_modal.dart';
import 'package:coach/modules/home/domain/entities/thumb_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Explorer extends StatelessWidget {
  const Explorer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = List.generate(
        3,
        (index) => ThumbEntity(
            id: index,
            color: "#CD5C5C",
            fontColor: "#FFA07A",
            timeToRead: '20:00 min',
            year: '2022',
            title: 'Era uma vez somente um texto',
            backgroundImg: "",
            description: 'sadkfhasjkfhaskjdhklsjdh',
            author: 'sadjfhaskjldfs',
            image: ''));
    return ListView(
      shrinkWrap: true,
      children: [_row("Elas", list, context)],
    );
  }

  _row(String category, List<ThumbEntity> thumbs, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...thumbs
              .map((thumb) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(category),
                        InkWell(
                          onTap: () {
                            modalBottomSheet(
                                context,
                                ThumbModal(
                                  thumb: thumb,
                                  onShowThoughtClick: () {
                                    Navigator.of(context).pop();
                                    Modular.to.pushNamed('transition_thought',
                                        arguments: {'thumb': thumb});
                                  },
                                ));
                          },
                          child: Hero(
                            tag: thumb.id,
                            child: Center(
                              child: SizedBox(
                                  height: 250,
                                  width: 200,
                                  child: thumb.image.isNotEmpty
                                      ? getImageNetwork(thumb.image)
                                      : getWidgetCoverThumb(thumb)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
