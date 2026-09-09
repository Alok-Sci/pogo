
import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_images.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/shared/widgets/pogo_banner.dart';

class DietPlansBanner extends StatelessWidget {
  const DietPlansBanner({
    required this.onViewDietPlanPressed,
    super.key,
  });

  final VoidCallback onViewDietPlanPressed;

  @override
  Widget build(BuildContext context) {
    return PogoBanner(
      title: "Diet Plans",
      subtitle: "Eat smarter with plans designed for your body and goals.",
      buttonText: "View Diet Plans",
      onButtonPressed: onViewDietPlanPressed,
      trailing: Padding(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Image.asset(AppImages.dietPlan),
      ),
    );
  }
}
