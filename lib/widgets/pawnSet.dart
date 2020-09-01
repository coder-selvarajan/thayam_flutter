import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../tracks.dart';
import 'pawn.dart';
import '../constants.dart';
import 'pawnPainter.dart';
import 'dart:ui' as ui;

class PawnSet extends StatefulWidget {
  @override
  _PawnSetState createState() => _PawnSetState();
}

class _PawnSetState extends State<PawnSet> with TickerProviderStateMixin {
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
          pawnSide: Side.Left,
          pawnIndex: 1,
        ),
        Pawn(
          imageName: 'maroon-pawn.png',
          trackSpots: tracks.getLeftTrack(2),
          pawnSide: Side.Left,
          pawnIndex: 2,
        ),
        Pawn(
          imageName: 'maroon-pawn.png',
          trackSpots: tracks.getLeftTrack(3),
          pawnSide: Side.Left,
          pawnIndex: 3,
        ),
        Pawn(
          imageName: 'maroon-pawn.png',
          trackSpots: tracks.getLeftTrack(4),
          pawnSide: Side.Left,
          pawnIndex: 4,
        ),

        // Top
        Pawn(
          imageName: 'dark-pawn.png',
          trackSpots: tracks.getTopTrack(1),
          pawnSide: Side.Top,
          pawnIndex: 1,
        ),
        Pawn(
          imageName: 'dark-pawn.png',
          trackSpots: tracks.getTopTrack(2),
          pawnSide: Side.Top,
          pawnIndex: 2,
        ),
        Pawn(
          imageName: 'dark-pawn.png',
          trackSpots: tracks.getTopTrack(3),
          pawnSide: Side.Top,
          pawnIndex: 3,
        ),
        Pawn(
          imageName: 'dark-pawn.png',
          trackSpots: tracks.getTopTrack(4),
          pawnSide: Side.Top,
          pawnIndex: 4,
        ),

        // Right
        Pawn(
          imageName: 'orange-pawn.png',
          trackSpots: tracks.getRightTrack(1),
          pawnSide: Side.Right,
          pawnIndex: 1,
        ),
        Pawn(
          imageName: 'orange-pawn.png',
          trackSpots: tracks.getRightTrack(2),
          pawnSide: Side.Right,
          pawnIndex: 2,
        ),
        Pawn(
          imageName: 'orange-pawn.png',
          trackSpots: tracks.getRightTrack(3),
          pawnSide: Side.Right,
          pawnIndex: 3,
        ),
        Pawn(
          imageName: 'orange-pawn.png',
          trackSpots: tracks.getRightTrack(4),
          pawnSide: Side.Right,
          pawnIndex: 4,
        ),

        // Bottom
        Pawn(
          imageName: 'yellow-pawn.png',
          trackSpots: tracks.getBottomTrack(1),
          pawnSide: Side.Bottom,
          pawnIndex: 1,
        ),
        Pawn(
          imageName: 'yellow-pawn.png',
          trackSpots: tracks.getBottomTrack(2),
          pawnSide: Side.Bottom,
          pawnIndex: 2,
        ),
        Pawn(
          imageName: 'yellow-pawn.png',
          trackSpots: tracks.getBottomTrack(3),
          pawnSide: Side.Bottom,
          pawnIndex: 3,
        ),
        Pawn(
          imageName: 'yellow-pawn.png',
          trackSpots: tracks.getBottomTrack(4),
          pawnSide: Side.Bottom,
          pawnIndex: 4,
        ),
      ],
    );
  }
}
