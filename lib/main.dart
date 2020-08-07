import 'package:ThayamGame/Board.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
            child: SizedBox.expand(
              child: CustomPaint(
                painter: Board(),
                child: Container(),
              ),
            ),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: [
//                Padding(
//                  padding: EdgeInsets.all(20.0),
//                  child: Text(
//                    "Thayam App",
//                    style: TextStyle(
//                      fontSize: 20.0,
//                      color: Colors.white,
//                    ),
//                  ),
//                ),
//                SizedBox.expand(
//                  child: CustomPaint(
//                    painter: Board(),
//                    child: Container(),
//                  ),
//                ),
//              ],
//            ),
          ),
        ),
      ),
    );
  }
}
