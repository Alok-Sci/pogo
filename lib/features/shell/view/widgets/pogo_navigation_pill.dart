import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_shadows.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/context_extensions.dart';
import 'package:pogo/features/shell/view/widgets/pogo_nav_item_data.dart';
import 'package:pogo/features/shell/view/widgets/pogo_nav_items.dart';
import 'package:pogo/shared/widgets/app_icon.dart';

class PogoNavigationPill extends StatelessWidget {
  const PogoNavigationPill({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: Palette.dark,
        borderRadius: BorderRadius.circular(AppRadii.full),
        gradient: context.appColors.navbarGradient,
        boxShadow: AppShadows.navigationPill,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(pogoNavItems.length, (index) {
          final isActive = index == currentIndex;
          return _NavItem(
            data: pogoNavItems[index],
            isActive: isActive,
            onTap: () => onTap(index),
          );
        }),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem(
      {required this.data, required this.isActive, required this.onTap});

  final PogoNavItemData data;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        // margin: EdgeInsets.symmetric(horizontal: AppSpacing.xs),
        padding: EdgeInsets.symmetric(
          horizontal: isActive ? AppSpacing.sm : AppSpacing.sm,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: isActive ? Palette.charcoalGrey : Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadii.full),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcon(
              data.icon,
              size: 28,
              color: isActive
                  ? Palette.white
                  : Palette.white.withValues(alpha: 0.5),
            ),
            if (isActive)
              Text(
                data.label,
                style: AppTextStyles.labelBold12.copyWith(color: Palette.green),
              ),
          ],
        ),
      ),
    );
  }
}
