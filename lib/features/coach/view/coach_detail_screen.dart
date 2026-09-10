import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pogo/core/constants/app_icons.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/double_extensions.dart';
import 'package:pogo/core/utils/num_extensions.dart';
import 'package:pogo/features/coach/data/model/coach_detail_model.dart';
import 'package:pogo/features/coach/data/model/review_model.dart';
import 'package:pogo/features/coach/view/widgets/card_with_title_overflow.dart';
import 'package:pogo/features/coach/view/widgets/coach_status_header.dart';
import 'package:pogo/features/coach/view/widgets/review_list_tile.dart';
import 'package:pogo/features/coach/viewmodel/coach_detail_viewmodel.dart';
import 'package:pogo/features/coach/viewmodel/hire_coach_state.dart';
import 'package:pogo/features/coach/viewmodel/hire_coach_viewmodel.dart';
import 'package:pogo/shared/widgets/app_icon.dart';
import 'package:pogo/shared/widgets/body_text.dart';
import 'package:pogo/shared/widgets/loader_widget.dart';
import 'package:pogo/shared/widgets/page_section_header.dart';
import 'package:pogo/shared/widgets/pogo_app_bar.dart';
import 'package:pogo/shared/widgets/pogo_card.dart';
import 'package:pogo/shared/widgets/pogo_checkbox_tile.dart';

class CoachDetailScreen extends ConsumerWidget {
  const CoachDetailScreen({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coachDetailAsync = ref.watch(coachDetailViewmodelProvider(id));

    return coachDetailAsync.when(
      loading: () => LoaderWidget(),
      error: (err, _) => Center(child: Text(err.toString())),
      data: (coach) => Scaffold(
        backgroundColor: Palette.warmOffWhite,
        appBar: PogoAppBar(title: "Coach Details"),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.xxxl),
            child: Column(
              children: [
                CoachStatusHeader(
                  name: coach.coach.name,
                  education: coach.education,
                  status: coach.availabilityStatus,
                ),
                AppSpacing.xxl.vGap,
                _CoachOverviewSection(coach),
                AppSpacing.xxl.vGap,
                _ReviewsSection(coach.reviews),
                AppSpacing.xxl.vGap,
                _HireACoachSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HireACoachSection extends ConsumerWidget {
  const _HireACoachSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedService = ref.watch(
      hireCoachViewmodelProvider.select((s) => s.selectedService),
    );
    final notifier = ref.read(hireCoachViewmodelProvider.notifier);

    return StatefulBuilder(
      builder: (context, setState) {
        return PogoCard(
            child: Column(
          children: [
            PageSectionHeader(
              title: "Hire a Coach",
              padding: EdgeInsets.zero,
            ),
            AppSpacing.sm.vGap,
            BodyText(
                "Connect with a professional coach based on your needs—whether you need quick guidance right now or ongoing support over time."),
            AppSpacing.xxl.vGap,
            PogoCheckBoxTile(
              title: "Instant Consultation",
              subtitle:
                  "Quick one-to-one guidance for immediate questions or urgent needs.",
              onChanged: (_) {
                notifier.selectService(CoachService.instantConsulation);
              },
              isChecked: selectedService == CoachService.instantConsulation,
            ),
            AppSpacing.xxl.vGap,
            PogoCheckBoxTile(
              title: "Long-term Consultation",
              subtitle:
                  "Ongoing coaching with regular sessions for sustained growth and support.",
              onChanged: (_) {
                notifier.selectService(CoachService.longTermConsulation);
              },
              isChecked: selectedService == CoachService.longTermConsulation,
            ),
          ],
        ));
      },
    );
  }
}

class _CoachOverviewSection extends StatelessWidget {
  const _CoachOverviewSection(this.coachDetail);
  final CoachDetailModel coachDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: AppRadii.m.circular,
          child: Image.network(
            coachDetail.coach.imageUrl,
            fit: BoxFit.cover,
            height: 342,
          ),
        ),
        AppSpacing.xxl.vGap,
        CardWithTitleOverflow(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.xxl,
            vertical: AppSpacing.xxxl,
          ),
          backgroundColor: Palette.black,
          title: "About Me",
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _StatItem(
                  title: "Experience", subtitle: coachDetail.coach.experience),
              Container(
                height: 48,
                color: Palette.white,
                width: 1,
              ),
              _StatItem(
                title: "Ratings",
                subtitleWidget:
                    _RatingSubtitleStatWidget(rating: coachDetail.coach.rating),
              ),
              Container(
                height: 48,
                color: Palette.white,
                width: 1,
              ),
              _StatItem(
                title: "Reviews",
                subtitle: coachDetail.reviewCount.toShortString,
              )
            ],
          ),
        ),
        AppSpacing.xxl.vGap,
        CardWithTitleOverflow(
          title: "Service Information",
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyText(coachDetail.serviceInformation),
            ],
          ),
        ),
      ],
    );
  }
}

class _RatingSubtitleStatWidget extends StatelessWidget {
  const _RatingSubtitleStatWidget({
    required this.rating,
  });
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          rating.toString(),
          style: AppTextStyles.headingSemiBold16.copyWith(color: Palette.white),
        ),
        AppSpacing.xs.hGap,
        AppIcon(AppIcons.star, color: Palette.green, size: 16),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.title,
    this.subtitle,
    this.subtitleWidget,
  }) : assert(subtitle != null || subtitleWidget != null,
            "Either subtitle or subtitleWidget must be provided");

  final String title;
  final String? subtitle;
  final Widget? subtitleWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BodyText(title, color: Palette.white),
        AppSpacing.xs.vGap,
        if (subtitleWidget != null)
          subtitleWidget!
        else
          Text(
            subtitle!,
            style:
                AppTextStyles.headingSemiBold16.copyWith(color: Palette.white),
          )
      ],
    );
  }
}

class _ReviewsSection extends StatelessWidget {
  const _ReviewsSection(this.reviews);

  final List<ReviewModel> reviews;

  @override
  Widget build(BuildContext context) {
    return PogoCard(
      child: Column(
        children: [
          PageSectionHeader(
            title: "Reviews",
            buttonText: "View All",
            onButtonPressed: () {},
            padding: EdgeInsets.zero,
          ),
          AppSpacing.xxl.vGap,

          //review cards
          ListView.separated(
            itemCount: reviews.take(3).length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (_, __) => AppSpacing.xxl.vGap,
            itemBuilder: (context, index) {
              final review = reviews[index];
              return ReviewListTile(review);
            },
          ),
        ],
      ),
    );
  }
}
