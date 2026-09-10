import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/double_extensions.dart';
import 'package:pogo/core/utils/num_extensions.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
    this.text, {
    super.key,
    required this.onPressed,
    this.backgroundColor = Palette.green,
    this.foregroundColor = Palette.warmOffWhite,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.lgMd,
      vertical: AppSpacing.smMd,
    ),
    this.textStyle,
    this.leading,
    this.trailing,
    this.gap = AppSpacing.sm,
  });

  final String text;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final Widget? leading;
  final Widget? trailing;
  final double gap;

  factory PrimaryButton.dark(
    String text, {
    required VoidCallback onPressed,
    TextStyle? textStyle,
  }) {
    return PrimaryButton(
      text,
      backgroundColor: Palette.black,
      onPressed: onPressed,
      padding: const EdgeInsets.all(AppSpacing.xl),
      textStyle: textStyle,
    );
  }

  factory PrimaryButton.icon(
    String text, {
    required Widget icon,
    required VoidCallback onPressed,
    IconAlignment iconAlignment = IconAlignment.start,
    TextStyle? textStyle,
    double gap = AppSpacing.sm,
  }) {
    return PrimaryButton(
      text,
      onPressed: onPressed,
      padding: const EdgeInsets.all(AppSpacing.xl),
      textStyle: textStyle,
      leading: iconAlignment == IconAlignment.start ? icon : null,
      trailing: iconAlignment == IconAlignment.end ? icon : null,
      gap: gap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: 0,
        padding: padding,
        textStyle: textStyle ?? AppTextStyles.titleMedium,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadii.full.circular,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leading != null) ...[leading!, gap.hGap],
          Text(text),
          if (trailing != null) ...[gap.hGap, trailing!],
        ],
      ),
    );
  }
}
