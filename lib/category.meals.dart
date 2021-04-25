import 'package:flutter/material.dart';
import './constants/dummy_data.dart';
import './models/meal.dart';
import './meal.item.dart';

class CategoryMealsScreen extends StatefulWidget {
  // final String catId;
  // final String catName;
  
  // CategoryMealsScreen(this.catId, this.catName);

  final List<Meal> _availableMeals;
  CategoryMealsScreen(this._availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeParam =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catName = routeParam['title'];
    final mealsByCategory = widget._availableMeals
        .where((meal) => meal.categories.contains(routeParam['id']))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals For: ${catName}'),
      ),
      body: Center(
          child: ListView.builder(
        itemBuilder: (BuildContext ctx, i) {
          final Meal mealData = mealsByCategory[i];
          return Container(
            child: MealItem(
              mealId: mealData.id,
              title: mealData.title,
              imageUrl: mealData.imageUrl,
              affordability: mealData.affordability,
              complexity: mealData.complexity,
              duration: mealData.duration,
            ),
          );
        },
        itemCount: mealsByCategory.length,
      )),
    );
  }
}
