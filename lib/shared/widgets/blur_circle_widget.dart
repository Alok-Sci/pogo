import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pogo/core/theme/app_palette.dart';

class BlurCircleWidget extends StatelessWidget {
  const BlurCircleWidget({super.key, required this.radius});
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 280, sigmaY: 280),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Palette.white.withAlpha(127),
      ),
    );
  }
}
