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
        PlayerText(
          playerName: 'PLAYER 1',
          playerSide: Side.Bottom,
        ),
        PlayerText(
          playerName: 'PLAYER 2',
          playerSide: Side.Left,
        ),
        PlayerText(
          playerName: 'PLAYER 3',
          playerSide: Side.Top,
        ),
        PlayerText(
          playerName: 'PLAYER 4',
          playerSide: Side.Right,
        ),
      ],
    );
  }
}

class PlayerText extends StatelessWidget {
  const PlayerText({
    Key key,
    this.playerSide,
    this.playerName,
  }) : super(key: key);

  final Side playerSide;
  final String playerName;

  @override
  Widget build(BuildContext context) {
    double left;
    double top;
    double width;
    double height;
    int quarterTurn;

    switch (playerSide) {
      case Side.Bottom:
        {
          left = boardOffsetLeft;
          top = boardOffsetTop + (14.2 * bSquareWidth);
          width = 6 * bSquareWidth;
          height = 0.8 * bSquareWidth;

          quarterTurn = 4;
        }
        break;

      case Side.Left:
        {
          left = boardOffsetLeft;
          top = boardOffsetTop;
          width = 0.8 * bSquareWidth;
          height = 6 * bSquareWidth;

          quarterTurn = 1;
        }
        break;

      case Side.Top:
        {
          left = boardOffsetLeft + (9 * bSquareWidth);
          top = boardOffsetTop + (0.2 * bSquareWidth);
          width = 6 * bSquareWidth;
          height = 0.6 * bSquareWidth;

          quarterTurn = 2;
        }
        break;
      case Side.Right:
        {
          left = boardOffsetLeft + (14 * bSquareWidth);
          top = boardOffsetTop + (9 * bSquareWidth);
          width = 0.65 * bSquareWidth;
          height = 6 * bSquareWidth;

          quarterTurn = 1;
        }
        break;
    }

    return Positioned(
      left: left,
      top: top,
      width: width,
      height: height,
      child: RotatedBox(
        quarterTurns: quarterTurn,
        child: Text(
          playerName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
