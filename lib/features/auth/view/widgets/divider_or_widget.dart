
import 'package:flutter/material.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';

class DividerOrWidget extends StatelessWidget {
  const DividerOrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: 0,
            right: 0,
            child: Divider(color: Palette.charcoalGrey)),
        Positioned(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              color: Palette.warmOffWhite,
              padding:
                  EdgeInsets.symmetric(horizontal: AppSpacing.xl),
              child: Text("OR", style: AppTextStyles.bodyMedium16),
            ),
          ),
        ),
      ],
    );
  }
}