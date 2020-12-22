import 'package:Food_app/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class DrawerLayout extends StatelessWidget {
  Widget buildListItem(String text, IconData icon, Function controlNav) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        text,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
      onTap: controlNav,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            width: double.infinity,
            height: 200,
            padding: EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildListItem(
            "Categories",
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListItem(
            "Setting",
            Icons.settings,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
