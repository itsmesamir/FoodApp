import 'package:Food_app/models/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String routeName = '/meal-details';
  final Function _toggleFavourite;
  final Function _isFavourite;
  MealDetailsScreen(this._toggleFavourite, this._isFavourite);

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    );
  }

  Widget buildContainerModel(Widget child) {
    return Container(
      height: 200,
      width: 350,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final catId = ModalRoute.of(context).settings.arguments as String;
    final selectedMealInfo =
        DUMMY_MEALS.firstWhere((mealImg) => mealImg.id == catId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMealInfo.title),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => _toggleFavourite(catId),
        child: Icon(
          _isFavourite(catId) ? Icons.star : Icons.star_border,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network(selectedMealInfo.imageUrl),
            ),
            buildSectionTitle("Ingredients", context),
            buildContainerModel(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Colors.orange,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        '${selectedMealInfo.ingredients[index]}',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: selectedMealInfo.ingredients.length,
              ),
            ),
            buildSectionTitle("Steps", context),
            buildContainerModel(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  // return Card(
                  //   color: Colors.orange,
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //       vertical: 5,
                  //       horizontal: 10,
                  //     ),
                  //     child: Text(
                  //       '${selectedMealInfo.steps[index]}',
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //       ),
                  //     ),
                  //   ),
                  // );
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(selectedMealInfo.steps[index]),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                    ],
                  );
                },
                itemCount: selectedMealInfo.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
