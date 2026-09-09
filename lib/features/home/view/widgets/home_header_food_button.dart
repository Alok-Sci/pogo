
import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_icons.dart';
import 'package:pogo/core/constants/app_images.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/utils/context_extensions.dart';
import 'package:pogo/core/utils/double_extensions.dart';
import 'package:pogo/shared/widgets/app_icon.dart';

class HomeHeaderFoodButton extends StatelessWidget {
  const HomeHeaderFoodButton({
    required this.onPressed,
    super.key,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: Palette.green,
        foregroundColor: Palette.black,
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppRadii.full.leftCircular,
        ),
      ),
      child: Row(
        spacing: AppSpacing.md,
        children: [
          Image.asset(
            AppImages.foodBowl,
          ),
          Text(
            "Food",
            style: context.textTheme.titleLarge?.copyWith(color: Palette.black),
          ),
          AppIcon(
            AppIcons.paginationArrows,
            color: Palette.black,
            size: 12,
          ),
        ],
      ),
    );
  }
}