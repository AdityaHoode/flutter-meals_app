import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/Categories.dart';
import 'package:meals_app/screens/Favorites.dart';
import 'package:meals_app/widgets/MainDrawer.dart';

class Tabs extends StatefulWidget {
  final List<Meal> _favoriteMeals;

  Tabs(this._favoriteMeals);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List<Map<String, Object>> _pages;
  int _selectedPage = 0;

  @override
  void initState() {
    _pages = [
      {"page": Categories(), 'title': "Categories"},
      {"page": Favorites(widget._favoriteMeals), 'title': "Favorites"},
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${_pages[_selectedPage]['title']}'),
          // bottom: TabBar(
          //   tabs: [
          //     Tab(
          //       icon: Icon(Icons.category_outlined),
          //       text: "Categories",
          //     ),
          //     Tab(
          //       icon: Icon(Icons.star_border_outlined),
          //       text: "Favorites",
          //     ),
          //   ],
          // ),
        ),
        drawer: MainDrawer(),
        // body: TabBarView(children: [
        //   Categories(),
        //   Favorites(),
        // ]),
        body: _pages[_selectedPage]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => _selectPage(index),
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedPage,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: "Favorites",
            )
          ],
        ),
      ),
    );
  }
}
