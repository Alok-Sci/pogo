import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/utils/datetime_extensions.dart';
import 'package:pogo/core/utils/num_extensions.dart';
import 'package:pogo/features/diet/view/widgets/diet_chart.dart';
import 'package:pogo/features/diet/viewmodel/diet_chart_viewmodel.dart';
import 'package:pogo/features/diet/viewmodel/diet_view_type_enum.dart';
import 'package:pogo/features/diet/viewmodel/diet_view_type_viewmodel.dart';
import 'package:pogo/features/diet/viewmodel/week_day_enum.dart';
import 'package:pogo/shared/widgets/loader_widget.dart';
import 'package:pogo/shared/widgets/pogo_app_bar.dart';
import 'package:pogo/shared/widgets/pogo_info_card.dart';
import 'package:pogo/shared/widgets/pogo_primary_tabbar.dart';
import 'package:pogo/shared/widgets/pogo_secondary_tabbar.dart';

class DietChartScreen extends ConsumerStatefulWidget {
  const DietChartScreen({super.key});

  @override
  ConsumerState<DietChartScreen> createState() => _DietChartScreenState();
}

class _DietChartScreenState extends ConsumerState<DietChartScreen>
    with TickerProviderStateMixin {
  late final TabController _primaryTabBarController;
  late final TabController _secondaryTabBarController;

  @override
  void initState() {
    super.initState();

    // add listener to primary adn secondary tabbar cotroller
    _primaryTabBarController = TabController(length: 2, vsync: this)
      ..addListener(_onPrimaryTabChanged);
    _secondaryTabBarController = TabController(length: 7, vsync: this)
      ..addListener(_onSecondaryTabChanged);
  }

  // update dedicated viewmodel states' value
  void _onPrimaryTabChanged() {
    if (_primaryTabBarController.indexIsChanging) return;
    final type = DietViewType.values[_primaryTabBarController.index];
    ref.read(dietViewTypeViewmodelProvider.notifier).select(type);
  }

  void _onSecondaryTabChanged() {
    if (_secondaryTabBarController.indexIsChanging) return;
    ref
        .read(dietChartViewModelProvider.notifier)
        .selectDay(_secondaryTabBarController.index);
  }

  @override
  void dispose() {
    _primaryTabBarController.dispose();
    _secondaryTabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dietChartAsync = ref.watch(dietChartViewModelProvider);

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

              // diet chart
              dietChartAsync.when(
                loading: () => LoaderWidget(),
                error: (err, _) => Center(child: Text(err.toString())),
                data: (state) {
                  final selectedDay = state.weekPlan[state.selectedDayIndex];

                  return Column(
                    children: [
                      DietChart(
                        date: selectedDay.date.formattedDateString,
                        dietMeals: selectedDay.mealSection,
                        checkedFoodItemIds: state.selectedFoodItemIds,
                        onFoodItemToggled: (id) {
                          ref.read(dietChartViewModelProvider.notifier).toggleFoodItemOption(id);
                        },
                      ),
                      AppSpacing.xxxl.vGap,

                      // info widget
                      PogoInfoCard(
                        "This chart provides a structured overview.\nPlease follow the daily Meal Plan for exact portions and timing.",
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
