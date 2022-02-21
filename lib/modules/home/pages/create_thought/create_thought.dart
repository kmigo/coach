import 'package:coach/components/get_widget_cover.dart';
import 'package:coach/modules/home/pages/create_thought/presenter/presenter_create_thought.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../../modules/home/data/dto/thumb_dto.dart';
import 'presenter/controller_create_thought.dart';

class CreateThought extends StatefulWidget {
  const CreateThought({Key? key}) : super(key: key);

  @override
  _CreateThoughtState createState() => _CreateThoughtState();
}

class _CreateThoughtState extends State<CreateThought>
    with ContractCreateThought {
  late final CreateThoughtStore _controller;
  @override
  void initState() {
    _controller = CreateThoughtStore(PresenterCreateThought(this));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _spacing(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _backButton(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.check))
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Observer(builder: (_) {
                      return Center(
                        child: getWidgetCoverThumb(_controller.thumbEntity),
                      );
                    }),
                    _spacing(height: 15),
                    TextFormField(
                      maxLength: 50,
                      decoration: const InputDecoration(hintText: 'title'),
                      onChanged: (value) => _controller.handlerThumbEntity(
                          _controller.thumbEntity.copyWith(title: value)),
                    ),
                    TextFormField(
                      maxLength: 250,
                      decoration:
                          const InputDecoration(hintText: 'description'),
                      onChanged: (value) => _controller.handlerThumbEntity(
                          _controller.thumbEntity.copyWith(title: value)),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  _backButton() => IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.arrow_back));

  _spacing({double height = 0, double width = 0}) => SizedBox(
        height: height,
        width: width,
      );

  @override
  failure(String text) {}

  @override
  refresh() {
    setState(() {});
  }

  @override
  success() {}
}
