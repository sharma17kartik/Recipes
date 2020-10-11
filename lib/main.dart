import './screens/meal_detail_screen.dart';

import 'screens/categories_meals_screen.dart';
import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Railway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            title: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
      ),
      home: CategoriesScreen(),
      routes: {
        '/category-meals': (ctx) => CategoriesMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
    );
  }
}
