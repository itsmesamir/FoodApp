import 'package:Food_app/models/meals.dart';
import 'package:Food_app/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  final List<Meal> favouriteMeal;

  FavouriteScreen(this.favouriteMeal);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favouriteMeal.isEmpty) {
      return Center(
        child: Text("You have no favourites yet - start adding some."),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: widget.favouriteMeal[index].id,
              title: widget.favouriteMeal[index].title,
              affordability: widget.favouriteMeal[index].affordability,
              complexity: widget.favouriteMeal[index].complexity,
              duration: widget.favouriteMeal[index].duration,
              imageUrl: widget.favouriteMeal[index].imageUrl);
        },
        itemCount: widget.favouriteMeal.length,
      );
    }
  }
}
