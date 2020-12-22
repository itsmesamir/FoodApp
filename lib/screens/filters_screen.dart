import 'package:Food_app/screens/drawerLayout.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];

    _lactoseFree = widget.currentFilters['lactose'];

    _vegan = widget.currentFilters['vegan'];

    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget buildListviewItem(
      String title, String subtitle, bool defValue, Function updateValue) {
    return SwitchListTile(
      value: defValue,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filters"),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };

                widget.saveFilters(selectedFilters);
              },
            )
          ],
        ),
        drawer: DrawerLayout(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection.",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildListviewItem("Gluten-free",
                      "Only include gluten-free meal", _glutenFree, (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  }),
                  buildListviewItem(
                      "Lactose-free",
                      "Only include lactose-free meal",
                      _lactoseFree, (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  }),
                  buildListviewItem("Vegan", "Only include vegan meal", _vegan,
                      (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  }),
                  buildListviewItem(
                      "Vegetarian", "Only include vegetarian meal", _vegetarian,
                      (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ));
  }
}
