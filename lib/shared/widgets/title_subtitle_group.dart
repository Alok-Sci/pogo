import 'package:flutter/material.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/context_extensions.dart';
import 'package:pogo/core/utils/num_extensions.dart';

class TitleSubtitleGroup extends StatelessWidget {
  const TitleSubtitleGroup({
    required this.title,
    this.subtitle,
    this.subtitleTextGroup,
    this.separator,
    this.titleStyle,
    this.subtitleStyle,
    this.textColor,
    this.gap,
    super.key,
  });

  final Widget? separator;

  final String title;
  final String? subtitle;
  final List<String>? subtitleTextGroup;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Color? textColor;
  final double? gap;
  Color get resolvedTitleColor => textColor ?? Palette.warmOffWhite;
  Color get resolvedSubtitleColor => textColor ?? Palette.lighYellow;
  double get resolvedGap => gap ?? AppSpacing.xs2;

  @override
  Widget build(BuildContext context) {
    final defaultSubtitleStyle = subtitleStyle ??
        AppTextStyles.bodyMedium12.copyWith(color: resolvedSubtitleColor);

    final defualtSeparator = separator ??
        CircleAvatar(
          radius: AppSpacing.xs2,
          backgroundColor: resolvedSubtitleColor,
        );

    final subtitleItems =
        subtitleTextGroup ?? (subtitle != null ? [subtitle!] : <String>[]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: titleStyle ??
              context.textTheme.labelLarge?.copyWith(color: resolvedTitleColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (subtitleItems.isNotEmpty) ...[
          resolvedGap.vGap,
          Row(
            spacing: AppSpacing.sm,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int i = 0; i < subtitleItems.length; i++) ...[
                if (i > 0) defualtSeparator,
                Flexible(
                  child: Text(
                    subtitleItems[i],
                    style: defaultSubtitleStyle.copyWith(
                        color: resolvedSubtitleColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ],
          )
        ],
      ],
    );
  }
}
