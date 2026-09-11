import 'package:pogo/core/utils/datetime_extensions.dart';
import 'package:pogo/features/diet/data/model/daily_diet_plan_model.dart';
import 'package:pogo/features/diet/data/repository/diet_repository_provider.dart';
import 'package:pogo/features/diet/viewmodel/diet_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'diet_chart_viewmodel.g.dart';

@riverpod
class DietChartViewModel extends _$DietChartViewModel {
  @override
  Future<DietState> build() async {
    final weekStart = _startOfCurrenWeek();
    final weekPlan =
        await ref.watch(dietRepositoryProvider).getWeeklyDietPlan(weekStart);
    return DietState(
        weekPlan: weekPlan, selectedDayIndex: _todayIndexIn(weekPlan));
  }

  // select day
  void selectDay(int indext) {
    state = state.whenData((s) => s.copyWith(selectedDayIndex: indext));
  }

  // toggle food item
  void toggleFoodItemOption(String id) {
    state = state.whenData((s) {
      // clone the existin set
      final updated = Set<String>.from(s.selectedFoodItemIds);

      // if the id is in set, then remove, else add
      updated.contains(id) ? updated.remove(id) : updated.add(id);

      return s.copyWith(selectedFoodItemIds: updated);
    });
  }

  // state of current week
  DateTime _startOfCurrenWeek() {
    final now = DateTime.now();
    return now.subtract(Duration(days: now.weekday - 1));
  }

  int _todayIndexIn(List<DailyDietPlanModel> weekPlan) {
    final now = DateTime.now();
    final index = weekPlan.indexWhere((day) => day.date.isSameDayAs(now));
    return index == -1 ? 0 : index;
  }
}
