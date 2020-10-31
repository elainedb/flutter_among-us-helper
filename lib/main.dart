import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          AdaptiveContainer(
            constraints: AdaptiveConstraints(
              xsmall: true,
              small: true,
              medium: false,
              large: false,
              xlarge: false,
            ),
            child: MainLayout(2),
          ),
          AdaptiveContainer(
            constraints: AdaptiveConstraints(
              xsmall: false,
              small: false,
              medium: true,
              large: true,
              xlarge: true,
            ),
            child: MainLayout(4),
          ),
        ],
      ),
    );
  }
}

class MainLayout extends StatelessWidget {
  final colsNumber;

  MainLayout(this.colsNumber);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height /*- kToolbarHeight - 24*/) / (12/colsNumber);
    final double itemWidth = size.width / colsNumber;

    return GridView.count(
      shrinkWrap: true,
      childAspectRatio: (itemWidth / itemHeight),
      physics: new NeverScrollableScrollPhysics(),
      crossAxisCount: colsNumber,
      children: <Widget>[
        GridItem(Colors.red),
        GridItem(Colors.indigoAccent),
        GridItem(Colors.green),
        GridItem(Colors.pinkAccent),
        GridItem(Colors.orange),
        GridItem(Colors.yellow),
        GridItem(Colors.black),
        GridItem(Colors.white),
        GridItem(Colors.deepPurpleAccent),
        GridItem(Colors.brown),
        GridItem(Colors.cyanAccent),
        GridItem(Colors.lightGreenAccent),
      ],
    );
  }
}

class GridItem extends StatelessWidget {
  final color;

  GridItem(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}