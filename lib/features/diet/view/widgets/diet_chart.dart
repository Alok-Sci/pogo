import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_icons.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/double_extensions.dart';
import 'package:pogo/core/utils/num_extensions.dart';
import 'package:pogo/features/diet/data/model/diet_meal_model.dart';
import 'package:pogo/features/diet/view/widgets/diet_food_item_tile.dart';
import 'package:pogo/features/diet/view/widgets/diet_meal.dart';
import 'package:pogo/shared/widgets/app_icon.dart';
import 'package:pogo/shared/widgets/divider_or_widget.dart';

class DietChart extends StatelessWidget {
  const DietChart({
    super.key,
    required this.date,
    required this.dietMeals,
    required this.checkedFoodItemIds,
    required this.onFoodItemToggled,
  });

  final String date;
  final List<DietMealModel> dietMeals;
  final Set<String> checkedFoodItemIds;
  final void Function(String) onFoodItemToggled;

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
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                primary: false,
                separatorBuilder: (_, __) {
                  return Column(
                    children: [
                      AppSpacing.xxl.vGap,
                      DividerOrWidget.noText(),
                      AppSpacing.xxl.vGap,
                    ],
                  );
                },
                itemCount: dietMeals.length,
                itemBuilder: (context, index) {
                  final dietMeal = dietMeals[index];
                  return DietMeal(
                    title: dietMeal.title,
                    itemsCount: dietMeal.options.length,
                    itemBuilder: (index) {
                      final foodItem = dietMeal.options[index];
                      final isChecked =
                          checkedFoodItemIds.contains(foodItem.id);

                      return DietFoodItemTile(
                        isChecked: isChecked,
                        imageUrl: foodItem.imageUrl,
                        title: foodItem.name,
                        subtitle: foodItem.servingsInfo,
                        onViewRecipe: () {
                          log("Recipe: ${foodItem.recipeId}");
                        },
                        onTap: (v) {
                          onFoodItemToggled(foodItem.id);
                        },
                      );
                    },
                  );
                },
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
