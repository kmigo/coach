// ignore_for_file: sized_box_for_whitespace

import 'dart:math';

import '../../../commons/assets_app.dart';
import '../../../components/get_image.dart';
import '../../../modules/theme_thought/presenter/bloc.dart';

import 'package:flutter_modular/flutter_modular.dart';

import '../componentes/button_back.dart';
import '../componentes/cover_photo.dart';
import '../componentes/cut_rectangle.dart';
import '../componentes/data_cut_rectangle.dart';
import 'package:flutter/material.dart';

import '../../../components/linear_gradient.dart';

class AppBarSliver extends SliverPersistentHeaderDelegate {
  final double maxExtended;
  final double minExtended;
  final Size size;
  AppBarSliver({
    required this.maxExtended,
    required this.minExtended,
    required this.size,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final thumb = Modular.get<BlocThemeThoght>().thumb();
    final percent = shrinkOffset / maxExtended;
    const uploadLimit = 13 / 100;
    final valueback = (1 - percent - 0.77).clamp(0, uploadLimit);
    final fixrotation = pow(percent, 1.5);
    final card = _CoverCard(
      size: size,
      percent: percent,
      uploadLimit: uploadLimit,
      valueback: valueback,
    );

    final _bottomSliverBar = _CustomBottomSliverBar(
        size: size, fixrotation: fixrotation, percent: percent);
    return SizedBox(
      child: Stack(
        children: [
          Container(
            child: thumb.backgroundImg.isEmpty
                ? Image.asset(
                    AssetsApp.backgroundThoughtPage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )
                : getImageNetwork(thumb.backgroundImg,
                    fit: BoxFit.cover, width: double.infinity),
          ),
          Container(
            decoration: linerGradientDecoration(),
          ),
          if (percent > uploadLimit) ...[
            card,
            _bottomSliverBar
          ] else ...[
            _bottomSliverBar,
            card
          ],
          ButtonBack(percent: percent, size: size)
        ],
      ),
    );
  }

  @override
  double get maxExtent => maxExtended;

  @override
  double get minExtent => minExtended;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class _CoverCard extends StatelessWidget {
  final Size size;
  final double percent;
  final angleForCard = 6.5;
  final double uploadLimit;
  final num valueback;
  const _CoverCard(
      {Key? key,
      required this.size,
      required this.uploadLimit,
      required this.percent,
      required this.valueback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: size.height * .15,
        left: size.width / 24,
        child: Transform(
            alignment: Alignment.topRight,
            transform: Matrix4.identity()
              ..rotateZ(percent > uploadLimit
                  ? (valueback * angleForCard)
                  : percent * angleForCard),
            child: CoverPhoto(size: size)));
  }
}

class _CustomBottomSliverBar extends StatelessWidget {
  final Size size;
  final num fixrotation;
  final double percent;
  const _CustomBottomSliverBar(
      {Key? key,
      required this.size,
      required this.fixrotation,
      required this.percent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: -size.width * fixrotation.clamp(0, .35),
        right: 0,
        child: _CustomBottomSliver(
          size: size,
          percent: percent,
        ));
  }
}

class _CustomBottomSliver extends StatelessWidget {
  const _CustomBottomSliver(
      {Key? key, required this.size, required this.percent})
      : super(key: key);

  final Size size;
  final double percent;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * .12,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CustomPaint(
              painter: CutRectangle(),
            ),
            DataCutRectangle(percent: percent, size: size)
          ],
        ));
  }
}
