import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_details_screen.dart';
import 'screens/filters_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(),
        FiltersScreen.routeName: (ctx)=> FiltersScreen(),
      },
      // onGenerateRoute: (settings){
      //   return MaterialPageRoute(builder: (ctx) => CategoryMealScreen());
      // },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx) => CategoryMealScreen());
      },
    );
  }
}
//Commented code is way to add default route of app
// onGenerateRoute : We use as it provide lot of information from settings.
// onGenerateRoute and onUnknownRoute both we use for fallback route