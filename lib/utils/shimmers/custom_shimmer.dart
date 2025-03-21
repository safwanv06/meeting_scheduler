import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../main.dart';

class ShimmerEffect extends StatelessWidget {
  ShimmerEffect.rectangle({
    super.key,
    required this.width,
    required this.height,
  }) : shapeDecoration = RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(appSize.radius8)));

  ShimmerEffect.circle(
      {super.key,
      required this.width,
      required this.height,
      required this.shapeDecoration});

  double width;
  double height;
  ShapeBorder shapeDecoration;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: appColors.grey36454F,
        highlightColor: appColors.grey36454F.withValues(alpha: 0.8),
        enabled: true,
        child: Container(
          width: width,
          height: height,
          decoration:
              ShapeDecoration(color: Colors.white, shape: shapeDecoration),
        ));
  }
}
