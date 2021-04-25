import 'dart:ui';

import 'package:flutter/material.dart';
import './constants/app.routes.dart';

class AppDrawerMenus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Drawer(
      elevation: 6,
      semanticLabel: 'Just Demo',
      child: Column(
        children: [
          Container(
            height: 200,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryColor.withOpacity(0.6), primaryColor],
              ),
            ),
            child: Center(
              child: Text(
                'My Meals!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.food_bank),
            title: Text(
              'Meals',
              style: (TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Seetings',
              style: (TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.appFilter);
            },
          )
        ],
      ),
    );
  }
}
