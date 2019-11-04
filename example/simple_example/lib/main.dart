import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

import 'apply_example.dart' as flutter_apply;
import 'normal_example.dart' as normal;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: scaffold() & tabC(length: 2) >
          onTabBarView() >>
              [
                flutter_apply.ExampleNew(),
                normal.ExampleOld(),
              ],
    );
  }
}
