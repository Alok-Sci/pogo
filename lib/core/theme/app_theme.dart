import 'package:flutter/material.dart';
import 'package:pogo/core/theme/app_colors_extension.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_text_styles.dart';

abstract class AppTheme {
  const AppTheme._();

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Palette.warmOffWhite,

        // colorscheme
        colorScheme: const ColorScheme.light(
          primary: Palette.green,
          onPrimary: Palette.white,
          secondary: Palette.mutedGold,
          onSecondary: Palette.charcoalGrey,
          surface: Palette.white,
          onSurface: Palette.charcoalGrey,
          error: Colors.red,
          onError: Palette.white,
        ),

        // texttheme
        textTheme: const TextTheme(
          displayLarge: AppTextStyles.displayHuge,
          displaySmall: AppTextStyles.displaySmall,
          titleLarge: AppTextStyles.titleLarge,
          titleMedium: AppTextStyles.titleMedium,
          titleSmall: AppTextStyles.titleSmall,
          labelLarge: AppTextStyles.labelBold14,
          labelMedium: AppTextStyles.labelBold12,
          headlineSmall: AppTextStyles.headingSemiBold16,
          bodyLarge: AppTextStyles.bodyRegular16,
          bodyMedium: AppTextStyles.bodyRegular14,
          bodySmall: AppTextStyles.bodyRegular12,
        ),

        // appbar theme
        appBarTheme: const AppBarTheme(
          backgroundColor: Palette.warmOffWhite,
          foregroundColor: Palette.charcoalGrey,
          elevation: 0,
          titleTextStyle: AppTextStyles.headingSemiBold16,
        ),

        // dividerTheme
        dividerTheme: const DividerThemeData(
          color: Palette.lightGrey,
          thickness: 1,
        ),
        extensions: const [
          AppColorsExtension.light,
        ],
      );
}
