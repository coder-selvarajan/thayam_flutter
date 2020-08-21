import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'pawn.dart';
import 'dart:ui' as ui;

class Pawns extends StatefulWidget {
//  Pawns({Key key, this.leftPawn, this.topPawn, this.rightPawn, this.bottomPawn})
//      : super(key: key);
//
//  ui.Image leftPawn;
//  ui.Image topPawn;
//  ui.Image rightPawn;
//  ui.Image bottomPawn;

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

  pawnTap() {
    if (pawnController.status == AnimationStatus.completed) {
      pawnController.reverse();
    } else if (pawnController.status == AnimationStatus.dismissed) {
      pawnController.forward();
    }
  }

  @override
  void initState() {
    super.initState();

    pos1 = Offset((leftSquarePos * bSquareWidth) - leftAdjustment,
        (topSquarePos * bSquareWidth) - topAdjustment);
    pos2 = Offset((leftSquarePos * bSquareWidth) - leftAdjustment,
        (6 * bSquareWidth) - topAdjustment);
    pos3 = Offset((6 * bSquareWidth) - leftAdjustment,
        (6 * bSquareWidth) - topAdjustment);

    pawnController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    pawnAnimation = Tween(begin: pos1, end: pos2).animate(
      CurvedAnimation(parent: pawnController, curve: Curves.easeIn),
    );

    pawnController.forward();

    pawnController.addStatusListener((status) {});
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
