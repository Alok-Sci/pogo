import 'package:flutter/material.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/context_extensions.dart';

class PogoSecondaryTabBar<T> extends StatelessWidget {
  const PogoSecondaryTabBar({
    super.key,
    required this.controller,
    required this.items,
    required this.titleBuilder,
    this.onTap,
  });

  final List<T> items;
  final String Function(T) titleBuilder;
  final TabController controller;
  final ValueChanged<T>? onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final currentIndex = controller.index;
        bool isActive(index) => index == currentIndex;

        return SizedBox(
          height: 22,
          child: TabBar(
            padding: EdgeInsets.zero,
            controller: controller,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.zero,
            labelColor: Palette.charcoalGrey,
            unselectedLabelColor: Palette.charcoalGrey,
            labelStyle: AppTextStyles.headingSemiBold14,
            labelPadding: EdgeInsets.zero,
            unselectedLabelStyle: context.textTheme.bodyMedium,
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            dividerHeight: 0,
            tabAlignment: TabAlignment.start,
            onTap: (index) {
              if (onTap != null && index < items.length) {
                onTap!(items[index]);
              }
            },
            tabs: List.generate(items.length, (index) {
              return _PogoSecondaryTab(
                titleBuilder(items[index]),
                isActive: isActive(index),
              );
            }),
          ),
        );
      },
    );
  }
}

class _PogoSecondaryTab extends StatelessWidget {
  const _PogoSecondaryTab(
    this.title, {
    this.isActive = false,
  });

  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final activeBorderColor = Palette.charcoalGrey;
    final inactiveBorderColor = Palette.lightStoneGrey;

    final resolvedBorderColor =
        isActive ? activeBorderColor : inactiveBorderColor;

    return Tab(
      child: Padding(
        padding: EdgeInsets.only(
          right: AppSpacing.xl,
        ),
        child: Container(
          padding: EdgeInsets.only(bottom: AppSpacing.xs),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: resolvedBorderColor)),
          ),
          child: Text(title),
        ),
      ),
    );
  }
}
