import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../tracks.dart';
import 'pawn.dart';
import '../constants.dart';
import 'pawnPainter.dart';
import 'dart:ui' as ui;

class Pawns extends StatefulWidget {
  @override
  _PawnsState createState() => _PawnsState();
}

class _PawnsState extends State<Pawns> with TickerProviderStateMixin {
  Tracks tracks = Tracks();

  @override
  void initState() {
    super.initState();
    tracks.initializeTracks();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Pawn build called');

    return Stack(
      children: [
        // Left
        Pawn(
          imageName: 'maroon-pawn.png',
          trackSpots: tracks.getLeftTrack(1),
          pawnIndex: 1,
        ),
        Pawn(
          imageName: 'maroon-pawn.png',
          trackSpots: tracks.getLeftTrack(2),
          pawnIndex: 2,
        ),
        Pawn(
          imageName: 'maroon-pawn.png',
          trackSpots: tracks.getLeftTrack(3),
          pawnIndex: 3,
        ),
        Pawn(
          imageName: 'maroon-pawn.png',
          trackSpots: tracks.getLeftTrack(4),
          pawnIndex: 4,
        ),

        // Top
        Pawn(
          imageName: 'dark-pawn.png',
          trackSpots: tracks.getTopTrack(1),
          pawnIndex: 1,
        ),
        Pawn(
          imageName: 'dark-pawn.png',
          trackSpots: tracks.getTopTrack(2),
          pawnIndex: 2,
        ),
        Pawn(
          imageName: 'dark-pawn.png',
          trackSpots: tracks.getTopTrack(3),
          pawnIndex: 3,
        ),
        Pawn(
          imageName: 'dark-pawn.png',
          trackSpots: tracks.getTopTrack(4),
          pawnIndex: 4,
        ),

        // Right
        Pawn(
          imageName: 'orange-pawn.png',
          trackSpots: tracks.getRightTrack(1),
          pawnIndex: 1,
        ),
        Pawn(
          imageName: 'orange-pawn.png',
          trackSpots: tracks.getRightTrack(2),
          pawnIndex: 2,
        ),
        Pawn(
          imageName: 'orange-pawn.png',
          trackSpots: tracks.getRightTrack(3),
          pawnIndex: 3,
        ),
        Pawn(
          imageName: 'orange-pawn.png',
          trackSpots: tracks.getRightTrack(4),
          pawnIndex: 4,
        ),

        // Bottom
        Pawn(
          imageName: 'yellow-pawn.png',
          trackSpots: tracks.getBottomTrack(1),
          pawnIndex: 1,
        ),
        Pawn(
          imageName: 'yellow-pawn.png',
          trackSpots: tracks.getBottomTrack(2),
          pawnIndex: 2,
        ),
        Pawn(
          imageName: 'yellow-pawn.png',
          trackSpots: tracks.getBottomTrack(3),
          pawnIndex: 3,
        ),
        Pawn(
          imageName: 'yellow-pawn.png',
          trackSpots: tracks.getBottomTrack(4),
          pawnIndex: 4,
        ),
      ],
    );
  }
}
