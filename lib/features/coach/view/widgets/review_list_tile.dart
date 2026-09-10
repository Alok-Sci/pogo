import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_images.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/context_extensions.dart';
import 'package:pogo/core/utils/num_extensions.dart';
import 'package:pogo/shared/widgets/body_text.dart';
import 'package:pogo/shared/widgets/rating_widget.dart';

class ReviewListTile extends StatelessWidget {
  const ReviewListTile({
    super.key,
    required this.authorName,
    required this.reviewDate,
    required this.rating,
    required this.text,
  });

  final String authorName;
  final String reviewDate;
  final int rating;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _ReveiwListTileHeader(
          authorName: authorName,
          reviewDate: reviewDate,
          rating: rating,
        ),
        AppSpacing.md.vGap,
        BodyText(text),
      ],
    );
  }
}

class _ReveiwListTileHeader extends StatelessWidget {
  const _ReveiwListTileHeader({
    required this.authorName,
    required this.reviewDate,
    required this.rating,
  });

  final String authorName;
  final String reviewDate;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _ReviewAuthorInfo(
          authorName: authorName,
          reviewDate: reviewDate,
        ),
        RatingsWidget(rating: rating.toDouble()),
      ],
    );
  }
}

class _ReviewAuthorInfo extends StatelessWidget {
  const _ReviewAuthorInfo({
    required this.authorName,
    required this.reviewDate,
  });

  final String authorName;
  final String reviewDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          child: Image.asset(AppImages.avatar),
        ),
        AppSpacing.md.hGap,
        Column(children: [
          Text(
            authorName,
            style: AppTextStyles.headingSemiBold14,
          ),
          AppSpacing.xs2.vGap,
          Text(
            reviewDate,
            style: context.textTheme.bodySmall,
          )
        ])
      ],
    );
  }
}
