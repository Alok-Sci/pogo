
import 'package:flutter/material.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/shared/widgets/pogo_card.dart';
import 'package:pogo/shared/widgets/primary_button.dart';

class CardWithTitleOverflow extends StatelessWidget {
  const CardWithTitleOverflow({
    super.key,
    required this.title,
    required this.content,
    this.backgroundColor,
    this.padding,
  });

  final String title;
  final Widget content;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        PogoCard(
          padding: padding,
          color: backgroundColor,
          child: content,
        ),
        Positioned.fill(
          top: -AppSpacing.huge,
          child: Align(
            alignment: Alignment.topCenter,
            child: PrimaryButton(
              title,
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
