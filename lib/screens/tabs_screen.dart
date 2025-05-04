import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/providers/favorites_provider.dart';
import 'package:food_app/providers/filters_provider.dart';
import 'package:food_app/providers/nav_bar_provider.dart';
import 'package:food_app/screens/categories_screen.dart';
import 'package:food_app/screens/filters_screen.dart';
import 'package:food_app/screens/meals_screen.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends ConsumerWidget {
  const TabsScreen({super.key});

  @override



  @override
  Widget build(BuildContext context, WidgetRef ref) {
final availableMeals = ref.watch(filteredMealsProvider);
final selectPageIndex= ref.watch(navBarProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Pick Your Meal';

    if (selectPageIndex == 1) {
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
        onSelectScreen: (String identifier) {
  Navigator.of(context).pop();
  if (identifier == 'filters') {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => FiltersScreen(),
      ),
    );}}

      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap:ref.read(navBarProvider.notifier).selectPage,
          currentIndex: selectPageIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite'),
          ]),
    );
  }
}
