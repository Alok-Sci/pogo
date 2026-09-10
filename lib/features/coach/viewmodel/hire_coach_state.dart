import 'package:freezed_annotation/freezed_annotation.dart';

part 'hire_coach_state.freezed.dart';

enum CoachService { instantConsulation, longTermConsulation }

@freezed
abstract class HireCoachState with _$HireCoachState {
  const factory HireCoachState({
    CoachService? selectedService,
  }) = _HireCoachState;
}
