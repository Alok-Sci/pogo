import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
abstract class ReviewModel with _$ReviewModel{
  const factory ReviewModel({
    required String id,
    required String authorName,
    required String authorImageUrl,
    required String publishDate,
    required double rating,
    required String text, 
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json)  => _$ReviewModelFromJson(json);
}