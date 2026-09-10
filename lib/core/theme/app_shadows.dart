import 'package:flutter/material.dart';
import 'package:pogo/core/theme/app_palette.dart';

abstract class AppShadows {
  AppShadows._();

  static List<BoxShadow> get navigationPill => [
    BoxShadow(
      color: Palette.innerShadow,
      blurRadius: 2,
    ),
    BoxShadow(
      color: Palette.dropShadow,
      blurRadius: 10,
    ),
  ];
}
