import 'package:flutter/material.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/shared/widgets/app_icon.dart';

enum CircularIconType { image, icon }

class CircularIconButton extends StatelessWidget {
  CircularIconButton({
    required this.onPressed,
    required this.iconPath,
    this.iconSize,
    this.iconType = CircularIconType.icon,
    required this.radius,
    this.backgroundColor,
    this.foregroundColor,
    this.padding = const EdgeInsets.all(
      AppSpacing.md,
    ),
    super.key,
  }) : assert(
          iconType == CircularIconType.icon
              ? iconPath.contains('assets/icons')
              : iconPath.contains('assets/images'),
          iconType == CircularIconType.icon
              ? 'iconPath must contain "assets/icons" when iconType is CircularIconType.icon'
              : 'iconPath must contain "assets/images" when iconType is CircularIconType.image',
        );

  final VoidCallback onPressed;
  final double radius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String iconPath;
  final double? iconSize;
  final EdgeInsets padding;
  final CircularIconType iconType;

  @override
  Widget build(BuildContext context) {
    final Color defaultBackgroundColor =
        backgroundColor ?? Palette.white.withValues(alpha: 0.14);
    final Color defaultForegroundColor =
        foregroundColor ?? Palette.white.withValues(alpha: 0.3);

    final icon = iconType == CircularIconType.image
        ? Image.asset(
            iconPath,
            height: iconSize,
            width: iconSize,
          )
        : AppIcon(iconPath, size: iconSize);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: radius,
        decoration: BoxDecoration(
          color: defaultBackgroundColor,
          border: Border.all(
            color: defaultForegroundColor,
          ),
          shape: BoxShape.circle,
        ),
        padding: padding,
        child: icon,
      ),
    );
  }
}
