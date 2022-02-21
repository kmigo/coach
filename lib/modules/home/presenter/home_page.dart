import 'package:coach/modules/home/pages/memories.dart';

import '../../../commons/icons_data.dart';
import '../../../commons/translations.dart';
import '../../../modules/home/pages/explorer.dart';
import '../../../modules/home/pages/my_authorship.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(Translation.appBarHome),
          flexibleSpace: Container(),
          titleSpacing: 20,
          bottom: TabBar(
            isScrollable: false,
            tabs: [
              Tab(
                text: Translation.homeTab1,
              ),
              Tab(
                text: Translation.homeTab2,
              ),
              Tab(
                text: Translation.memories,
              ),
            ],
          ),
          actions: [IconButton(onPressed: () {}, icon: IconsApp.settings())],
        ),
        body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [Explorer(), MyAuthorsip(), Memories()]),
      ),
    );
  }
}
