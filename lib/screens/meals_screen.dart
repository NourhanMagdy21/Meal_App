import 'package:flutter/material.dart';
import 'package:food_app/screens/meal_details_screen.dart';
import 'package:food_app/widgets/meal_item.dart';
import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key,  this.title, required this.meals, required this.onToggleFavorite});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;


  @override
  Widget build(BuildContext context) {
    return title==null? content(context) : Scaffold(
        appBar: AppBar(
          title: Center(child: Text(title!)),

        ),
        body: content(context));
  }

  SingleChildScrollView content(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: meals
              .map((meal) => MealItem(
                    meal: meal,
                    onSelectMeal: (Meal meal) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => MealDetailsScreen(meal: meal, onToggleFavorite: onToggleFavorite, ),
                        ),
                      );
                    },
                  ))
              .toList(),
        ),
      );
  }
}
