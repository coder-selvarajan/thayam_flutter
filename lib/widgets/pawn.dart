import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import '../constants.dart';
import '../tracks.dart';

class Pawn extends StatefulWidget {
  final String imageName;
  final List<Spot> trackSpots;
  final int pawnIndex;

  const Pawn({Key key, this.imageName, this.trackSpots, this.pawnIndex})
      : super(key: key);

  @override
  _PawnState createState() => _PawnState();
}

class _PawnState extends State<Pawn> with TickerProviderStateMixin {
  double leftAdjustment = -boardOffsetLeft + bSquareWidth * 0.7;
  double topAdjustment = -boardOffsetTop + bSquareWidth * 0.9;
  double leftSquarePos = 2.25;
  double topSquarePos = 3.75;
  Animation<Offset> pawnAnimation;
  AnimationController pawnController;
  Tween<Offset> pawnTween;

  int trackIndex = 0;
  List<Spot> Spots = [];
  int score = 0;

  @override
  void initState() {
    super.initState();
    trackIndex = 0;
    Spots = widget.trackSpots;

    pawnController = AnimationController(
      duration: Duration(milliseconds: 250),
      vsync: this,
    );

    pawnTween = Tween<Offset>(
        begin: Spots[trackIndex].offset, end: Spots[trackIndex + 1].offset);
    pawnAnimation = pawnTween.animate(
      CurvedAnimation(
        parent: pawnController,
        curve: Curves.linear,
      ),
    );

    pawnController.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        trackIndex++;
//        sleep(Duration(milliseconds: 100));
        if (score > 0) {
          pawnTap();
        }
      }
    });
  }

  @override
  void dispose() {
    pawnController.dispose();
    super.dispose();
  }

  pawnTap() {
    if (score == 0) {
      score = new Random().nextInt(5) + 1;
    }
    score--;
    if (trackIndex >= Spots.length - 1) {
      return;
    }

    print("Score = $score");

//    print("pawnPos: $trackIndex");
//    print("pawnController Status: ${pawnController.status}");

//    pawnController.reset();
//    pawnTween.begin = Spots[trackIndex].offset;
//    pawnTween.end = Spots[trackIndex + 1].offset;
//    pawnController.forward();

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
        child: Image.asset("assets/images/${widget.imageName}"),
      ),
    );
    ;
  }
}
