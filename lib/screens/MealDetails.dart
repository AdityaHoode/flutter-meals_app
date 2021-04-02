import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';

class MealDetails extends StatelessWidget {
  static const routeName = "/meal-details";

  Widget buildSectionTitle(BuildContext ctx, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String mId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mId);

    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10.0),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text('${selectedMeal.steps[index]}'),
                    ),
                    Divider(),
                  ],
                );
              },
              itemCount: selectedMeal.steps.length,
            )),
          ],
        ),
      ),
    );
  }
}
