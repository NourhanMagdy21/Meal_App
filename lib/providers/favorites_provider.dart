import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final isExisting = state.contains(meal);
    if (isExisting) {
      state = state.where((e) => e.id != meal.id).toList();
return false;

    } else {
      state = [...state, meal];
return true;

    }
  }
}

final favoritesMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
