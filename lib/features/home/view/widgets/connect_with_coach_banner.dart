
import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_images.dart';
import 'package:pogo/shared/widgets/pogo_banner.dart';

class ConnectWithCoachBanner extends StatelessWidget {
  const ConnectWithCoachBanner({
    required this.onConnectPressed,
    super.key,
  });

  final VoidCallback onConnectPressed;

  @override
  Widget build(BuildContext context) {
    return PogoBanner.dark(
      title: "Connect with Your Coach Now",
      subtitle:
          "Your coach is ready to guide your diet, workouts, and lifestyle.",
      buttonText: "Connect",
      onButtonPressed: onConnectPressed,
      trailing: SizedBox(
        height: 120,
        width: 120,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 5,
              child: Image.asset(
                AppImages.fruitSpliceGroup,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                AppImages.connectWithCoach,
                height: 110,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
