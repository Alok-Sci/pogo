import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/double_extensions.dart';

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
  });

  final String text;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback onPressed;

  factory PrimaryButton.dark(String text, {required VoidCallback onPressed}) {
    return PrimaryButton(
      text,
      backgroundColor: Palette.black,
      onPressed: onPressed,
      padding: const EdgeInsets.all(AppSpacing.xl),
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
        textStyle: AppTextStyles.titleMedium,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadii.full.circular,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(text),
    );
  }
}
