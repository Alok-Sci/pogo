import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pogo/core/constants/app_images.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/router/app_routes.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/utils/context_extensions.dart';
import 'package:pogo/core/utils/double_extensions.dart';
import 'package:pogo/core/utils/num_extensions.dart';
import 'package:pogo/features/onboarding/view/widgets/segmented_progress_bar.dart';
import 'package:pogo/features/onboarding/view/widgets/swipe_to_continue_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  final int _pageCount = 3; // total onboarding pages
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // segmented progress bar
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.xxxl),
                child: SegmentedProgressBar(
                  activeIndex: _currentPageIndex,
                  segmentCount: _pageCount,
                ),
              ),
            ),

            // onboarding pageview
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return context.appColors.onboardingGradient
                    .createShader(bounds);
              },
              child: SizedBox(
                height: 487,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPageIndex = index;
                    });
                  },
                  itemCount: _pageCount,
                  itemBuilder: (context, index) =>
                      Image.asset(AppImages.mockupOnboarding),
                ),
              ),
            ),
            AppSpacing.lg.vGap,

            // card content
            Container(
              decoration: BoxDecoration(
                borderRadius: AppRadii.m.topCircular,
              ),
              padding: EdgeInsets.all(AppSpacing.xxl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Consult Expert Coaches",
                    style: context.textTheme.titleLarge,
                  ),
                  AppSpacing.lgMd.vGap,
                  Text(
                    "Get personalized health guidance from certified coaches.\n\nBook 1-on-1 consultations, discuss your goals, and receive tailored diet plans made just for you. ",
                    style: context.textTheme.bodyLarge,
                  ),
                  AppSpacing.huge.vGap,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: SwipeToContinueButton(
                          onSwipeComplete: () {
                            context.go(AppRoutes.home);
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
