
import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/context_extensions.dart';
import 'package:pogo/core/utils/double_extensions.dart';
import 'package:pogo/core/utils/num_extensions.dart';
import 'package:pogo/shared/widgets/primary_button.dart';

class PogoBanner extends StatelessWidget {
  const PogoBanner({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onButtonPressed,
    this.backgroundColor = Palette.white,
    this.foregroundColor = Palette.charcoalGrey,
    this.buttonColor = Palette.black,
    this.trailing,
    super.key,
  });

  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final Widget? trailing;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color buttonColor;

  factory PogoBanner.dark({
    required String title,
    required String subtitle,
    required String buttonText,
    required VoidCallback onButtonPressed,
    Widget? trailing,
    Key? key,
  }) {
    return PogoBanner(
      title: title,
      subtitle: subtitle,
      buttonText: buttonText,
      onButtonPressed: onButtonPressed,
      backgroundColor: Palette.black,
      foregroundColor: Palette.white,
      buttonColor: Palette.green,
      trailing: trailing,
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
      ),
      decoration: BoxDecoration(
        borderRadius: AppRadii.m.circular,
        color: backgroundColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: context.textTheme.labelLarge
                        ?.copyWith(color: foregroundColor),
                  ),
                  AppSpacing.lgMd.vGap,
                  SizedBox(
                    width: 196,
                    child: Expanded(
                      child: Text(
                        subtitle,
                        style: AppTextStyles.bodyMedium12
                            .copyWith(color: foregroundColor),
                      ),
                    ),
                  ),
                  AppSpacing.lgMd.vGap,
                  SizedBox(
                    height: 30,
                    child: PrimaryButton(
                      buttonText,
                      backgroundColor: buttonColor,
                      onPressed: onButtonPressed,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.xxl,
                        vertical: AppSpacing.sm,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          trailing ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
