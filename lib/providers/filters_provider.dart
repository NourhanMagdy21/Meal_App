import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'meals_provider.dart';



enum MealFilter{
  glutenfree,
  lactosefree,
  vegan,
  vegetarian
}

class FiltersNotifier extends StateNotifier<Map<MealFilter, bool>> {
  FiltersNotifier() : super({
    MealFilter.glutenfree: false,
    MealFilter.lactosefree: false,
    MealFilter.vegan: false,
    MealFilter.vegetarian: false,
  });

  void setFilters(Map<MealFilter, bool> chosenFilters) {
    state = chosenFilters;
  }


  void setFilter(MealFilter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}


final filtersProvider =
StateNotifierProvider<FiltersNotifier, Map<MealFilter, bool>>((ref) => FiltersNotifier());

final filteredMealsProvider = Provider((ref){
  final meals = ref.watch(mealsProvider);
  final Map<MealFilter, bool> activeFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (activeFilters[MealFilter.glutenfree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[MealFilter.lactosefree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[MealFilter.vegan]! && !meal.isVegan) {
      return false;
    }
    if (activeFilters[MealFilter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});