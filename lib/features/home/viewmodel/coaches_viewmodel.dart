import 'package:pogo/features/coach/data/model/coach_model.dart';
import 'package:pogo/features/coach/data/repository/coach_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coaches_viewmodel.g.dart';

@riverpod 
class CoachesViewModel extends _$CoachesViewModel{
  @override
  Future<List<CoachModel>> build(){
    return ref.watch(coachRepositoryProvider).getTopCoaches();
  }
}

