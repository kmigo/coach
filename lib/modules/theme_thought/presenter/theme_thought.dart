import '../componentes/app_bar_sliver.dart';
import 'package:flutter/material.dart';

class ThemeThoughtPage extends StatefulWidget {
  const ThemeThoughtPage({Key? key}) : super(key: key);

  @override
  _ThemeThoughtPageState createState() => _ThemeThoughtPageState();
}

class _ThemeThoughtPageState extends State<ThemeThoughtPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: AppBarSliver(
                  maxExtended: size.height * .35,
                  minExtended: kToolbarHeight,
                  size: size)),
          /*SliverToBoxAdapter(
            child: BodySliver(size: size),
          ),*/
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Card(
                  child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text('text $index'),
              ));
            },
            childCount: 12,
          )),
        ],
      ),
    );
  }
}
