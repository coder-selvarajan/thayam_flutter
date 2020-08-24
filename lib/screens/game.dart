import 'package:ThayamGame/common.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/painting.dart' show decodeImageFromList;
import '../constants.dart';
import '../widgets/board.dart';
import '../widgets/pawnsPainter.dart';
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

    bWidth = 400; //MediaQuery.of(context).size.width - 20;
    bHeight = bWidth;
    bSquareWidth = bWidth / 15;
    bLeftOffset = 8;
    bTopOffset = 10;
    print('initBoardSizes');

    initTracks();
  }

  void initTracks() {
    trackLeft = Common().getBottomTrack(bSquareWidth);
    trackTop = Common().getBottomTrack(bSquareWidth);
    trackRight = Common().getBottomTrack(bSquareWidth);
    trackBottom = Common().getBottomTrack(bSquareWidth);
  }

  Size getBoardSize(BuildContext context) {
    return Size(300, 300);
  }

//  Future<ui.Image> loadImage(String imageName) async {
//    final data = await rootBundle.load(imageName);
//    return decodeImageFromList(data.buffer.asUint8List());
//  }
//
//  loadPawnImage() async {
//    leftPawn = await loadImage("assets/images/maroon-pawn.png");
//    topPawn = await loadImage("assets/images/dark-pawn.png");
//    rightPawn = await loadImage("assets/images/orange-pawn.png");
//    bottomPawn = await loadImage("assets/images/yellow-pawn.png");
//  }
//
//  ui.Image leftPawn;
//  ui.Image topPawn;
//  ui.Image rightPawn;
//  ui.Image bottomPawn;

  initBoardSizes() {}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initBoardSizes();
//    loadPawnImage();

    print('Game build called');

    return Scaffold(
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
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              left: 0,
              top: (MediaQuery.of(context).size.height - 400) / 2,
              child: CustomPaint(
                size: getBoardSize(context),
                painter: Board(),
              ),
            ),
//            Pawns(),
            Positioned(
              left: 10,
              top: 250, //(MediaQuery.of(context).size.height - 400) / 2,
              child: Pawns(),
            ),
          ],
        ),
      ),
    );
  }
}
