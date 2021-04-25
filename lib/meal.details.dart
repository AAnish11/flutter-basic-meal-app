import 'package:flutter/material.dart';
import './scaffold.wrapper.dart';
import './constants/dummy_data.dart';

class MealDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeParam =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealId = routeParam['id'];
    final mealData = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    print(mealData.imageUrl);
    return ScaffoldWrapper(
      mealData.title,
      Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                mealData.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Container(
                height: 100,
                margin: EdgeInsets.all(10),
                child: Text(
                  'Ingredients',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ),
            Center(
              child: Container(
                child: GridTileBar(
                  leading: CircleAvatar(
                    child: Text('1'),
                    foregroundColor: Colors.blue,
                    backgroundColor: Theme.of(context).accentColor,
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  title: Text('Demo !'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
