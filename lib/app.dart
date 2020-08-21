import 'package:flutter/material.dart';
import 'screens/game.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thayam',
      home: Game(),
    );
  }
}
