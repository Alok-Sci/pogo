import 'package:pogo/features/coach/data/model/coach_model.dart';
import 'package:pogo/features/home/data/model/special_population_coach.dart';

abstract class CoachRepository {
  Future<List<CoachModel>> getTopCoaches();
  Future<List<SpecialPopulationCoachModel>> getSpecialPopulationCoaches();
}
