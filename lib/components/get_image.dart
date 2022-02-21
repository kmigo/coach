import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget getImageNetwork(url, {double? height, double? width, BoxFit? fit}) {
  return Image.network(
    url,
    loadingBuilder: (context, child, isLoading) => isLoading == null
        ? child
        : Center(
            child: Shimmer.fromColors(
            baseColor: Colors.white70,
            highlightColor: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(15)),
              height: height ?? 250,
              width: width ?? 200,
            ),
          )),
    fit: fit,
    height: height,
    width: width,
  );
}
