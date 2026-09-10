import 'package:freezed_annotation/freezed_annotation.dart';

part "special_population_coach.freezed.dart";
part "special_population_coach.g.dart";

@freezed
abstract class SpecialPopulationCoachModel with _$SpecialPopulationCoachModel {
  const factory SpecialPopulationCoachModel({
    required String id,
    required String title,
    required String description,
    required String imageUrl,
  }) = _SpecialPopulationCoachModel;

  factory SpecialPopulationCoachModel.fromJson(Map<String, dynamic> json) =>
      _$SpecialPopulationCoachModelFromJson(json);
}
