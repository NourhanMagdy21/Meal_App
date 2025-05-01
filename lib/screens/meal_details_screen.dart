import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/providers/favorites_provider.dart';

import '../models/meal.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen(
      {super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref.read(favoritesMealsProvider.notifier).toggleMealFavoriteStatus(meal);

                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(wasAdded?'Marked as a favorite!' : 'Meal is no longer favorite' )),
                );
              },

            icon: Icon(Icons.star_border_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            children: [
              Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'Ingredients',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary, fontSize: 24),
              ),
              SizedBox(
                height: 14,
              ),
              for (final ingredient in meal.ingredients)
                Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20),
                ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Steps',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary, fontSize: 24),
              ),
              SizedBox(
                height: 14,
              ),
              for (final step in meal.steps)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                  child: Text(
                    step,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 20),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
