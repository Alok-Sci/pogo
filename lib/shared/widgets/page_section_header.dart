
import 'package:flutter/material.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/context_extensions.dart';
import 'package:pogo/shared/widgets/primary_button.dart';

class PageSectionHeader extends StatelessWidget {
  const PageSectionHeader({
    required this.title,
    this.buttonText,
    this.onButtonPressed,
    this.padding,
    super.key,
  });

  final String title;
  final EdgeInsets? padding;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    final hasButton = buttonText != null && onButtonPressed != null;

    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: context.textTheme.labelLarge),
          Spacer(),
          if (hasButton)
            _SectionHeaderTrailingButton(
              text: buttonText,
              onPressed: onButtonPressed,
            )
        ],
      ),
    );
  }
}

class _SectionHeaderTrailingButton extends StatelessWidget {
  const _SectionHeaderTrailingButton({
    required this.text,
    required this.onPressed,
  });

  final String? text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: PrimaryButton(
        text!,
        textStyle: AppTextStyles.bodyMedium14,
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.xs2,
        ),
        onPressed: onPressed!,
      ),
    );
  }
}
