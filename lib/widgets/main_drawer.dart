import 'package:flutter/material.dart';
import './../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildWidgetTile(String title, IconData icon, Function tapHandler) {
      return ListTile(
        leading: Icon(icon, size: 26),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: tapHandler,
      );
    }

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Happy Cooking!',
              style: TextStyle(
                  fontSize: 30,
                   fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildWidgetTile(
            'Meals',
            Icons.restaurant,
            ()=>{
              Navigator.of(context).pushReplacementNamed('/'),
            }
          ),
          buildWidgetTile(
            'Filters',
            Icons.settings,
            ()=>{
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName),
            }
          ),
        ],
      ),
    );
  }
}
