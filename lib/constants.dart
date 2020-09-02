import 'package:flutter/material.dart';
import 'tracks.dart';

bool testPaint = false;
double bWidth = 0;
double bHeight = 0;
double bSquareWidth = 0;
double bSmallCircleWidth = 0;
double pawnWidth = 0;
double pawnOffsetLeft = 0.0;
double pawnOffsetTop = 0.0;

double boardOffsetLeft = 0;
double boardOffsetTop = 0;

double playerStageWidth = 0;
double playerStageHeight = 0;
double playerStageGap = 0;

double diceWidth = 0;
double diceHeight = 0;

List<int> score = [0, 0, 0, 0];
enum Side { Bottom, Left, Top, Right }

List<Spot> trackLeft = [];
List<Spot> trackTop = [];
List<Spot> trackRight = [];
List<Spot> trackBottom = [];

Paint commonStroke = new Paint()
  ..color = Colors.black26
  ..style = PaintingStyle.stroke
  ..strokeWidth = 1.0;

Paint commonStroke2 = new Paint()
  ..color = Colors.black45.withOpacity(0.4)
  ..style = PaintingStyle.stroke
  ..strokeWidth = 1.0;

Paint commonPaint = new Paint()
  ..color = Colors.white54
  ..style = PaintingStyle.fill;

Paint whitePaint = new Paint()
  ..color = Colors.white
  ..style = PaintingStyle.fill;

//    commonPaint = new Paint()
//      ..color = Color(0xAAFCE7C0)
//      ..style = PaintingStyle.fill;

Paint commonPaint2 = new Paint()
  ..color = Colors.white.withOpacity(0.75)
  ..style = PaintingStyle.fill;

Paint lightPaint = new Paint()
  ..color = Colors.white.withOpacity(0)
  ..style = PaintingStyle.fill;

Paint leftPaint = new Paint()
  ..color = Color(0xEE860303)
  ..style = PaintingStyle.fill;

Paint topPaint = new Paint()
  ..color = Color(0xEE625025)
  ..style = PaintingStyle.fill;

Paint rightPaint = new Paint()
  ..color = Color(0xEEE87E04)
  ..style = PaintingStyle.fill;

Paint bottomPaint = new Paint()
//  ..color = Color(0xEEF7CA18)
  ..color = Color(0xEEF7BD00)
  ..style = PaintingStyle.fill;

List<Color> playerColorsLight = [
  Color(0xAAFAEAB8),
  Color(0x6FFCE2E2),
  Color(0xAACBC1AA),
  Color(0xAAFCE0BB),
];
