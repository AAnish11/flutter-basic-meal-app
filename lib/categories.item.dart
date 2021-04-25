import 'package:flutter/material.dart';
import './constants/app.routes.dart';

class CategoriesItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoriesItem(this.id, this.title, this.color);

  void navigateToMealsScreenHandler(BuildContext ctx) {
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoryMealsScreen(id, title);
    //     },
    //   ),
    // );
    Navigator.of(ctx).pushNamed(AppRoutes.categoyMealPage, arguments: {
      'id': id,
      'title': title
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateToMealsScreenHandler(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [color.withOpacity(0.5), color],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    );
  }
}
