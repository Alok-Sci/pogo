import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_item_model.freezed.dart';
part 'food_item_model.g.dart';

@freezed
abstract class FoodItemModel with _$FoodItemModel {
  const factory FoodItemModel({
    required String id,
    required String name,
    required String servingsInfo,
    required String imageUrl,
    required String recipeId,
  }) = _FoodItemModel;

  factory FoodItemModel.fromJson(Map<String, dynamic> json) =>
      _$FoodItemModelFromJson(json);
}
