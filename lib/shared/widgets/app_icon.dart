import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.assetPath, {
    this.size,
    this.blendMode = BlendMode.src,
    super.key,
  });

  final String assetPath;
  final double? size;
  final BlendMode blendMode;

  @override
  Widget build(BuildContext context) {
    final double defaultSize = size ?? 24;

    return RepaintBoundary(
      child: SvgPicture.asset(
        assetPath,
        width: defaultSize,
        height: defaultSize,
        placeholderBuilder: (context) => SizedBox(
          height: defaultSize,
          width: defaultSize,
        ),
      ),
    );
  }
}
