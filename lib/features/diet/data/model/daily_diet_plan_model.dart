import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pogo/features/diet/data/model/diet_meal_model.dart';

part 'daily_diet_plan_model.freezed.dart';
part 'daily_diet_plan_model.g.dart';

@freezed
abstract class DailyDietPlanModel with _$DailyDietPlanModel {
  const factory DailyDietPlanModel({
    required DateTime date,
    required List<DietMealModel> mealSection,
  }) = _DailyDietPlanModel;

  factory DailyDietPlanModel.fromJson(Map<String, dynamic> json) =>
      _$DailyDietPlanModelFromJson(json);
}
