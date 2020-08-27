import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common.dart';
import '../constants.dart';
import 'pawn.dart';
import 'dart:ui' as ui;

class Pawns extends StatefulWidget {
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
  Animation<Offset> pawnAnimation;
  AnimationController pawnController;
  Tween<Offset> pawnTween;

  int trackIndex = 0;
  List<Spot> Spots = [];
  @override
  void initState() {
    super.initState();
    trackIndex = 0;
    Spots = trackBottom;

    pawnController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    pawnTween = Tween<Offset>(
        begin: Spots[trackIndex].offset, end: Spots[trackIndex + 1].offset);
    pawnAnimation = pawnTween.animate(
      CurvedAnimation(
        parent: pawnController,
        curve: Curves.decelerate,
      ),
    );

    pawnController.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        trackIndex++;
        pawnTap();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    pawnController.dispose();
  }

  pawnTap() {
    print("pawnPos: $trackIndex");
    print("pawnController Status: ${pawnController.status}");
    if (trackIndex >= Spots.length) {
      return;
    }

    if (pawnController.status == AnimationStatus.dismissed) {
      pawnTween.begin = Spots[trackIndex].offset;
      pawnTween.end = Spots[trackIndex + 1].offset;
      pawnController.forward();
    } else if (pawnController.status == AnimationStatus.completed) {
      pawnTween.begin = Spots[trackIndex + 1].offset;
      pawnTween.end = Spots[trackIndex].offset;
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
          left: bLeftOffset + pawnAnimation.value.dx,
          top: bTopOffset + pawnAnimation.value.dy,
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
