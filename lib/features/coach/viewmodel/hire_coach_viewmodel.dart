import 'package:pogo/features/coach/viewmodel/hire_coach_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hire_coach_viewmodel.g.dart';

@riverpod
class HireCoachViewmodel extends _$HireCoachViewmodel {
  @override
  HireCoachState build() {
    return const HireCoachState();
  }

  void selectService(CoachService service) {
    state = state.copyWith(
      selectedService: service == state.selectedService ? null : service,
    );
  }
}
