import 'package:flutter/material.dart';
import 'package:meals_app/screens/CategoryMeals.dart';
import 'package:meals_app/screens/Filters.dart';
import 'package:meals_app/screens/MealDetails.dart';
import 'package:meals_app/screens/Tabs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        CategoryMeals.routeName: (ctx) => CategoryMeals(),
        MealDetails.routeName: (ctx) => MealDetails(),
        Filters.routeName: (ctx) => Filters(),
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
