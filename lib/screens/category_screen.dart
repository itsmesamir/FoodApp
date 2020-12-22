import '../widgets/category_ui.dart';
import '../models/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return CategoryUI(
          id: DUMMY_CATEGORIES[index].id,
          text: DUMMY_CATEGORIES[index].title,
          color: DUMMY_CATEGORIES[index].color,
        );
      },
      itemCount: DUMMY_CATEGORIES.length,
    );
  }
}
