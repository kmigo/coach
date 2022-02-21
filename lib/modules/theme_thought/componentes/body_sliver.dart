import 'package:flutter/material.dart';

class BodySliver extends StatelessWidget {
  final Size size;
  const BodySliver({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ...List.generate(
              3,
              (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.orange,
                      height: 150,
                      width: 200,
                    ),
                  )).toList()
        ],
      ),
    );
  }
}
