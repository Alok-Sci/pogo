import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_icons.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/utils/num_extensions.dart';
import 'package:pogo/shared/widgets/app_icon.dart';

class RatingsWidget extends StatelessWidget {
  const RatingsWidget({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    const int totalStars = 5;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(totalStars, (index) {
        final double starValue = rating - index;
        final double fillPercentage = starValue.clamp(0.0, 1.0);
        return [
          if (index > 0) AppSpacing.xs.hGap,
          _StarWidget(fillPercentage: fillPercentage),
        ];
      }).expand((e) => e).toList(),
    );
  }
}

class _StarWidget extends StatelessWidget {
  const _StarWidget({
    required this.fillPercentage,
  });

  final double fillPercentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 12,
      height: 12,
      child: Stack(
        children: [
          AppIcon(
            AppIcons.star,
            color: Palette.lightStoneGrey,
            size: 12,
          ),
          ClipRect(
            clipper: _StarClipper(fillPercentage),
            child: AppIcon(
              AppIcons.star,
              color: Palette.ratingStar,
              size: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _StarClipper extends CustomClipper<Rect> {
  const _StarClipper(this.fillPercentage);

  final double fillPercentage;

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width * fillPercentage, size.height);
  }

  @override
  bool shouldReclip(_StarClipper oldClipper) {
    return oldClipper.fillPercentage != fillPercentage;
  }
}
