import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_images.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/context_extensions.dart';
import 'package:pogo/core/utils/double_extensions.dart';
import 'package:pogo/core/utils/num_extensions.dart';
import 'package:pogo/features/coach/data/model/review_model.dart';
import 'package:pogo/shared/widgets/body_text.dart';
import 'package:pogo/shared/widgets/rating_widget.dart';

class ReviewListTile extends StatelessWidget {
  const ReviewListTile(this.review, {super.key});

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _ReveiwListTileHeader(review),
        AppSpacing.md.vGap,
        BodyText(review.text),
      ],
    );
  }
}

class _ReveiwListTileHeader extends StatelessWidget {
  const _ReveiwListTileHeader(this.review);

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _ReviewAuthorInfo(review),
        RatingsWidget(rating: review.rating),
      ],
    );
  }
}

class _ReviewAuthorInfo extends StatelessWidget {
  const _ReviewAuthorInfo(
    this.review,
  );

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: AppRadii.full.circular,
          child: Image.network(
            review.authorImageUrl,
            fit: BoxFit.cover,
            height: 40,
            width: 40,
          ),
        ),
        AppSpacing.md.hGap,
        Column(children: [
          Text(
            review.authorName,
            style: AppTextStyles.headingSemiBold14,
          ),
          AppSpacing.xs2.vGap,
          Text(
            review.publishDate,
            style: context.textTheme.bodySmall,
          )
        ])
      ],
    );
  }
}
