import 'package:flutter/material.dart';
import './../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;
  
  @override
  initState() {
     _isGlutenFree = widget.currentFilters['gluten'];
     _isLactoseFree = widget.currentFilters['lactose'];
     _isVegetarian = widget.currentFilters['vegetarian'];
     _isVegan = widget.currentFilters['vegan'];
     super.initState();
  }

  Widget SwitchListTileBuilder(
      String title, String description, bool currentValue, Function update) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: update,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian,
                };
                widget.saveFilters(selectedFilters);
              }),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal section',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTileBuilder(
                    'Gluten-free',
                    'Only Include Gluten free meals',
                    _isGlutenFree, (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                }),
                SwitchListTileBuilder(
                    'Lactose-free',
                    'Only Include Lactose free meals',
                    _isLactoseFree, (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                }),
                SwitchListTileBuilder('Vegiterian',
                    'Only Include Vegiterian meals', _isVegetarian, (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                }),
                SwitchListTileBuilder(
                    'Vegan', 'Only Include Vegan meals', _isVegan, (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
