import '../screens/category_meal_screen.dart';
import 'package:flutter/material.dart';

class CategoryUI extends StatelessWidget {
  final String id;
  final String text;
  final Color color;

  CategoryUI({this.id, this.text, this.color});

  void categoryClicked(BuildContext ctx) {
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(
    //     builder: (context) => CategoryMealScreen(id, text),
    //   ),
    // );

    Navigator.of(ctx).pushNamed(
      CategoryMealScreen.routeName,
      arguments: {'id': id, 'title': text},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => categoryClicked(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.title,
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
