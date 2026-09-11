import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/double_extensions.dart';

class PogoPrimaryTabBar<T> extends StatelessWidget {
  const PogoPrimaryTabBar({
    super.key,
    required this.controller,
    required this.items,
    required this.titleBuilder,
    this.onTap,
  });

  final TabController controller;
  final List<T> items;
  final String Function(T) titleBuilder;
  final ValueChanged<T>? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: AppRadii.s.circular,
        ),
        child: TabBar(
          controller: controller,
          padding: EdgeInsets.all(AppSpacing.xs),
          isScrollable: false,
          indicator: BoxDecoration(
            color: Palette.charcoalGrey,
            borderRadius: AppRadii.s.circular,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          dividerColor: Colors.transparent,
          labelStyle: AppTextStyles.bodyMedium14,
          labelColor: Palette.warmOffWhite,
          labelPadding: EdgeInsets.symmetric(
            vertical: AppSpacing.md,
          ),
          unselectedLabelStyle: AppTextStyles.bodyMedium14,
          unselectedLabelColor: Palette.charcoalGrey,
          tabAlignment: TabAlignment.fill,
          onTap: (index) {
            if (onTap != null && index < items.length) {
              onTap!(items[index]);
            }
          },
          tabs: items.map((item) {
            return Tab(text: titleBuilder(item));
          }).toList(),
        ),
      ),
    );
  }
}
