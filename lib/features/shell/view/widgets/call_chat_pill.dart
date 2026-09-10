import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_icons.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/context_extensions.dart';
import 'package:pogo/core/utils/num_extensions.dart';
import 'package:pogo/shared/widgets/circular_icon_button.dart';

class CallChatPill extends StatelessWidget {
  const CallChatPill({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppSpacing.sm).copyWith(right: AppSpacing.lg),
        decoration: BoxDecoration(
          color: Palette.green,
          borderRadius: BorderRadius.circular(AppRadii.full),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularIconButton(
              onPressed: () {},
              iconPath: AppIcons.callChat,
              radius: 40,
              padding: EdgeInsets.all(AppSpacing.sm),
              iconSize: 28,
              gradient: context.appColors.navbarGradient,
            ),
            AppSpacing.sm.hGap,
            Text(
              'Call or Chat',
              style: AppTextStyles.labelSemiBold12.copyWith(
                color: Palette.warmOffWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
