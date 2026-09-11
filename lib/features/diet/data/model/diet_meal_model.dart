import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pogo/features/diet/data/model/food_item_model.dart';

part 'diet_meal_model.freezed.dart';
part 'diet_meal_model.g.dart';

@freezed
abstract class DietMealModel with _$DietMealModel {
  const factory DietMealModel({
    required String title,
    required List<FoodItemModel> options,
  }) = _DietMealModel;

  factory DietMealModel.fromJson(Map<String, dynamic> json) =>
      _$DietMealModelFromJson(json);
}
