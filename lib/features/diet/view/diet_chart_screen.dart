import 'package:flutter/material.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/utils/num_extensions.dart';
import 'package:pogo/features/diet/view/widgets/diet_chart.dart';
import 'package:pogo/features/diet/viewmodel/diet_view_type_enum.dart';
import 'package:pogo/features/diet/viewmodel/week_day_enum.dart';
import 'package:pogo/shared/widgets/pogo_app_bar.dart';
import 'package:pogo/shared/widgets/pogo_info_card.dart';
import 'package:pogo/shared/widgets/pogo_primary_tabbar.dart';
import 'package:pogo/shared/widgets/pogo_secondary_tabbar.dart';

class DietChartScreen extends StatefulWidget {
  const DietChartScreen({super.key});

  @override
  State<DietChartScreen> createState() => _DietChartScreenState();
}

class _DietChartScreenState extends State<DietChartScreen>
    with TickerProviderStateMixin {
  late final TabController _primaryTabBarController;
  late final TabController _secondaryTabBarController;

  @override
  void initState() {
    super.initState();
    _primaryTabBarController = TabController(length: 2, vsync: this);
    _secondaryTabBarController = TabController(length: 7, vsync: this);
  }

  @override
  void dispose() {
    _primaryTabBarController.dispose();
    _secondaryTabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PogoAppBar(
        title: "Diet Chart",
        infoText: "This is prepared after your consultation with this coach.",
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.xxl,
            vertical: AppSpacing.xxxl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PogoPrimaryTabBar<DietViewType>(
                controller: _primaryTabBarController,
                items: DietViewType.values,
                titleBuilder: (type) => type.title,
              ),
              AppSpacing.xxxl.vGap,

              PogoSecondaryTabBar<WeekDay>(
                controller: _secondaryTabBarController,
                items: WeekDay.values,
                titleBuilder: (day) => day.title,
              ),
              AppSpacing.xxxl.vGap,

              // diet char with date header
              DietChart(date: "14 June"),
              AppSpacing.xxxl.vGap,

              // info widget
              PogoInfoCard(
                "This chart provides a structured overview.\nPlease follow the daily Meal Plan for exact portions and timing.",
              )
            ],
          ),
        ),
      ),
    );
  }
}
