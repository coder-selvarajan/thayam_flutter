import 'package:ThayamGame/common.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/painting.dart' show decodeImageFromList;
import '../constants.dart';
import '../widgets/board.dart';
import '../widgets/pawn.dart';
import '../widgets/pawns.dart';
import '../common.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  void initState() {
    super.initState();
  }

  void initTracks() {
    trackLeft = Common().getBottomTrack(bSquareWidth);
    trackTop = Common().getBottomTrack(bSquareWidth);
    trackRight = Common().getBottomTrack(bSquareWidth);
    trackBottom = Common().getBottomTrack(bSquareWidth);
  }

  Size getBoardSize(BuildContext context) {
    return Size(10, 10);
  }

  void initBoardSizes(double screenWidth, double screenHeight) {
    bWidth = screenWidth - 20;
    bHeight = bWidth;

    bLeftOffset = 10;
    bTopOffset = (screenHeight - bWidth) / 2;
    bSquareWidth = bWidth / 15;

    initTracks();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initBoardSizes(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );

    print('Game build called');

    return Scaffold(
      body: Center(
        child: Container(
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
          child: Stack(
            alignment: Alignment.topLeft,
//            overflow: Overflow.visible,
            children: <Widget>[
              CustomPaint(
                //size: getBoardSize(context),
                painter: Board(),
              ),
              Pawns(),
            ],
          ),
        ),
      ),
    );
  }
}
