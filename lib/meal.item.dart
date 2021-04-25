import 'package:flutter/material.dart';
import './models/meal.dart';
import './constants/app.routes.dart';

class MealItem extends StatelessWidget {
  final String mealId;
  final String title;
  final int duration;
  final String imageUrl;
  final Affordability affordability;
  final Complexity complexity;

  MealItem(
      {
      @required this.mealId,
      @required this.title,
      @required this.affordability,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity});

  String get mealComplexity {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get mealAffordability {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unknown';
    }
  }

  void onMealClickHandler (BuildContext ctx) {
    Navigator.of(ctx).pushNamed(AppRoutes.mealDetailPage, arguments: {
      'id': mealId,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onMealClickHandler(context);
      },
      splashColor: Theme.of(context).accentColor,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 260,
                    width: double.infinity,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 6,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    width: 300,
                    color: Colors.black45,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MealBottomInfo(Icons.schedule, '$duration min'),
                  MealBottomInfo(Icons.work, '$mealComplexity'),
                  MealBottomInfo(Icons.attach_money, '$mealAffordability'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MealBottomInfo extends StatelessWidget {
  final IconData icon;
  final String label;

  MealBottomInfo(
    this.icon,
    this.label,
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Icon(icon), SizedBox(width: 8), Text(label)],
    );
  }
}
