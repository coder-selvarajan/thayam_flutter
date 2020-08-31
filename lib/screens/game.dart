import 'package:ThayamGame/tracks.dart';
import 'package:ThayamGame/widgets/playerArea.dart';
import 'package:flutter/material.dart';
import '../common.dart';
import '../constants.dart';
import '../widgets/board.dart';
import '../widgets/pawnSet.dart';
import '../tracks.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  Tracks tracks = Tracks();

  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Common().initBoardSizes(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );
    tracks = Common().initTracks();

    print('Game build called');

    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/wooden-bg.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.topLeft,
            overflow: Overflow.visible,
            children: <Widget>[
              CustomPaint(
                painter: Board(),
              ),
              PawnSet(),
              PlayerArea(),
            ],
          ),
        ),
      ),
    );
  }
}
