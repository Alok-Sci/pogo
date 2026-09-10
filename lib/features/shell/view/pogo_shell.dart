import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/features/shell/view/widgets/pogo_bottom_navbar.dart';

class PogoShell extends StatelessWidget {
  const PogoShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          navigationShell,
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
              child: PogoBottomNavbar(
                currentIndex: navigationShell.currentIndex,
                onTap: (index) => navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                ),
                onCallChatTap: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
