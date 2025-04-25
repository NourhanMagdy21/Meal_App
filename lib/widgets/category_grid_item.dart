import 'package:flutter/material.dart';
import 'package:food_app/screens/meals_screen.dart';

import '../models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> MealsScreen()));
        },

      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(colors: [
                category.color.withOpacity(0.5),
                category.color.withOpacity(0.9),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Text(category.title, style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),)),
    );
  }
}
