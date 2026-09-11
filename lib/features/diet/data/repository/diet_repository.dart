import 'package:pogo/features/diet/data/model/daily_diet_plan_model.dart';

abstract class DietRepository {
  Future<List<DailyDietPlanModel>> getWeeklyDietPlan(DateTime weekStart);
}