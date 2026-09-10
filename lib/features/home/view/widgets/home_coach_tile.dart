import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/context_extensions.dart';
import 'package:pogo/core/utils/double_extensions.dart';

class HomeCoachTile extends StatelessWidget {
  const HomeCoachTile({
    required this.onTap,
    required this.title,
    required this.description,
    required this.imageUrl,
    super.key,
  });

  final VoidCallback onTap;
  final String title;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadii.m.circular,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: AppRadii.m.circular,
            color: Palette.white,
          ),
          padding: EdgeInsets.all(AppSpacing.md),
          child: Row(
            spacing: AppSpacing.md,
            children: [
              ClipRRect(
                borderRadius: AppRadii.m.circular,
                child: Image.network(
                  imageUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppSpacing.md,
                  children: [
                    Text(title, style: context.textTheme.labelLarge),
                    Text(description, style: AppTextStyles.bodyMedium12),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
