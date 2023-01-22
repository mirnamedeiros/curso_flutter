import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/meal.dart';

class FavoriteScreen extends StatelessWidget {

  final List<Meal> favoriteMeals;

  const FavoriteScreen({
    final Key? key,
    required this.favoriteMeals,
  }) : super (key: key);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty) {
      return const Center(
        child: Text('No meal was selected'),
      );
    }
    else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: favoriteMeals[index]);
        },
      );
    }
  }
}