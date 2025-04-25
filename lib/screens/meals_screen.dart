import 'package:flutter/material.dart';
import 'package:food_app/screens/meal_details_screen.dart';
import 'package:food_app/widgets/meal_item.dart';
import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(title)),

        ),
        body: SingleChildScrollView(
          child: Column(
            children: meals
                .map((meal) => MealItem(
                      meal: meal,
                      onSelectMeal: (Meal meal) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => MealDetailsScreen(meal: meal),
                          ),
                        );
                      },
                    ))
                .toList(),
          ),
        ));
  }
}
