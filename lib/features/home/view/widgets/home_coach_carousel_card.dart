import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_icons.dart';
import 'package:pogo/core/constants/app_images.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/context_extensions.dart';
import 'package:pogo/core/utils/double_extensions.dart';
import 'package:pogo/shared/widgets/app_icon.dart';
import 'package:pogo/shared/widgets/card_overlay_icon_button.dart';
import 'package:pogo/shared/widgets/primary_button.dart';
import 'package:pogo/shared/widgets/title_subtitle_group.dart';

class HomeCoachCarouselCard extends StatelessWidget {
  const HomeCoachCarouselCard({
    super.key,
    required this.isFavorite,
    required this.name,
    required this.category,
    required this.experience,
    required this.rating,
  });

  final bool isFavorite;
  final String name;
  final String category;
  final String experience;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 285,
      decoration: BoxDecoration(
        borderRadius: AppRadii.m.circular,
        image: DecorationImage(
          image: AssetImage(AppImages.femaleCoach),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppRadii.m.circular,
          gradient: context.appColors.overlayGradient,
        ),
        padding: const EdgeInsets.all(AppSpacing.lg),
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: CardOverlayIconButton(
                AppIcons.heart,
                onPressed: () {},
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TitleSubtitleGroup(
                    title: name,
                    subtitleTextGroup: [category, experience],
                  ),
                ),
                SizedBox(
                  height: 26,
                  child: PrimaryButton.icon(
                    rating.toString(),
                    icon: AppIcon(AppIcons.star, size: AppSpacing.sm),
                    iconAlignment: IconAlignment.end,
                    textStyle: AppTextStyles.bodyMedium14,
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
