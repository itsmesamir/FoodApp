import 'package:Food_app/widgets/meal_item.dart';

import '../models/meals.dart';
import 'package:flutter/material.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String catTitle;
  List<Meal> categoryMeal;
  var pageLoaded = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!pageLoaded) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      final catId = routeArgs['id'];
      catTitle = routeArgs['title'];
      categoryMeal = widget.availableMeals
          .where((meal) => meal.categories.contains(catId))
          .toList();
      pageLoaded = true;
    }

    super.didChangeDependencies();
  }

  void removeItem(String mealId) {
    setState(() {
      categoryMeal.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: Container(
          child: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeal[index].id,
            title: categoryMeal[index].title,
            affordability: categoryMeal[index].affordability,
            complexity: categoryMeal[index].complexity,
            duration: categoryMeal[index].duration,
            imageUrl: categoryMeal[index].imageUrl,
          );
        },
        itemCount: categoryMeal.length,
      )),
    );
  }
}
