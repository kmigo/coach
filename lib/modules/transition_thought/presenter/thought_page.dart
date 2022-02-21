import '../../../modules/transition_thought/complements/front_builder.dart';

import '../../../modules/transition_thought/complements/page_flip.dart';

import './/modules/home/domain/entities/thumb_entity.dart';
import '../../theme_thought/presenter/theme_thought.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ThoughtPage extends StatefulWidget {
  const ThoughtPage({Key? key}) : super(key: key);

  @override
  _ThoughtPageState createState() => _ThoughtPageState();
}

class _ThoughtPageState extends State<ThoughtPage> {
  final pageFlipKey = GlobalKey<PageFlipBuilderState>();
  late final ThumbEntity thumb;
  @override
  void initState() {
    super.initState();
    thumb = Modular.args.data['thumb'];
    Future.delayed(const Duration(seconds: 1))
        .then((value) => pageFlipKey.currentState?.flip());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageFlipBuilder(
          key: pageFlipKey,
          frontBuilder: (_) => FronBuilderThumb(thumb: thumb),
          backBuilder: (_) => const ThemeThoughtPage()),
    );
  }
}
