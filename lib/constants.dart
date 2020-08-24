import 'package:flutter/material.dart';
import 'common.dart';

bool testPaint = false;
double bWidth = 0;
double bHeight = 0;
double bSquareWidth = 0;

double bLeftOffset = 0;
double bTopOffset = 0;

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
  ..color = Color(0xEEF7CA18)
  ..style = PaintingStyle.fill;
