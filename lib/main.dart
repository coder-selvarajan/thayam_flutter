import 'package:ThayamGame/Board.dart';
import 'package:ThayamGame/Pawns.dart';
import 'package:ThayamGame/Pawn.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/painting.dart' show decodeImageFromList;
import 'Constants.dart';
import 'PawnDisplay.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    bWidth = 400; //MediaQuery.of(context).size.width - 20;
    bHeight = bWidth;
    bSquareWidth = bWidth / 15;
    bLeftOffset = 8;
    bTopOffset = 10;
    print('initBoardSizes');
  }

  Size getBoardSize(BuildContext context) {
    return Size(300, 300);
  }

  Future<ui.Image> loadImage(String imageName) async {
    final data = await rootBundle.load(imageName);
    return decodeImageFromList(data.buffer.asUint8List());
  }

  loadPawnImage() async {
    leftPawn = await loadImage("assets/images/maroon-pawn.png");
    topPawn = await loadImage("assets/images/dark-pawn.png");
    rightPawn = await loadImage("assets/images/orange-pawn.png");
    bottomPawn = await loadImage("assets/images/yellow-pawn.png");
  }

  ui.Image leftPawn;
  ui.Image topPawn;
  ui.Image rightPawn;
  ui.Image bottomPawn;

  initBoardSizes() {}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initBoardSizes();
    loadPawnImage();

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
                CustomPaint(
                  size: getBoardSize(context),
                  painter: Pawns(leftPawn, topPawn, rightPawn, bottomPawn),
                ),
                PawnDisplay(
                    leftPawn: leftPawn,
                    topPawn: topPawn,
                    rightPawn: rightPawn,
                    bottomPawn: bottomPawn),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
