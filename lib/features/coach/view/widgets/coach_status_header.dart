import 'package:flutter/material.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/context_extensions.dart';
import 'package:pogo/core/utils/num_extensions.dart';
import 'package:pogo/shared/widgets/pogo_card.dart';
import 'package:pogo/shared/widgets/primary_button.dart';

class CoachStatusHeader extends StatelessWidget {
  const CoachStatusHeader({
    super.key,
    required this.name,
    required this.education,
    required this.status,
  });

  final String name;
  final String education;
  final String status;

  @override
  Widget build(BuildContext context) {
    return PogoCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: context.textTheme.labelLarge,
                ),
                AppSpacing.lgMd.vGap,
                Text(
                  education,
                  style: AppTextStyles.bodyMedium12,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
            child: PrimaryButton(
              status,
              onPressed: () {},
              gap: AppSpacing.xs,
              foregroundColor: Palette.deepForestGreen,
              backgroundColor: Palette.lightStoneGrey,
              textStyle: AppTextStyles.bodyMedium14,
              leading: CircleAvatar(
                backgroundColor: Palette.accentGreen,
                radius: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}