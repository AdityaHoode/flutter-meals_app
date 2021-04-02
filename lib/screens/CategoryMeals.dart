import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widgets/MealItem.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = "/category-meals";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String cId = routeArgs['id'];
    final String cTitle = routeArgs['title'];
    final categoryMeals =
        DUMMY_MEALS.where((meal) => meal.categories.contains(cId)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('$cTitle'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
