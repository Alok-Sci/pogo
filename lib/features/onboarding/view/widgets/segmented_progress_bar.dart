import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/utils/double_extensions.dart';

class SegmentedProgressBar extends StatelessWidget {
  const SegmentedProgressBar({
    super.key,
    required this.activeIndex,
    required this.segmentCount,
    this.segmentSpacing = AppSpacing.smMd,
    this.height = AppSpacing.smMd,
    this.color = Palette.white,
    this.activeColor = Palette.green,
  });

  final double height;
  final int activeIndex;
  final int segmentCount;
  final double segmentSpacing;
  final Color activeColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: segmentSpacing,
      children: List.generate(
          segmentCount,
          (int index) => _Segment(
                height: height,
                color: index == activeIndex ? activeColor : color,
              )),
    );
  }
}

class _Segment extends StatelessWidget {
  const _Segment({
    required this.height,
    required this.color,
  });

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: height,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            borderRadius: AppRadii.full.circular,
          ),
        ),
      ),
    );
  }
}
