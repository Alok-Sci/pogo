
import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_icons.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/shared/widgets/app_icon.dart';
import 'package:pogo/shared/widgets/body_text.dart';
import 'package:pogo/shared/widgets/pogo_card.dart';

class PogoInfoCard extends StatelessWidget {
  const PogoInfoCard(
    this.text, {
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return PogoCard.dark(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSpacing.lg,
        children: [
          AppIcon(
            AppIcons.info,
            size: 20,
          ),
          Expanded(
            child: BodyText(
              text,
              color: Palette.warmOffWhite,
            ),
          )
        ],
      ),
    );
  }
}