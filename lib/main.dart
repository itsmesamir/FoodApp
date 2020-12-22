import 'package:Food_app/models/dummy_data.dart';
import 'package:Food_app/models/meals.dart';
import 'package:Food_app/screens/category_meal_screen.dart';
import 'package:Food_app/screens/meal_details_screen.dart';
import 'package:Food_app/screens/tabsLayout.dart';
import 'package:Food_app/screens/filters_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> availableMeal = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavourite(String id) {
    return (_favouriteMeals.any((element) => element.id == id));
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations(
    //   [
    //     DeviceOrientation.portraitUp,
    //   ],
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Food App",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 221, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoCondensed',
              fontSize: 20,
            )),
      ),
      //home: CategoryScreen(),
      initialRoute: '/',
      routes: {
        '/': (ct) => TabsLayout(_favouriteMeals),
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(availableMeal),
        MealDetailsScreen.routeName: (ctx) =>
            MealDetailsScreen(_toggleFavourite, _isMealFavourite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
