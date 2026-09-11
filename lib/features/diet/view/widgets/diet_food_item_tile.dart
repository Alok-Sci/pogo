
import 'package:flutter/material.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/num_extensions.dart';
import 'package:pogo/shared/widgets/pogo_checkbox.dart';
import 'package:pogo/shared/widgets/primary_button.dart';
import 'package:pogo/shared/widgets/title_subtitle_group.dart';

class DietFoodItemTile extends StatelessWidget {
  const DietFoodItemTile({
    super.key,
    required this.isChecked,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.onViewRecipe,
    required this.onTap,
  });

  final bool isChecked;
  final String imagePath;
  final String title;
  final String subtitle;
  final VoidCallback onViewRecipe;
  final ValueChanged<bool> onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onTap(!isChecked),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PogoCheckBox.dark(value: isChecked),
            AppSpacing.lg.hGap,
            ClipOval(
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                imagePath,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            AppSpacing.lg.hGap,
            Expanded(
              child: TitleSubtitleGroup(
                title: title,
                titleStyle: AppTextStyles.headingSemiBold14,
                subtitle: subtitle,
                subtitleStyle: AppTextStyles.bodyRegular12,
                textColor: Palette.charcoalGrey,
                gap: AppSpacing.xs,
              ),
            ),
            AppSpacing.lg.hGap,
            SizedBox(
              height: 23,
              child: PrimaryButton(
                "View Recipe",
                foregroundColor: Palette.charcoalGrey,
                textStyle: AppTextStyles.bodyMedium12,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.xs,
                ),
                backgroundColor: Palette.warmOffWhite,
                onPressed: onViewRecipe,
              ),
            )
          ],
        ),
      ),
    );
  }
}
