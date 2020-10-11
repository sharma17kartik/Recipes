import '../screens/categories_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color bgColor;

  CategoryItem(this.id, this.title, this.bgColor);

  void selectCategories(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/category-meals',
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategories(context),
      splashColor: bgColor.withOpacity(0.4),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              bgColor.withAlpha(100),
              bgColor.withOpacity(0.6),
              bgColor,
              bgColor.withOpacity(0.8),
              bgColor,
              bgColor.withAlpha(100),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
