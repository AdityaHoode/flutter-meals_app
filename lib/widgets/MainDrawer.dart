import 'package:flutter/material.dart';
import 'package:meals_app/screens/Filters.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function onTapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Drawer',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            "Meals",
            Icons.restaurant_menu,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            "Filter",
            Icons.filter_alt,
            () {
              Navigator.of(context).pushReplacementNamed(Filters.routeName);
            },
          ),
        ],
      ),
    );
  }
}
