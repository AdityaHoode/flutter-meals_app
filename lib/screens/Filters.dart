import 'package:flutter/material.dart';
import 'package:meals_app/widgets/MainDrawer.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';
  final Function _applyFilter;
  final Map<String, bool> appliedFilters;

  Filters(this.appliedFilters, this._applyFilter);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.appliedFilters['gluten'];
    _vegan = widget.appliedFilters['vegan'];
    _vegetarian = widget.appliedFilters['vegetarian'];
    _lactoseFree = widget.appliedFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, bool value, Function updateState) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: updateState,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                  'lactose': _lactoseFree,
                };
                widget._applyFilter(selectedFilters);
              }),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Apply filters of your choice",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  "Vegetarian",
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Vegan",
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Gluten free",
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  "Lactose free",
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
