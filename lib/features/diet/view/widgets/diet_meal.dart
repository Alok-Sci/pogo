
import 'package:flutter/material.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/utils/num_extensions.dart';
import 'package:pogo/features/diet/view/widgets/diet_chart.dart';
import 'package:pogo/features/diet/view/widgets/diet_food_item_tile.dart';
import 'package:pogo/shared/widgets/divider_or_widget.dart';
import 'package:pogo/shared/widgets/title_subtitle_group.dart';

class DietMeal extends StatelessWidget {
  const DietMeal({
    super.key,
    required this.title,
    required this.meals,
    required this.onViewRecipe,
  });

  final String title;
  final List<DietMealData> meals;
  final VoidCallback onViewRecipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleSubtitleGroup(
          title: title,
          textColor: Palette.charcoalGrey,
        ),
        AppSpacing.lgMd.vGap,
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: meals.length,
          separatorBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.lgMd),
            child: DividerOrWidget.capitalized(),
          ),
          itemBuilder: (context, index) {
            final meal = meals[index];
            return DietFoodItemTile(
              isChecked: meal.isChecked,
              imagePath: meal.imagePath,
              title: meal.title,
              subtitle: meal.subtitle,
              onViewRecipe: onViewRecipe,
              onTap: (v) {},
            );
          },
        ),
      ],
    );
  }
}
