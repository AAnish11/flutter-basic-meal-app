import 'package:flutter/material.dart';

class ScaffoldWrapper extends StatelessWidget {
  final Widget body;
  final String titleText;
  ScaffoldWrapper(this.titleText, this.body);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$titleText'),),
      body: body,
    );
  }
}