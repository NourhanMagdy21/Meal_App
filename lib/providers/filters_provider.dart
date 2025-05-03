import 'package:flutter_riverpod/flutter_riverpod.dart';



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

