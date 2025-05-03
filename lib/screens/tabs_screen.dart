import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/providers/favorites_provider.dart';
import 'package:food_app/providers/filters_provider.dart';
import 'package:food_app/providers/meals_provider.dart';
import 'package:food_app/screens/categories_screen.dart';
import 'package:food_app/screens/filters_screen.dart';
import 'package:food_app/screens/meals_screen.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectPageIndex = 0;

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(),
        ),
      );
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final Map<MealFilter, bool> activeFilters = ref.watch(filtersProvider);
    final List<Meal> availableMeals = meals.where((meal) {
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
    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Pick Your Meal';
    if (_selectPageIndex == 1) {
      final List<Meal> favoriteMeal = ref.watch(favoritesMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeal,
      );
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectPageIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite'),
          ]),
    );
  }
}
