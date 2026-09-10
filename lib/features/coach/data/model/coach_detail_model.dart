import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pogo/features/coach/data/model/review_model.dart';
import 'package:pogo/features/coach/data/model/coach_model.dart';

part 'coach_detail_model.freezed.dart';
part 'coach_detail_model.g.dart';

@freezed
abstract class CoachDetailModel with _$CoachDetailModel{
  const factory CoachDetailModel({
    required String id,
    required CoachModel coach,
    required String education,
    required String availabilityStatus,
    required int reviewCount,
    required String serviceInformation,
    required List<ReviewModel> reviews,
  }) = _CoachDetailModel;

  factory CoachDetailModel.fromJson(Map<String, dynamic> json) => _$CoachDetailModelFromJson(json);
}