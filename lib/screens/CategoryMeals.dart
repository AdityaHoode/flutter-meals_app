import 'package:flutter/material.dart';

class CategoryMeals extends StatelessWidget {
  static String routeName = "/category-meals";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String cId = routeArgs['id'];
    final String cTitle = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text('$cTitle'),
      ),
    );
  }
}
