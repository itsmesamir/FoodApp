import 'package:Food_app/models/meals.dart';
import 'package:Food_app/screens/meal_details_screen.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final int duration;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.affordability,
    @required this.complexity,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'simple';
        break;
      case Complexity.Challenging:
        return 'challenging';
        break;
      case Complexity.Hard:
        return 'hard';
        break;
      default:
        return 'unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'affordable';
        break;
      case Affordability.Luxurious:
        return 'luxurious';
        break;
      case Affordability.Pricey:
        return 'pricey';
        break;
      default:
        return 'unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailsScreen.routeName, arguments: id);
    //     .then((value) {
    //   if (value != null) {
    //     removeItem(value);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        return selectMeal(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black54,
                    ),
                    width: 300,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(width: 6),
                        Text('$duration min'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(width: 6),
                        Text(complexityText),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(width: 6),
                        Text(affordabilityText),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
