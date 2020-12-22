import 'package:Food_app/models/meals.dart';
import 'package:Food_app/screens/drawerLayout.dart';

import './category_screen.dart';
import './favourite.dart';
import 'package:flutter/material.dart';

class TabsLayout extends StatefulWidget {
  final List<Meal> favouriteMeals;

  TabsLayout(this.favouriteMeals);
  @override
  _TabsLayoutState createState() => _TabsLayoutState();
}

class _TabsLayoutState extends State<TabsLayout> {
  List<Map<String, Object>> widgets;
  void _itemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  int selectedIndex = 0;
  @override
  void initState() {
    widgets = [
      {
        'screen': CategoryScreen(),
        'title': 'Categories',
      },
      {
        'screen': FavouriteScreen(widget.favouriteMeals),
        'title': "Favourites",
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widgets[selectedIndex]['title']),
      ),
      drawer: DrawerLayout(),
      body: widgets[selectedIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _itemSelected,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favourites"),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
