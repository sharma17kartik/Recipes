import 'package:flutter/material.dart';
// import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummyData.dart';

class CategoriesMealsScreen extends StatelessWidget {
  // final String catId;
  // final String catTitle;
  // CategoriesMealsScreen(this.catId, this.catTitle);

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catTitle = routeArg['title'];
    final catId = routeArg['id'];
    final catMeals = DUMMY_MEALS.where((value) {
      return value.categories.contains(catId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            catMeals[index].id,
            catMeals[index].title,
            catMeals[index].imageUrl,
            catMeals[index].duration,
            catMeals[index].complexity,
            catMeals[index].affordability,
          );
        },
        itemCount: catMeals.length,
      ),
    );
  }
}
