import 'package:pogo/features/diet/viewmodel/diet_view_type_enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'diet_view_type_viewmodel.g.dart';

@riverpod
class DietViewTypeViewmodel extends _$DietViewTypeViewmodel{
  @override 
  DietViewType build() => DietViewType.weekly;

  select(DietViewType type) => state = type;
}