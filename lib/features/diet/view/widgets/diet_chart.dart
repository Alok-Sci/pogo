import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_icons.dart';
import 'package:pogo/core/constants/app_images.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/double_extensions.dart';
import 'package:pogo/features/diet/view/widgets/diet_meal.dart';
import 'package:pogo/shared/widgets/app_icon.dart';
import 'package:pogo/shared/widgets/divider_or_widget.dart';

class DietChart extends StatelessWidget {
  const DietChart({super.key, required this.date});

  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: AppRadii.m.circular,
      ),
      child: Column(
        children: [
          _DietChartHeader(date: date),
          ColoredBox(
            color: Palette.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.lg,
              ),
              child: Column(
                spacing: AppSpacing.xxl,
                children: [
                  DietMeal(
                    title: "Breakfast",
                    meals: [
                      DietMealData(
                        isChecked: false,
                        imagePath: AppImages.meal,
                        title: "Vegetable oats",
                        subtitle: "2 pieces + 2 tbsp",
                      ),
                      DietMealData(
                        isChecked: false,
                        imagePath: AppImages.meal,
                        title: "Vegetable oats",
                        subtitle: "2 pieces + 2 tbsp",
                      ),
                    ],
                    onViewRecipe: () {},
                  ),
                  DividerOrWidget.noText(),
                  DietMeal(
                    title: "Snack",
                    meals: [
                      DietMealData(
                        isChecked: false,
                        imagePath: AppImages.meal,
                        title: "Vegetable oats",
                        subtitle: "2 pieces + 2 tbsp",
                      ),
                      DietMealData(
                        isChecked: false,
                        imagePath: AppImages.meal,
                        title: "Vegetable oats",
                        subtitle: "2 pieces + 2 tbsp",
                      ),
                    ],
                    onViewRecipe: () {},
                  ),
                  DividerOrWidget.noText(),
                  DietMeal(
                    title: "Lunch",
                    meals: [
                      DietMealData(
                        isChecked: false,
                        imagePath: AppImages.meal,
                        title: "Vegetable oats",
                        subtitle: "2 pieces + 2 tbsp",
                      ),
                      DietMealData(
                        isChecked: false,
                        imagePath: AppImages.meal,
                        title: "Vegetable oats",
                        subtitle: "2 pieces + 2 tbsp",
                      ),
                    ],
                    onViewRecipe: () {},
                  ),
                  DividerOrWidget.noText(),
                  DietMeal(
                    title: "Dinner",
                    meals: [
                      DietMealData(
                        isChecked: false,
                        imagePath: AppImages.meal,
                        title: "Vegetable oats",
                        subtitle: "2 pieces + 2 tbsp",
                      ),
                      DietMealData(
                        isChecked: false,
                        imagePath: AppImages.meal,
                        title: "Vegetable oats",
                        subtitle: "2 pieces + 2 tbsp",
                      ),
                    ],
                    onViewRecipe: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DietChartHeader extends StatelessWidget {
  const _DietChartHeader({
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Palette.charcoalGrey,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          spacing: AppSpacing.md,
          children: [
            AppIcon(
              AppIcons.calendar,
              size: 18,
              color: Palette.warmOffWhite,
            ),
            Text(
              date,
              style: AppTextStyles.labelSemiBold12.copyWith(
                color: Palette.warmOffWhite,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DietMealData {
  const DietMealData({
    required this.isChecked,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  final bool isChecked;
  final String imagePath;
  final String title;
  final String subtitle;
}
