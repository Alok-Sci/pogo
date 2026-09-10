import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_images.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/double_extensions.dart';
import 'package:pogo/core/utils/num_extensions.dart';
import 'package:pogo/features/coach/view/widgets/card_with_title_overflow.dart';
import 'package:pogo/features/coach/view/widgets/coach_status_header.dart';
import 'package:pogo/features/coach/view/widgets/review_list_tile.dart';
import 'package:pogo/shared/widgets/body_text.dart';
import 'package:pogo/shared/widgets/page_section_header.dart';
import 'package:pogo/shared/widgets/pogo_app_bar.dart';
import 'package:pogo/shared/widgets/pogo_card.dart';
import 'package:pogo/shared/widgets/pogo_checkbox_tile.dart';

class CoachDetailScreen extends StatelessWidget {
  const CoachDetailScreen({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.warmOffWhite,
      appBar: PogoAppBar(title: "Coach Details"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.xxxl),
          child: Column(
            children: [
              CoachStatusHeader(
                name: "Coach Name",
                education: "PhD in Clinical Psychology",
                status: "Available",
              ),
              AppSpacing.xxl.vGap,
              _CoachOverviewSection(),
              AppSpacing.xxl.vGap,
              _ReviewsSection(),
              AppSpacing.xxl.vGap,
              _HireACoachSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _HireACoachSection extends StatelessWidget {
  const _HireACoachSection();

  @override
  Widget build(BuildContext context) {
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
          onChanged: (isChecked) {},
          isChecked: true,
        ),
        AppSpacing.xxl.vGap,
        PogoCheckBoxTile(
          title: "Long-term Consultation",
          subtitle:
              "Ongoing coaching with regular sessions for sustained growth and support.",
          onChanged: (isChecked) {},
          isChecked: false,
        ),
      ],
    ));
  }
}

class _CoachOverviewSection extends StatelessWidget {
  const _CoachOverviewSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: AppRadii.m.circular,
          child: Image.asset(
            AppImages.femaleCoach,
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
              _StatItem(title: "Experience", subtitle: "10+ years"),
              Container(
                height: 48,
                color: Palette.white,
                width: 1,
              ),
              _StatItem(title: "Ratings", subtitle: "10+ years"),
              Container(
                height: 48,
                color: Palette.white,
                width: 1,
              ),
              _StatItem(title: "Reiviews", subtitle: "10+ years")
            ],
          ),
        ),
        AppSpacing.xxl.vGap,
        CardWithTitleOverflow(
          title: "Service Information",
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyText(
                  "Service Category: Weight Loss, Weigh gain\n\nLorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of  type and scrambled it to make a type specimen book."),
            ],
          ),
        ),
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
  const _ReviewsSection();

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

        //review card
        ReviewListTile(
          authorName: "Emily Carter",
          reviewDate: "15th Sept 2024",
          rating: 4,
          text:
              "Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
        ),
        AppSpacing.xxl.vGap,
        ReviewListTile(
          authorName: "Emily Carter",
          reviewDate: "15th Sept 2024",
          rating: 4,
          text:
              "Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
        ),
        AppSpacing.xxl.vGap,
        ReviewListTile(
          authorName: "Emily Carter",
          reviewDate: "15th Sept 2024",
          rating: 4,
          text:
              "Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
        ),
        AppSpacing.xxl.vGap,
      ],
    ));
  }
}
