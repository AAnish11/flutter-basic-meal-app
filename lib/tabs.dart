import 'package:delimeals/models/meal.dart';
import 'package:flutter/material.dart';
import './categories.dart';
import './favorite.meals.dart';
import './drawer.menu.dart';

class AppTabs extends StatefulWidget {
  
  @override
  _AppBottomTabsState createState() => _AppBottomTabsState();
}

class _AppTopTabsState extends State<AppTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Meals'),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  child: Text('Categories'),
                ),
                Tab(
                  icon: Icon(Icons.favorite),
                  child: Text('Favorites'),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [CategoriesHome(), FavoriteMeals()],
          ),
        ));
  }
}

class _AppBottomTabsState extends State<AppTabs> {
  final List<Map<String, Object>> _views = [
    {
      'body': CategoriesHome(),
      'title': 'Categories',
    },
    {
      'body': FavoriteMeals(),
      'title': 'My Favorite Meals',
    },
  ];

  int _selectedIndex = 0;
  void onBottomNavigationChangeHandler(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(_views[_selectedIndex]['title'],),
          ),
          body: _views[_selectedIndex]['body'],
          drawer: AppDrawerMenus(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: onBottomNavigationChangeHandler,
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 6,
            selectedItemColor: Theme.of(context).accentColor,
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
            ],
          ),
        ));
  }
}
