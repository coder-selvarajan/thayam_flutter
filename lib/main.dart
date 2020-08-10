import 'package:ThayamGame/Board.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Size getBoardSize(BuildContext context) {
//    var screenSize = MediaQuery.of(context).size;
    return Size(400, 400);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thayam Flutter App',
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/wooden-bg.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                CustomPaint(
                  size: getBoardSize(context),
                  painter: Board(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
