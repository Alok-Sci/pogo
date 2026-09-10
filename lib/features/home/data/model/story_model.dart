import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_model.freezed.dart';
part 'story_model.g.dart';

@freezed
abstract class StoryModel with _$StoryModel {
  const factory StoryModel({
    required String id,
    required String name,
    required String category,
    required String imageUrl,
  }) = _StoryModel;

  factory StoryModel.fromJson(Map<String, dynamic> json) => _$StoryModelFromJson(json);
}
