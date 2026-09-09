import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_icons.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/shared/widgets/app_icon.dart';

enum SocialLoginType {
  google("Google", AppIcons.googleLogo);

  const SocialLoginType(this.name, this.iconPath);
  final String name;
  final String iconPath;
}

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key, this.type = SocialLoginType.google, required this.onPressed});

  final SocialLoginType type;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Palette.white,
        foregroundColor: Palette.darkLight,
      ),
      child: Row(
        spacing: AppSpacing.lg,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcon(type.iconPath, size: AppSpacing.xxlMd),
          Text(
            "Continue with ${type.name}",
            style: AppTextStyles.headingSemiBold14,
          )
        ],
      ),
    );
  }
}
