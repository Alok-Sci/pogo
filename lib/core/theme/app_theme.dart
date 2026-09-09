import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_colors_extension.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/double_extensions.dart';

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

        // text button
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          backgroundColor: Palette.green,
          foregroundColor: Palette.warmOffWhite,
          elevation: 0,
          padding: const EdgeInsets.all(AppSpacing.xl),
          textStyle: AppTextStyles.titleMedium,
          shape: RoundedRectangleBorder(
            borderRadius: AppRadii.full.circular,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        )),

        // input decoration
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Palette.white,
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppSpacing.xxl,
            vertical: AppSpacing.xl,
          ),
          hintStyle: AppTextStyles.bodyLight14.copyWith(
            color: Palette.charcoalGrey.withValues(alpha: 0.25),
          ),
          prefixStyle: AppTextStyles.bodyLight14,
          border: OutlineInputBorder(
            borderRadius: AppRadii.full.circular,
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: AppRadii.full.circular,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppRadii.full.circular,
            borderSide: const BorderSide(color: Palette.black, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: AppRadii.full.circular,
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: AppRadii.full.circular,
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),
          filled: true,
        ),

        extensions: const [
          AppColorsExtension.light,
        ],
      );
}
