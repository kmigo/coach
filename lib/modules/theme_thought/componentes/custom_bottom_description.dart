import 'package:flutter/material.dart';

class CustomBottomDescription extends StatelessWidget {
  const CustomBottomDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
            'Drama fantasy science fiction sdfsagfjadsgfjhasgdfj sagdsdfjkashdkjfhsdk',
            overflow: TextOverflow.ellipsis),
        SizedBox(
          height: 2,
        ),
        Text('Mystery adventure')
      ],
    );
  }
}
