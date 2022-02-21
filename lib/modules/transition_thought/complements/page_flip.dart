import 'dart:math';

import 'package:flutter/material.dart';

class PageFlipBuilder extends StatefulWidget {
  final WidgetBuilder frontBuilder;
  final WidgetBuilder backBuilder;
  const PageFlipBuilder(
      {Key? key, required this.backBuilder, required this.frontBuilder})
      : super(key: key);

  @override
  PageFlipBuilderState createState() => PageFlipBuilderState();
}

class PageFlipBuilderState extends State<PageFlipBuilder>
    with SingleTickerProviderStateMixin {
  bool _showFrontSide = true;
  late final AnimationController _controller;
  void flip() {
    if (_showFrontSide) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _controller.addStatusListener(_updateStatus);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_updateStatus);
    super.dispose();
  }

  _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed ||
        status == AnimationStatus.dismissed) {
      setState(() {
        _showFrontSide = !_showFrontSide;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPageFlipBuilder(
        animation: _controller,
        backBuilder: widget.backBuilder,
        frontBuilder: widget.frontBuilder,
        showFrontSide: _showFrontSide);
  }
}

class AnimatedPageFlipBuilder extends StatelessWidget {
  final Animation<double> animation;
  final bool showFrontSide;
  final WidgetBuilder frontBuilder;
  final WidgetBuilder backBuilder;
  const AnimatedPageFlipBuilder(
      {Key? key,
      required this.animation,
      required this.backBuilder,
      required this.frontBuilder,
      required this.showFrontSide})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          final isAnimationFirstHalf = animation.value.abs() < 0.5;
          final child = isAnimationFirstHalf
              ? frontBuilder(context)
              : backBuilder(context);
          final rotationValue = animation.value * pi;
          final rotationAngle =
              animation.value > 0.5 ? pi - rotationValue : rotationValue;
          var tilt = (animation.value - 0.5).abs() - 0.5;
          tilt *= isAnimationFirstHalf ? -0.003 : 0.003;
          return Transform(
            transform: Matrix4.rotationY(rotationAngle)..setEntry(3, 0, tilt),
            child: child,
            alignment: Alignment.center,
          );
        });
  }
}
