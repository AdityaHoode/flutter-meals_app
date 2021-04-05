import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/MealItem.dart';

class Favorites extends StatelessWidget {
  final List<Meal> _favoriteMeals;

  Favorites(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      return Center(
        child: Text("You have no favorites yet - start adding some"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _favoriteMeals[index].id,
            title: _favoriteMeals[index].title,
            imageUrl: _favoriteMeals[index].imageUrl,
            duration: _favoriteMeals[index].duration,
            complexity: _favoriteMeals[index].complexity,
            affordability: _favoriteMeals[index].affordability,
          );
        },
        itemCount: _favoriteMeals.length,
      );
    }
  }
}
