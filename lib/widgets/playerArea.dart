import 'package:flutter/material.dart';
import 'playerBox.dart';
import '../constants.dart';

class PlayerArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: boardOffsetLeft,
          top: boardOffsetTop - playerStageHeight - playerStageGap,
          child: PlayerBox(
            stageSide: Side.Left,
            playerImage: 'player-maroon',
          ),
        ),
        Positioned(
          left: boardOffsetLeft,
          top: boardOffsetTop + bHeight + playerStageGap,
          child: PlayerBox(
            stageSide: Side.Bottom,
            playerImage: 'player-yellow',
          ),
        ),
        Positioned(
          left: boardOffsetLeft + bWidth - playerStageWidth,
          top: boardOffsetTop - playerStageHeight - playerStageGap,
          child: PlayerBox(
            stageSide: Side.Top,
            playerImage: 'player-dark',
          ),
        ),
        Positioned(
          left: boardOffsetLeft + bWidth - playerStageWidth,
          top: boardOffsetTop + bHeight + playerStageGap,
          child: PlayerBox(
            stageSide: Side.Right,
            playerImage: 'player-orange',
          ),
        ),
      ],
    );
  }
}
