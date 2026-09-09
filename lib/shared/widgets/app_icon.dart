import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.assetPath, {
    this.size,
    this.color,
    this.blendMode = BlendMode.srcIn,
    super.key,
  });

  final String assetPath;
  final double? size;
  final Color? color;
  final BlendMode blendMode;

  @override
  Widget build(BuildContext context) {
    final double defaultSize = size ?? 24;

    return RepaintBoundary(
      child: SvgPicture.asset(
        assetPath,
        width: defaultSize,
        height: defaultSize,
        colorFilter: color != null ? ColorFilter.mode(color!, blendMode) : null,
        placeholderBuilder: (context) => SizedBox(
          height: defaultSize,
          width: defaultSize,
        ),
      ),
    );
  }
}
