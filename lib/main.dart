import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_details_screen.dart';
import 'screens/filters_screen.dart';
import './dummy_data.dart';
import './models/meal.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  } ;

List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilter(Map<String, bool> filterData){
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
         if(_filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
         if(_filters['vegan'] && !meal.isVegan){
          return false;
        }
         if(_filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20,51,51,1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20,51,51,1),
          ),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx)=>TabScreen(),
        // '/category-meals': (ctx) => CategoryMealScreen(),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(_availableMeals),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(),
        FiltersScreen.routeName: (ctx)=> FiltersScreen(_filters, _setFilter),
      },
      // onGenerateRoute: (settings){
      //   return MaterialPageRoute(builder: (ctx) => CategoryMealScreen());
      // },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx) => CategoryMealScreen(_availableMeals));
      },
    );
  }
}
//Commented code is way to add default route of app
// onGenerateRoute : We use as it provide lot of information from settings.
// onGenerateRoute and onUnknownRoute both we use for fallback route