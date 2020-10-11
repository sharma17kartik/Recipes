import '../models/meal.dart';
import 'package:flutter/material.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;
  final int duration;
  final Complexity complex;
  final Affordability afford;

  MealItem(this.id, this.title, this.imgUrl, this.duration, this.complex,
      this.afford);

  String get complexty {
    switch (complex) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (afford) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  void selectedMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                imgUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 20,
              right: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: 320,
                color: Colors.black54,
                child: Text(title,
                    style: TextStyle(fontSize: 26, color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow.fade),
              ),
            )
          ]),
          Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(children: [
                    Icon(Icons.hourglass_empty),
                    SizedBox(width: 6),
                    Text('$duration minutes'),
                  ]),
                  Row(children: [
                    Icon(Icons.work),
                    SizedBox(width: 6),
                    Text(complexty),
                  ]),
                  Row(children: [
                    Icon(Icons.attach_money),
                    SizedBox(width: 6),
                    Text(affordabilityText),
                  ]),
                ],
              ))
        ]),
      ),
    );
  }
}
