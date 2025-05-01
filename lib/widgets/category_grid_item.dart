import 'package:flutter/material.dart';
import 'package:food_app/screens/meals_screen.dart';

import '../models/category.dart';
import '../models/meal.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key,
      required this.category,

      required this.availableMeals});

  final Category category;

  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final List<Meal> filteredMeal = availableMeals
            .where(
              (meal) => meal.categories.contains(category.id),
            )
            .toList();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => MealsScreen(
            title: category.title,
            meals: filteredMeal,

          ),
        ));
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
image: DecorationImage(
  fit: BoxFit.cover,
    image: AssetImage(category.imagePath,)),
              borderRadius: BorderRadius.circular(16),),
              // gradient: LinearGradient(colors: [
              //   category.color.withOpacity(0.5),
              //   category.color.withOpacity(0.9),
              // ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          )),
    );
  }
}
