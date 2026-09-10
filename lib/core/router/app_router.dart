import 'package:flutter/material.dart';
import 'package:pogo/core/router/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pogo/features/auth/view/login_screen.dart';
import 'package:pogo/features/home/view/home_page.dart';
import 'package:pogo/features/onboarding/view/onboarding_screen.dart';
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
      ShellRoute(
        builder: (context, state, child) => _PlaceholderShell(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.home,
            builder: (_, __) => const HomePage(),
          ),
          GoRoute(
            path: AppRoutes.home,
            builder: (_, __) => const _Placeholder("Page 2"),
          ),
          GoRoute(
            path: AppRoutes.home,
            builder: (_, __) => const _Placeholder("Page 3"),
          ),
          GoRoute(
            path: AppRoutes.home,
            builder: (_, __) => const _Placeholder("Page 4"),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.coachDetail,
        builder: (_, __) => const _Placeholder("coachDetail"),
      ),
      GoRoute(
        path: AppRoutes.dietChart,
        builder: (_, __) => const _Placeholder("dietChart"),
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

class _PlaceholderShell extends StatelessWidget {
  final Widget child;

  const _PlaceholderShell({required this.child});

  @override
  Widget build(BuildContext context) {
    final String currentRoute = GoRouterState.of(context).uri.path;

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _calculateSelectedIndex(currentRoute),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.group), label: "Page 2"),
          NavigationDestination(icon: Icon(Icons.paste), label: "Page 3"),
          NavigationDestination(icon: Icon(Icons.newspaper), label: "Page 4"),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(String path) {
    return switch (path) {
      _ when path.startsWith(AppRoutes.home) => 0,
      _ when path.startsWith(AppRoutes.page2) => 1,
      _ when path.startsWith(AppRoutes.page3) => 2,
      _ when path.startsWith(AppRoutes.page4) => 3,
      _ => 0,
    };
  }
}
