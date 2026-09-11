import 'package:flutter/material.dart';
import 'package:pogo/core/router/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pogo/features/auth/view/login_screen.dart';
import 'package:pogo/features/coach/view/coach_detail_screen.dart';
import 'package:pogo/features/diet/view/diet_chart_screen.dart';
import 'package:pogo/features/home/view/home_page.dart';
import 'package:pogo/features/onboarding/view/onboarding_screen.dart';
import 'package:pogo/features/shell/view/pogo_shell.dart';
import 'package:pogo/features/splash/view/splash_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (_, __) => const OnboardingScreen(),
      ),

      // app shell route
      StatefulShellRoute.indexedStack(
        builder: (context, state, child) => PogoShell(navigationShell: child),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.home,
              builder: (_, __) => const HomePage(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.page2,
              builder: (_, __) => const _Placeholder("Page 2"),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.page3,
              builder: (_, __) => const _Placeholder("Page 3"),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: AppRoutes.page4,
              builder: (_, __) => const _Placeholder("Page 4"),
            ),
          ]),
        ],
      ),
      GoRoute(
        path: "${AppRoutes.coach}/:id",
        builder: (_, state) {
          final id = state.pathParameters['id']!;

          return CoachDetailScreen(id: id);
        },
      ),
      GoRoute(
        path: AppRoutes.dietChart,
        builder: (_, __) => const DietChartScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.search,
        builder: (_, __) => const _Placeholder("search"),
      ),
    ],
  );
}

class _Placeholder extends StatelessWidget {
  const _Placeholder(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(title)));
  }
}
