import 'package:flutter/material.dart';
import 'dart:math';
import '../constants.dart';

class Dice extends StatefulWidget {
  Dice({Key key, this.playerSide}) : super(key: key);

  final Side playerSide;
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int diceOneIndex;
  int diceTwoIndex;
  double diceOneAngle;
  double diceTwoAngle;

  @override
  void initState() {
    super.initState();

    //initial dice setup with score and angle
    diceOneIndex = 1;
    diceTwoIndex = 1;
    diceOneAngle = 0.28;
    diceTwoAngle = 0.27;

    score[widget.playerSide.index] = diceOneIndex + diceTwoIndex;
  }

  diceClick() {
    setState(() {
      rollTheDice();
    });
  }

  void rollTheDice() {
    diceOneIndex = Random().nextInt(4);
    diceTwoIndex = Random().nextInt(4);

    if (diceOneIndex == 0 && diceTwoIndex == 0) {
      score[widget.playerSide.index] = 12;
    } else {
      score[widget.playerSide.index] = diceOneIndex + diceTwoIndex;
    }

    diceOneAngle = (Random().nextInt(99) + 1) / 100;
    diceTwoAngle = (Random().nextInt(99) + 1) / 100;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: diceClick,
      child: Row(
        children: [
          Transform.rotate(
            angle: pi / diceOneAngle,
            child: Container(
              width: diceWidth,
              height: diceHeight,
              child: Image.asset('assets/images/dice$diceOneIndex.png'),
            ),
          ),
          SizedBox(
            width: 2,
          ),
          Transform.rotate(
            angle: pi / diceTwoAngle,
            child: Container(
              width: diceWidth,
              height: diceHeight,
              child: Image.asset('assets/images/dice$diceTwoIndex.png'),
            ),
          ),
        ],
      ),
    );
  }
}
