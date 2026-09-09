import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_icons.dart';
import 'package:pogo/core/constants/app_images.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/context_extensions.dart';
import 'package:pogo/core/utils/double_extensions.dart';
import 'package:pogo/core/utils/num_extensions.dart';
import 'package:pogo/features/home/model/home_typedefs.dart';
import 'package:pogo/features/home/view/widgets/home_header_food_button.dart';
import 'package:pogo/features/home/view/widgets/search_text_field.dart';
import 'package:pogo/shared/widgets/app_icon.dart';
import 'package:pogo/shared/widgets/circular_icon_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.searchController,
    required this.onSearch,
    required this.onFoodButtonPressed,
    required this.onAddressTap,
    required this.onWalletTap,
    required this.onProfileTap,
  });

  final TextEditingController searchController;
  final PogoSearchCallback onSearch;
  final VoidCallback onFoodButtonPressed;
  final VoidCallback onAddressTap;
  final VoidCallback onWalletTap;
  final VoidCallback onProfileTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: AppRadii.m.bottomCircular,
        color: Palette.black,
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            top: 0,
            child: AppIcon(
              AppIcons.wavesAbstract,
              size: 300,
            ),
          ),
          Column(
            children: [
              AppSpacing.huge.vGap,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
                child: Row(
                  spacing: AppSpacing.xxl,
                  children: [
                    Expanded(
                      child: _AddressBar(onTap: onAddressTap),
                    ),
                    _HeaderActionButtons(
                      onWalletTap: onWalletTap,
                      onProfileTap: onProfileTap,
                    )
                  ],
                ),
              ),
              AppSpacing.xxxl.vGap,
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: AppSpacing.xxl),
                        child: SearchTextField(
                          controller: searchController,
                          onSearch: onSearch,
                        ),
                      ),
                    ),
                    AppSpacing.lg.hGap,
                    HomeHeaderFoodButton(onPressed: onFoodButtonPressed)
                  ],
                ),
              ),
              AppSpacing.xxxl.vGap,
              Image.asset(
                AppImages.homeHeaderBanner,
                width: double.infinity,
              ),
              AppSpacing.xxl.vGap,
            ],
          ),
        ],
      ),
    );
  }
}

class _HeaderActionButtons extends StatelessWidget {
  const _HeaderActionButtons(
      {required this.onWalletTap, required this.onProfileTap});
  final VoidCallback onWalletTap;
  final VoidCallback onProfileTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSpacing.xxl,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _WalletActionButton(
          onPressed: () {},
        ),
        CircularIconButton(
          onPressed: () {},
          iconPath: AppImages.avatar,
          iconType: CircularIconType.image,
          radius: 40,
          padding: EdgeInsets.all(AppSpacing.xs2),
        ),
      ],
    );
  }
}

class _WalletActionButton extends StatelessWidget {
  const _WalletActionButton({required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 40,
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            CircularIconButton(
              onPressed: () {}, // already handled by parent
              iconPath: AppImages.wallet,
              iconType: CircularIconType.image,
              iconSize: 16,
              radius: 34,
              padding: EdgeInsets.only(
                bottom: AppSpacing.xs,
                right: AppSpacing.md,
                left: AppSpacing.md,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Palette.white,
                  borderRadius: AppRadii.full.circular,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs2,
                ),
                child: Text(
                  "₹ 234",
                  style: AppTextStyles.bodyRegular12Tall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddressBar extends StatelessWidget {
  const _AddressBar({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                AppImages.locationPin,
                height: 16,
              ),
              AppSpacing.xs.hGap,
              Text(
                "Noida",
                style: context.textTheme.labelLarge?.copyWith(
                  color: Palette.warmOffWhite,
                ),
              ),
              AppSpacing.xs.hGap,
              AppIcon(AppIcons.arrowDown, size: AppSpacing.xxl)
            ],
          ),
          AppSpacing.xs.hGap,
          Text(
            "Nepean Sea Road, B-Wing, Sagar Tarang, Malabar Hil",
            style: AppTextStyles.bodyLight12.copyWith(
              color: Palette.warmOffWhite,
            ),
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
