import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common.dart';
import '../constants.dart';
import 'pawn.dart';
import 'dart:ui' as ui;

class Pawns extends StatefulWidget {
//  Pawns({Key key, this.leftPawn, this.topPawn, this.rightPawn, this.bottomPawn})
//      : super(key: key);

  @override
  _PawnsState createState() => _PawnsState();
}

class _PawnsState extends State<Pawns> with TickerProviderStateMixin {
  double pawnWidth = bSquareWidth * 1.4;
  double leftAdjustment = -bLeftOffset + bSquareWidth * 0.7;
  double topAdjustment = -bTopOffset + bSquareWidth * 0.9;
  double leftSquarePos = 2.25;
  double topSquarePos = 3.75;
  Offset pos1;
  Offset pos2;
  Offset pos3;
  Animation pawnAnimation;
  AnimationController pawnController;
  Tween pawnTween;

  int trackIndex = 0;
  List<Spot> Spots = [];
  @override
  void initState() {
    super.initState();
    trackIndex = 0;

    Spots = trackBottom;

//    pos = [
//      Offset((2 * bSquareWidth) - leftAdjustment,
//          (2 * bSquareWidth) - topAdjustment),
//      Offset((2 * bSquareWidth) - leftAdjustment,
//          (3 * bSquareWidth) - topAdjustment),
//      Offset((2 * bSquareWidth) - leftAdjustment,
//          (4 * bSquareWidth) - topAdjustment),
//      Offset((2 * bSquareWidth) - leftAdjustment,
//          (5 * bSquareWidth) - topAdjustment),
//      Offset((3 * bSquareWidth) - leftAdjustment,
//          (5 * bSquareWidth) - topAdjustment),
//      Offset((4 * bSquareWidth) - leftAdjustment,
//          (5 * bSquareWidth) - topAdjustment),
//      Offset((5 * bSquareWidth) - leftAdjustment,
//          (5 * bSquareWidth) - topAdjustment)
//    ];

    pawnController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    pawnTween = Tween(
        begin: Spots[trackIndex].offset, end: Spots[trackIndex + 1].offset);
    pawnAnimation = pawnTween.animate(pawnController);

    pawnController.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        trackIndex++;
        pawnTap();
      }
    });
  }

  pawnTap() {
    print("pawnPos: $trackIndex");
    print("pawnController Status: ${pawnController.status}");
    if (trackIndex >= Spots.length) {
      return;
    }

    if (pawnController.status == AnimationStatus.dismissed) {
      pawnTween.begin = Spots[trackIndex];
//      pawnController.reset();
      pawnTween.end = Spots[trackIndex + 1];
      pawnController.forward();
    } else if (pawnController.status == AnimationStatus.completed) {
      pawnTween.begin = Spots[trackIndex + 1];
//      pawnController.reset();
      pawnTween.end = Spots[trackIndex];
      pawnController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Pawn build called');

    return AnimatedBuilder(
      animation: pawnAnimation,
      builder: (context, child) {
        return Positioned(
          left: pawnAnimation.value.dx,
          top: pawnAnimation.value.dy,
          width: pawnWidth,
          height: pawnWidth,
          child: child,
        );
      },
      child: GestureDetector(
        onTap: pawnTap,
        child: Image.asset("assets/images/maroon-pawn.png"),
      ),
    );
  }
}