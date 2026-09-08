import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_icons.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/shared/widgets/app_icon.dart';
import 'package:pogo/shared/widgets/blur_circle_widget.dart';
import 'package:pogo/shared/widgets/loader_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: BlurCircleWidget(radius: 299.0),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: AppIcon(AppIcons.logo, size: 160),
            ),
          ),
          Positioned.fill(
            right: 0,
            left: 0,
            bottom: AppSpacing.xxxl,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: LoaderWidget(),
            ),
          )
        ],
      ),
    );
  }
}
