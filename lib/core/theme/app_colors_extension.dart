import 'package:flutter/material.dart';
import 'package:pogo/core/theme/app_palette.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  const AppColorsExtension({
    required this.statusChipBackground,
    required this.emptyRatingStar,
    required this.ratingStar,
    required this.accentGold,
    required this.highlightYellow,
    required this.innerShadow,
    required this.dropShadow,
    required this.headerGradient,
    required this.onboardingGradient,
    required this.overlayGradient,
  });

  final Color statusChipBackground;
  final Color emptyRatingStar;
  final Color ratingStar;
  final Color accentGold;
  final Color highlightYellow;
  final Color innerShadow;
  final Color dropShadow;
  final Gradient headerGradient;
  final Gradient onboardingGradient;
  final Gradient overlayGradient;

  static const light = AppColorsExtension(
    statusChipBackground: Palette.lightStoneGrey,
    emptyRatingStar: Palette.lightStoneGrey,
    ratingStar: Palette.ratingStar,
    accentGold: Palette.mutedGold,
    highlightYellow: Palette.lighYellow,
    headerGradient: Palette.headerGradient,
    innerShadow: Palette.innerShadow,
    dropShadow: Palette.dropShadow,
    onboardingGradient: Palette.onboardingGradient,
    overlayGradient: Palette.overlayGradient,
  );

  @override
  AppColorsExtension copyWith({
    Color? statusChipBackground,
    Color? emptyRatingStar,
    Color? ratingStar,
    Color? accentGold,
    Color? highlightYellow,
    Color? innerShadow,
    Color? dropShadow,
    Gradient? headerGradient,
    Gradient? onboardingGradient,
    Gradient? overlayGradient,
  }) {
    return AppColorsExtension(
      statusChipBackground: statusChipBackground ?? this.statusChipBackground,
      emptyRatingStar: emptyRatingStar ?? this.emptyRatingStar,
      ratingStar: ratingStar ?? this.ratingStar,
      accentGold: accentGold ?? this.accentGold,
      highlightYellow: highlightYellow ?? this.highlightYellow,
      headerGradient: headerGradient ?? this.headerGradient,
      innerShadow: innerShadow ?? this.innerShadow,
      dropShadow: dropShadow ?? this.dropShadow,
      onboardingGradient: onboardingGradient ?? this.onboardingGradient,
      overlayGradient: overlayGradient ?? this.overlayGradient,
    );
  }

  @override
  AppColorsExtension lerp(ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) return this;
    return AppColorsExtension(
      statusChipBackground:
          Color.lerp(statusChipBackground, other.statusChipBackground, t)!,
      emptyRatingStar: Color.lerp(emptyRatingStar, other.emptyRatingStar, t)!,
      ratingStar: Color.lerp(ratingStar, other.ratingStar, t)!,
      accentGold: Color.lerp(accentGold, other.accentGold, t)!,
      highlightYellow: Color.lerp(highlightYellow, other.highlightYellow, t)!,
      headerGradient: Gradient.lerp(headerGradient, other.headerGradient, t)!,
      innerShadow: Color.lerp(innerShadow, other.innerShadow, t)!,
      dropShadow: Color.lerp(dropShadow, other.dropShadow, t)!,
      onboardingGradient:
          Gradient.lerp(onboardingGradient, other.onboardingGradient, t)!,
      overlayGradient:
          Gradient.lerp(overlayGradient, other.overlayGradient, t)!,
    );
  }
}
