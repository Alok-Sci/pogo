import 'package:flutter/material.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/utils/num_extensions.dart';
import 'package:pogo/shared/widgets/divider_or_widget.dart';
import 'package:pogo/shared/widgets/title_subtitle_group.dart';

class DietMeal extends StatelessWidget {
  const DietMeal({
    super.key,
    required this.title,
    required this.itemsCount,
    required this.itemBuilder,
  });

  final String title;
  final int itemsCount;
  final Widget Function(int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleSubtitleGroup(
          title: title,
          textColor: Palette.charcoalGrey,
        ),
        AppSpacing.lgMd.vGap,
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: itemsCount,
          separatorBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.lgMd),
            child: DividerOrWidget.capitalized(),
          ),
          itemBuilder: (context, index) {
            return itemBuilder(index);
          },
        ),
      ],
    );
  }
}
