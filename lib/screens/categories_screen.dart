import '../widgets/category_item.dart';
import 'package:flutter/material.dart';
import '../dummyData.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deli Meals'),
      ),
      body: GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map(
              (ct) => CategoryItem(ct.id, ct.title, ct.color),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 5 / 4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
