import 'package:coach/modules/home/complements/bottom_sheet_create_thought.dart';
import 'package:flutter/material.dart';

class MyAuthorsip extends StatelessWidget {
  const MyAuthorsip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: bottomSheetCreateThought,
        child: Icon(Icons.add),
      ),
    );
  }
}
