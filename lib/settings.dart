import 'package:flutter/material.dart';
import 'scaffold.wrapper.dart';

class AppFilters extends StatefulWidget {
  final Map<String, bool> _filters;
  final Function _updateFilters;
  AppFilters(this._filters, this._updateFilters);

  @override
  _AppFiltersState createState() => _AppFiltersState();
}

class _AppFiltersState extends State<AppFilters> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
        'Settings',
        Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Setup your filters for the meals!',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ),
            Container(
              height: 300,
              child: ListView(
                children: [
                  SwitchListTile(
                    value: widget._filters['isGlutenFree'],
                    title: Text('GlutenFree'),
                    subtitle: Text('Filters only the GlutenFree meals'),
                    onChanged: (newVal) {
                      setState(() {
                        widget._filters['isGlutenFree'] = newVal;
                      });
                    },
                  ),
                  SwitchListTile(
                    value: widget._filters['isVegan'],
                    title: Text('Vegan'),
                    subtitle: Text('Filters only the Vegan meals'),
                    onChanged: (newVal) {
                      setState(() {
                        widget._filters['isVegan'] = newVal;
                      });
                    },
                  ),
                  SwitchListTile(
                    value: widget._filters['isLactoseFree'],
                    title: Text('LactoseFree'),
                    subtitle: Text('Filters only the LactoseFree meals'),
                    onChanged: (newVal) {
                      setState(() {
                        widget._filters['isLactoseFree'] = newVal;
                      });
                    },
                  ),
                  SwitchListTile(
                    value: widget._filters['isVegetarian'],
                    title: Text('Vegetarian'),
                    subtitle: Text('Filters only the Vegetarian meals'),
                    onChanged: (newVal) {
                      setState(() {
                        widget._filters['isVegetarian'] = newVal;
                      });
                    },
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                child: Text('Save Setting!'),
                onPressed: () {
                  widget._updateFilters(widget._filters);
                  Navigator.of(context).pushReplacementNamed('/');
                },
              ),
            )
          ],
        ));
  }
}
