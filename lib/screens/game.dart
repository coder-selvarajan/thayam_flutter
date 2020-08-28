import 'package:ThayamGame/tracks.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/painting.dart' show decodeImageFromList;
import '../constants.dart';
import '../widgets/board.dart';
import '../widgets/pawnPainter.dart';
import '../widgets/pawns.dart';
import '../tracks.dart';
import '../widgets/pawn.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  Tracks tracks = Tracks();

  @override
  void initState() {
    super.initState();
  }

  void initTracks() {
    tracks.initializeTracks();

    trackLeft = tracks.getLeftTrack(4);
    trackTop = tracks.getTopTrack(4);
    trackRight = tracks.getRightTrack(4);
    trackBottom = tracks.getBottomTrack(1);
  }

  Size getBoardSize(BuildContext context) {
    return Size(10, 10);
  }

  void initBoardSizes(double screenWidth, double screenHeight) {
    if (screenWidth > screenHeight) {
      bWidth = screenHeight - (screenHeight * 0.25);
      bHeight = bWidth;
    } else {
      bWidth = screenWidth - 20;
      bHeight = bWidth;
    }

    boardOffsetLeft = (screenWidth - bWidth) / 2;
    boardOffsetTop = (screenHeight - bHeight) / 2;
    bSquareWidth = bWidth / 15;

    pawnWidth = bSquareWidth * 1.2;
    pawnOffsetLeft = bSquareWidth * 0.1;
    pawnOffsetTop = bSquareWidth * 0.3;

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
