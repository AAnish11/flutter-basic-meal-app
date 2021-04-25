import 'package:flutter/material.dart';
import './constants/dummy_data.dart';
import './categories.item.dart';

class CategoriesHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 16,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 16,
          maxCrossAxisExtent: 200),
      children: DUMMY_CATEGORIES
          .map(
            (categoryData) => CategoriesItem(
              categoryData.id,
              categoryData.title,
              categoryData.color,
            ),
          )
          .toList(),
    );
  }
}
