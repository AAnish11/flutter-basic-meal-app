import 'package:flutter/material.dart';
import './constants/app.routes.dart';
import './category.meals.dart';
import './meal.details.dart';
import './tabs.dart';
import './settings.dart';
import './constants/dummy_data.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _defaultFilters = {
    'isGlutenFree': false,
    'isVegan': false,
    'isVegetarian': false,
    'isLactoseFree': false,
  };
  List<Meal> _filteredMeals = DUMMY_MEALS;
  void _updateFilterHandler(Map<String, bool> filters) {
    setState(() {
      _defaultFilters = filters;
      _filteredMeals = DUMMY_MEALS.where((meal) {
        if (_defaultFilters['isGlutenFree'] && !meal.isGlutenFree 
          || _defaultFilters['isVegan'] && !meal.isVegan 
          || _defaultFilters['isVegetarian'] && !meal.isVegetarian
          || _defaultFilters['isLactoseFree'] && !meal.isLactoseFree
        ) {
          return false;
        }
        return true;
      }).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delimeals',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesHome(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => AppTabs(),
        AppRoutes.categoyMealPage: (ctx) => CategoryMealsScreen(_filteredMeals),
        AppRoutes.mealDetailPage: (_) => MealDetails(),
        AppRoutes.appFilter: (_) =>
            AppFilters(_defaultFilters, _updateFilterHandler),
      },
    );
  }
}
