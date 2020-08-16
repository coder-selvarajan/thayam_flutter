import 'package:flutter/material.dart';
import 'Constants.dart';
import 'Pawn.dart';
import 'dart:ui' as ui;

class PawnDisplay extends StatefulWidget {
  PawnDisplay(
      {Key key, this.leftPawn, this.topPawn, this.rightPawn, this.bottomPawn})
      : super(key: key);

  ui.Image leftPawn;
  ui.Image topPawn;
  ui.Image rightPawn;
  ui.Image bottomPawn;

  @override
  _PawnDisplayState createState() => _PawnDisplayState();
}

class _PawnDisplayState extends State<PawnDisplay> {
  bool isBig = false;
  double pawnWidth = bSquareWidth * 1.4;
  double leftAdjustment = -bLeftOffset + bSquareWidth * 0.7;
  double topAdjustment = -bTopOffset + bSquareWidth * 0.9;
  double leftSquarePos = 2.25;
  double topSquarePos = 3.75;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedPositioned(
          left: (leftSquarePos * bSquareWidth) - leftAdjustment,
          top: isBig ? (topSquarePos * bSquareWidth) - topAdjustment : 200,
          width: pawnWidth,
          height: pawnWidth,
          child: GestureDetector(
            onTap: () {
              print('tapped the image');
              setState(() {
                isBig = !isBig;
              });
            },
            child: Image.asset("assets/images/maroon-pawn.png"),
          ),
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOutQuad,
        ),
//        CustomPaint(
//          size: Size(400, 400),
//          painter: Pawn(widget.leftPawn, 2.25, 2.25),
//        ),
//        CustomPaint(
//          size: Size(400, 400),
//          painter: Pawn(widget.leftPawn, 2.25, 3.75),
//        ),
//        CustomPaint(
//          size: Size(400, 400),
//          painter: Pawn(widget.leftPawn, 3.75, 2.25),
//        ),
//        CustomPaint(
//          size: Size(400, 400),
//          painter: Pawn(widget.leftPawn, 3.75, 3.75),
//        ),
      ],
    );
  }
}
