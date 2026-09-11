import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pogo/features/diet/data/model/daily_diet_plan_model.dart';

part 'diet_state.freezed.dart';

@freezed
abstract class DietState with _$DietState {
  const factory DietState({
    required List<DailyDietPlanModel> weekPlan,
    required int selectedDayIndex,
    @Default({}) Set<String> selectedFoodItemIds,
  }) = _DietState;
}
