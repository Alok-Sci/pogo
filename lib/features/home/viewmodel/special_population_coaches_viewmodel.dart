import 'package:pogo/features/home/data/model/special_population_coach.dart';
import 'package:pogo/features/home/data/repository/coach_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'special_population_coaches_viewmodel.g.dart';

@riverpod
class SpecialPopulationCoachesViewmodel
    extends _$SpecialPopulationCoachesViewmodel {

  @override
  Future<List<SpecialPopulationCoachModel>> build() {
    return ref.watch(coachRepositoryProvider).getSpecialPopulationCoaches();
  }
}
