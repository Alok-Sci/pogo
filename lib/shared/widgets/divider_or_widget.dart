import 'package:flutter/material.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';

class DividerOrWidget extends StatelessWidget {
  const DividerOrWidget({
    super.key,
  })  : text = "OR",
        style = null,
        dividerColor = null,
        thickness = null,
        _noText = false;

  const DividerOrWidget.capitalized({
    super.key,
  })  : text = "Or",
        style = AppTextStyles.bodyLight12,
        dividerColor = Palette.charcoalGrey,
        thickness = 0.5,
        _noText = false;

  const DividerOrWidget.noText({
    super.key,
  })  : text = "",
        dividerColor = Palette.charcoalGrey,
        thickness = 0.5,
        style = null,
        _noText = true;

  final String text;
  final TextStyle? style;
  final Color? dividerColor;
  final double? thickness;
  final bool _noText;

  @override
  Widget build(BuildContext context) {
    if (_noText) {
      return Divider(
        color: dividerColor ?? Palette.charcoalGrey,
        thickness: thickness,
      );
    }

    return Row(
      spacing: AppSpacing.md,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: dividerColor ?? Palette.charcoalGrey,
            thickness: thickness,
          ),
        ),
        Text(text, style: style ?? AppTextStyles.bodyMedium16),
        Expanded(
          child: Divider(
            color: dividerColor ?? Palette.charcoalGrey,
            thickness: thickness,
          ),
        ),
      ],
    );
  }
}
