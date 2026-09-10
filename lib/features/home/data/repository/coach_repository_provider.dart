import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pogo/features/home/data/repository/coach_repository.dart';
import 'package:pogo/features/home/data/repository/mock_coach_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "coach_repository_provider.g.dart";

@riverpod
CoachRepository coachRepository(Ref ref) {
  return MockCoachRepository();
}
