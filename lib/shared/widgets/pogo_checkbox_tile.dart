
import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/double_extensions.dart';
import 'package:pogo/core/utils/num_extensions.dart';
import 'package:pogo/shared/widgets/pogo_checkbox.dart';

class PogoCheckBoxTile extends StatelessWidget {
  const PogoCheckBoxTile({
    required this.isChecked,
    required this.title,
    required this.subtitle,
    required this.onChanged,
    super.key,
  });

  final bool isChecked;
  final String title;
  final String subtitle;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Palette.lightStoneGrey),
        borderRadius: AppRadii.m.circular,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      child: Row(
        spacing: AppSpacing.xxlMd,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.headingSemiBold14,
                ),
                AppSpacing.xs2.vGap,
                Text(
                  subtitle,
                  style: AppTextStyles.bodyMedium12,
                )
              ],
            ),
          ),
          PogoCheckBox(
            value: isChecked,
            onTap: onChanged,
          ),
        ],
      ),
    );
  }
}