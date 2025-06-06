import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';
import '../widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 3 / 2,
          ),
          children: [
            for (final category in availableCategories)
              CategoryGridItem(
                availableMeals :availableMeals,
                category: category,)
          ],

      ),
    );
  }
}
