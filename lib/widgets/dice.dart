import 'package:flutter/material.dart';
import 'dart:math';
import '../constants.dart';

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int diceOneIndex = 1;
  int diceTwoIndex = 1;
  double diceOneAngle = 0.28;
  double diceTwoAngle = 0.27;

  diceClick() {
    setState(() {
      rollTheDice();
    });
  }

  void rollTheDice() {
    diceOneIndex = Random().nextInt(4);
    diceTwoIndex = Random().nextInt(4);
    diceOneAngle = (Random().nextInt(99) + 1) / 100;
    diceTwoAngle = (Random().nextInt(99) + 1) / 100;
  }

  @override
  Widget build(BuildContext context) {
//    rollTheDice();

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
