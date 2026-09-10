
import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_icons.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/utils/context_extensions.dart';
import 'package:pogo/core/utils/double_extensions.dart';
import 'package:pogo/shared/widgets/card_overlay_icon_button.dart';
import 'package:pogo/shared/widgets/title_subtitle_group.dart';

class HomeStoryCard extends StatelessWidget {
  const HomeStoryCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.category,
    required this.onPressed,
  });

  final String imageUrl;
  final String name;
  final String category;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: AppRadii.m.circular,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Container(
        decoration: BoxDecoration(
          gradient: context.appColors.overlayGradient,
        ),
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: CardOverlayIconButton(
                AppIcons.playCicle,
                size: 24,
                onPressed: () {},
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.zero,
              ),
            ),
            TitleSubtitleGroup(
              title: name,
              subtitle: category,
            ),
          ],
        ),
      ),
    );
  }
}
