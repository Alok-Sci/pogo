import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pogo/features/diet/data/repository/diet_repository.dart';
import 'package:pogo/features/diet/data/repository/mock_diet_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'diet_repository_provider.g.dart';

@riverpod
DietRepository dietRepository(Ref ref) {
  return MockDietRepository();
}
