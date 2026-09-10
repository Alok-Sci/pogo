import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/utils/double_extensions.dart';

class PogoCard extends StatelessWidget {
  const PogoCard({
    super.key,
    required this.child,
    this.color,
    this.padding,
  });

  final Color? color;
  final Widget child;
  final EdgeInsets? padding;

  factory PogoCard.dark({required Widget child}) => PogoCard(
        color: Palette.black,
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: color ?? Palette.white,
        borderRadius: AppRadii.m.circular,
      ),
      child: child,
    );
  }
}
