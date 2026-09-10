import 'package:freezed_annotation/freezed_annotation.dart';

part 'coach_model.freezed.dart';
part 'coach_model.g.dart';

@freezed
abstract class CoachModel with _$CoachModel {
  const factory CoachModel({
    required String id,
    required String name,
    required String category,
    required String experience,
    required double rating,
    required bool isFavorite,
    required String imageUrl,
  }) = _CoachModel;

  factory CoachModel.fromJson(Map<String, dynamic> json) =>
      _$CoachModelFromJson(json);
}
