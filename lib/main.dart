import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/CategoryMeals.dart';
import 'package:meals_app/screens/Filters.dart';
import 'package:meals_app/screens/MealDetails.dart';
import 'package:meals_app/screens/Tabs.dart';

import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _applyFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) return false;
        if (_filters['vegan'] && !meal.isVegan) return false;
        if (_filters['vegetarian'] && !meal.isVegetarian) return false;
        if (_filters['lactose'] && !meal.isLactoseFree) return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Deli Meals",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => Tabs(),
        CategoryMeals.routeName: (ctx) => CategoryMeals(_availableMeals),
        MealDetails.routeName: (ctx) => MealDetails(),
        Filters.routeName: (ctx) => Filters(_filters,_applyFilter),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Deli Meals'),
      ),
      body: Center(
        child: Text("Let's get it!"),
      ),
    ));
  }
}
