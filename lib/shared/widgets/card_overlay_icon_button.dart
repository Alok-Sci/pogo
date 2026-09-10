import 'package:flutter/material.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/shared/widgets/app_icon.dart';

class CardOverlayIconButton extends StatelessWidget {
  const CardOverlayIconButton(
    this.iconPath, {
    super.key,
    required this.onPressed,
    this.size = AppSpacing.lg,
    this.padding = const EdgeInsets.all(AppSpacing.md),
    this.backgroundColor,
  });

  final String iconPath;
  final VoidCallback onPressed;
  final double size;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: AppIcon(
        iconPath,
      ),
      style: IconButton.styleFrom(
        padding: padding,
        backgroundColor:
            backgroundColor ?? Palette.charcoalGrey.withValues(alpha: 0.4),
        foregroundColor: Palette.mutedGold,
        iconSize: size,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
