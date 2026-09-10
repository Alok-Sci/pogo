import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_icons.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/utils/context_extensions.dart';
import 'package:pogo/core/utils/double_extensions.dart';
import 'package:pogo/features/home/data/model/home_typedefs.dart';
import 'package:pogo/shared/widgets/app_icon.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    required this.controller,
    required this.onSearch,
    this.hintText = "Search here",
    super.key,
  });

  final TextEditingController controller;
  final PogoSearchCallback onSearch;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSearch,
      decoration: InputDecoration(
        fillColor: Palette.white.withValues(alpha: 0.14),
        border: OutlineInputBorder(
          borderRadius: AppRadii.full.circular,
          borderSide: BorderSide(color: Palette.white.withValues(alpha: 0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadii.full.circular,
          borderSide: BorderSide(color: Palette.white.withValues(alpha: 0.3)),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: Center(
          child: AppIcon(AppIcons.search, size: AppSpacing.xxlMd),
        ),
        contentPadding: EdgeInsets.all(AppSpacing.lgMd),
        prefixIconConstraints: BoxConstraints(maxWidth: 42, maxHeight: 40),
        hintText: hintText,
        hintStyle: context.textTheme.bodyLarge?.copyWith(color: Palette.white),
      ),
    );
  }
}
