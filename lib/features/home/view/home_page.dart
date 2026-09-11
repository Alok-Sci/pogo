import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pogo/core/router/app_routes.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/utils/context_extensions.dart';
import 'package:pogo/core/utils/num_extensions.dart';
import 'package:pogo/features/home/view/widgets/connect_with_coach_banner.dart';
import 'package:pogo/features/home/view/widgets/diet_plan_banner.dart';
import 'package:pogo/features/home/view/widgets/home_coach_carousel_card.dart';
import 'package:pogo/features/home/view/widgets/home_coach_tile.dart';
import 'package:pogo/features/home/view/widgets/home_header.dart';
import 'package:pogo/features/home/view/widgets/home_story_card.dart';
import 'package:pogo/features/home/viewmodel/coaches_viewmodel.dart';
import 'package:pogo/features/home/viewmodel/special_population_coaches_viewmodel.dart';
import 'package:pogo/features/home/viewmodel/stories_viewmodel.dart';
import 'package:pogo/shared/widgets/loader_widget.dart';
import 'package:pogo/shared/widgets/page_section_header.dart';
import 'package:pogo/shared/widgets/pogo_carousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          // header
          HomeHeader(
            searchController: searchController,
            onSearch: (query) {},
            onFoodButtonPressed: () {
              context.push(AppRoutes.dietChart);
            },
            onAddressTap: () {},
            onWalletTap: () {},
            onProfileTap: () {},
          ),
          AppSpacing.xxxl.vGap,

          // connect with coach banner
          ConnectWithCoachBanner(onConnectPressed: () {}),
          AppSpacing.huge.vGap,

          // top coaches carousel section
          PageSectionHeader(
            title: "Top Coach",
            buttonText: "See All",
            onButtonPressed: () {},
          ),
          AppSpacing.xxl.vGap,
          _TopCoachCarouselSection(),
          AppSpacing.huge.vGap,

          // special population coaches section
          PageSectionHeader(
            title: "Special population coaches",
            buttonText: "See All",
            onButtonPressed: () {},
          ),
          AppSpacing.xxl.vGap,
          _SpecialPopulationCoachesSection(),
          AppSpacing.xxxl.vGap,

          // diet plans banner
          DietPlansBanner(onViewDietPlanPressed: () {}),
          AppSpacing.huge.vGap,

          // stories section
          PageSectionHeader(title: "Stories"),
          AppSpacing.xxl.vGap,
          _StoriesListView(),
          AppSpacing.huge.vGap,

          // footer
          _HomeFooter(),
        ],
      ),
    ));
  }
}

class _TopCoachCarouselSection extends ConsumerWidget {
  const _TopCoachCarouselSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coachesAsync = ref.watch(coachesViewModelProvider);

    return coachesAsync.when(
      loading: () => LoaderWidget(),
      error: (err, _) => Center(child: Text(err.toString())),
      data: (coaches) => PogoCarousel(
        items: coaches.map((coach) {
          return HomeCoachCarouselCard(
              isFavorite: coach.isFavorite,
              name: coach.name,
              category: coach.category,
              experience: coach.experience,
              rating: coach.rating,
              imageUrl: coach.imageUrl,
              onTap: () {
                context.push("${AppRoutes.coach}/${coach.id}");
              });
        }).toList(),
      ),
    );
  }
}

class _StoriesListView extends ConsumerWidget {
  const _StoriesListView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storiesAsync = ref.watch(storiesViewModelProvider);

    return storiesAsync.when(
      loading: () => const LoaderWidget(),
      error: (err, _) => Center(child: Text(err.toString())),
      data: (stories) => SizedBox(
        height: 180,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          scrollDirection: Axis.horizontal,
          itemCount: stories.length,
          separatorBuilder: (_, __) => AppSpacing.lgMd.hGap,
          itemBuilder: (context, index) {
            final story = stories[index];

            return HomeStoryCard(
              imageUrl: story.imageUrl,
              name: story.name,
              category: story.category,
              onPressed: () {},
            );
          },
        ),
      ),
    );
  }
}

class _SpecialPopulationCoachesSection extends ConsumerWidget {
  const _SpecialPopulationCoachesSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coachesAsync = ref.watch(specialPopulationCoachesViewmodelProvider);

    return coachesAsync.when(
      loading: () => const LoaderWidget(),
      error: (err, _) => Center(child: Text(err.toString())),
      data: (coaches) => ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
        physics: NeverScrollableScrollPhysics(),
        itemCount: coaches.length,
        separatorBuilder: (_, __) => AppSpacing.xxl.vGap,
        itemBuilder: (context, index) {
          final coach = coaches[index];
          return HomeCoachTile(
            title: coach.title,
            description: coach.description,
            imageUrl: coach.imageUrl,
            onTap: () {},
          );
        },
      ),
    );
  }
}

class _HomeFooter extends StatelessWidget {
  const _HomeFooter();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: AppSpacing.xl),
      child: Text(
        "Eat better.\nLive healthier.",
        style: context.textTheme.displayLarge?.copyWith(
          color: Palette.charcoalGrey.withValues(alpha: .1),
        ),
      ),
    );
  }
}
