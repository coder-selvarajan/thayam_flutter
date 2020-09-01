import 'package:ThayamGame/constants.dart';
import 'package:flutter/material.dart';
import 'dice.dart';

class PlayerBox extends StatefulWidget {
  PlayerBox({Key key, this.stageSide, this.playerImage}) : super(key: key);

  final Side stageSide;
  final String playerImage;
  @override
  _PlayerBoxState createState() => _PlayerBoxState();
}

class _PlayerBoxState extends State<PlayerBox> {
  @override
  Widget build(BuildContext context) {
    if (widget.stageSide == Side.Left || widget.stageSide == Side.Bottom) {
      return Container(
        width: playerStageWidth,
        height: playerStageHeight,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PlayerIcon(
              playerIconName: widget.playerImage,
            ),
            Dice(
              playerSide: widget.stageSide,
            ),
          ],
        ),
      );
    } else {
      // Side.Right (OR) Side.Top
      return Container(
        width: playerStageWidth,
        height: playerStageHeight,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Dice(
              playerSide: widget.stageSide,
            ),
            PlayerIcon(
              playerIconName: widget.playerImage,
            ),
          ],
        ),
      );
    }
  }
}

class PlayerIcon extends StatelessWidget {
  const PlayerIcon({
    Key key,
    this.playerIconName,
  }) : super(key: key);

  final String playerIconName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: bSquareWidth * 1.5,
      height: bSquareWidth * 1.5,
      child: Image.asset('assets/images/$playerIconName.png'),
    );
  }
}
