import 'package:pogo/features/diet/data/model/daily_diet_plan_model.dart';
import 'package:pogo/features/diet/data/model/diet_meal_model.dart';
import 'package:pogo/features/diet/data/model/food_item_model.dart';
import 'package:pogo/features/diet/data/repository/diet_repository.dart';

class MockDietRepository implements DietRepository {
  @override
  Future<List<DailyDietPlanModel>> getWeeklyDietPlan(DateTime weekStart) async {
    await Future.delayed(Duration(milliseconds: 400));

    return List.generate(7, (index) {
      final date = weekStart.add(Duration(days: index));
      return DailyDietPlanModel(
        date: date,
        mealSection: [
          DietMealModel(
            title: "Breakfast",
            options: _foodItems("breakfast_$index"),
          ),
          DietMealModel(
            title: "Snack",
            options: _foodItems("snack1_$index"),
          ),
          DietMealModel(
            title: "Lunch",
            options: _foodItems("lunch_$index"),
          ),
          DietMealModel(
            title: "Snack",
            options: _foodItems("snakc2_$index"),
          ),
          DietMealModel(
            title: "Dinner",
            options: _foodItems("dinner_$index"),
          ),
        ],
      );
    });
  }

  List<FoodItemModel> _foodItems(String idPrefix) => [
        FoodItemModel(
          id: "${idPrefix}_a",
          name: "Vegetable oats",
          servingsInfo: "2 pieces + 2 tbsp",
          imageUrl:
              "https://images.unsplash.com/photo-1696950168808-0ccf6ae6882d?q=80&w=1160&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          recipeId: 'recipe_vegetable_oats',
        ),
        FoodItemModel(
          id: "${idPrefix}_b",
          name: "Dal + roti with salad",
          servingsInfo: "2 pieces + 2 tbsp",
          imageUrl:
              "https://images.unsplash.com/photo-1576846806147-8065a16f89b0?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          recipeId: 'recipe_vegetable_oats',
        ),
      ];
}
