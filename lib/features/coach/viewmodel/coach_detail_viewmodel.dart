import 'package:pogo/features/coach/data/model/coach_detail_model.dart';
import 'package:pogo/features/coach/data/repository/coach_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coach_detail_viewmodel.g.dart';

@riverpod
class CoachDetailViewmodel extends _$CoachDetailViewmodel {
  @override
  Future<CoachDetailModel> build(String coachId) {
    return ref.watch(coachRepositoryProvider).getCoachDetail(coachId);
  }
}
