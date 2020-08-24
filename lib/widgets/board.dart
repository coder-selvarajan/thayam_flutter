import "package:flutter/material.dart";
import 'package:ThayamGame/constants.dart';

class Board extends CustomPainter {
  Canvas bCanvas;

  @override
  void paint(Canvas canvas, Size size) {
//    print('Board paint called');
    bCanvas = canvas;

    drawBoard();
    drawAllSquares();
    if (!testPaint) {
      drawCornerCross();
      drawMidCross();
    }
    drawPawnStage();
  }

  drawPawnStage() {
    //big circles on all four sides

    drawCircle(leftPaint, commonStroke, bLeftOffset + (3 * bSquareWidth),
        bTopOffset + (3 * bSquareWidth), bSquareWidth * 2);
    drawCircle(topPaint, commonStroke, bLeftOffset + (12 * bSquareWidth),
        bTopOffset + (3 * bSquareWidth), bSquareWidth * 2);
    drawCircle(rightPaint, commonStroke, bLeftOffset + (12 * bSquareWidth),
        bTopOffset + (12 * bSquareWidth), bSquareWidth * 2);
    drawCircle(bottomPaint, commonStroke, bLeftOffset + (3 * bSquareWidth),
        bTopOffset + (12 * bSquareWidth), bSquareWidth * 2);

    //Left - inner circles
    drawCircle(commonPaint2, commonStroke, bLeftOffset + (2.25 * bSquareWidth),
        bTopOffset + (2.25 * bSquareWidth), bSquareWidth * 0.6);
    drawCircle(commonPaint2, commonStroke, bLeftOffset + (3.75 * bSquareWidth),
        bTopOffset + (2.25 * bSquareWidth), bSquareWidth * 0.6);
    drawCircle(commonPaint2, commonStroke, bLeftOffset + (2.25 * bSquareWidth),
        bTopOffset + (3.75 * bSquareWidth), bSquareWidth * 0.6);
    drawCircle(commonPaint2, commonStroke, bLeftOffset + (3.75 * bSquareWidth),
        bTopOffset + (3.75 * bSquareWidth), bSquareWidth * 0.6);

    //Top - inner circles
    drawCircle(commonPaint2, commonStroke, bLeftOffset + (11.25 * bSquareWidth),
        bTopOffset + (2.25 * bSquareWidth), bSquareWidth * 0.6);
    drawCircle(commonPaint2, commonStroke, bLeftOffset + (12.75 * bSquareWidth),
        bTopOffset + (2.25 * bSquareWidth), bSquareWidth * 0.6);
    drawCircle(commonPaint2, commonStroke, bLeftOffset + (11.25 * bSquareWidth),
        bTopOffset + (3.75 * bSquareWidth), bSquareWidth * 0.6);
    drawCircle(commonPaint2, commonStroke, bLeftOffset + (12.75 * bSquareWidth),
        bTopOffset + (3.75 * bSquareWidth), bSquareWidth * 0.6);

    //Right - inner circles
    drawCircle(commonPaint2, commonStroke, bLeftOffset + (11.25 * bSquareWidth),
        bTopOffset + (11.25 * bSquareWidth), bSquareWidth * 0.6);
    drawCircle(commonPaint2, commonStroke, bLeftOffset + (12.75 * bSquareWidth),
        bTopOffset + (11.25 * bSquareWidth), bSquareWidth * 0.6);
    drawCircle(commonPaint2, commonStroke, bLeftOffset + (11.25 * bSquareWidth),
        bTopOffset + (12.75 * bSquareWidth), bSquareWidth * 0.6);
    drawCircle(commonPaint2, commonStroke, bLeftOffset + (12.75 * bSquareWidth),
        bTopOffset + (12.75 * bSquareWidth), bSquareWidth * 0.6);

    //Bottom - inner circles
    drawCircle(commonPaint2, commonStroke, bLeftOffset + (2.25 * bSquareWidth),
        bTopOffset + (11.25 * bSquareWidth), bSquareWidth * 0.6);
    drawCircle(commonPaint2, commonStroke, bLeftOffset + (3.75 * bSquareWidth),
        bTopOffset + (11.25 * bSquareWidth), bSquareWidth * 0.6);
    drawCircle(commonPaint2, commonStroke, bLeftOffset + (2.25 * bSquareWidth),
        bTopOffset + (12.75 * bSquareWidth), bSquareWidth * 0.6);
    drawCircle(commonPaint2, commonStroke, bLeftOffset + (3.75 * bSquareWidth),
        bTopOffset + (12.75 * bSquareWidth), bSquareWidth * 0.6);

//    drawSquare(lightPaint, commonStroke2, leftOffset + squareWidth,
//        topOffset + squareWidth, squareWidth * 2);
//    drawSquare(lightPaint, commonStroke2, leftOffset + (3 * squareWidth),
//        topOffset + (3 * squareWidth), squareWidth * 2);
  }

  drawBoard() {
    var rect = Rect.fromLTWH(bLeftOffset, bTopOffset, bWidth, bWidth);
    var paint = Paint()..color = Colors.white.withOpacity(0.5);
    bCanvas.drawRect(rect, paint);
  }

  drawCross(Paint paint, double left, double top, double width) {
    bCanvas.drawLine(
        Offset(left, top), Offset(left + width, top + width), paint);

    bCanvas.drawLine(
        Offset(left, top + width), Offset(left + width, top), paint);
  }

  drawMidCross() {
    // bottom triangle
    drawBottomTriangle(
        bottomPaint,
        bLeftOffset + (6 * bSquareWidth),
        bTopOffset + (7 * bSquareWidth) + (bSquareWidth / 2),
        (bSquareWidth * 3),
        (bSquareWidth * 1.5));

    // left triangle
    drawLeftTriangle(
        leftPaint,
        bLeftOffset + (6 * bSquareWidth),
        bTopOffset + (6 * bSquareWidth),
        (bSquareWidth * 1.5),
        (bSquareWidth * 3));

    // Top triangle
    drawTopTriangle(
        topPaint,
        bLeftOffset + (6 * bSquareWidth),
        bTopOffset + (6 * bSquareWidth),
        (bSquareWidth * 3),
        (bSquareWidth * 1.5));

    // Right triangle
    drawRightTriangle(
        rightPaint,
        bLeftOffset + (7 * bSquareWidth) + (bSquareWidth / 2),
        bTopOffset + (6 * bSquareWidth),
        (bSquareWidth * 1.5),
        (bSquareWidth * 3));

    //Middle Box
    drawSquareWithCross(
        lightPaint,
        commonStroke,
        commonStroke2,
        bLeftOffset + (6 * bSquareWidth),
        bTopOffset + (6 * bSquareWidth),
        bSquareWidth * 3);
  }

  drawBottomTriangle(
      Paint paint, double left, double top, double width, double height) {
    Path path = Path()
      ..moveTo(left, top + height)
      ..lineTo(left + (width / 2), top)
      ..lineTo(left + width, top + height)
      ..lineTo(left, top + height);
    bCanvas.drawPath(path, paint);
  }

  drawLeftTriangle(
      Paint paint, double left, double top, double width, double height) {
    Path path = Path()
      ..moveTo(left, top)
      ..lineTo(left + width, top + (height / 2))
      ..lineTo(left, top + height)
      ..lineTo(left, top);
    bCanvas.drawPath(path, paint);
  }

  drawTopTriangle(
      Paint paint, double left, double top, double width, double height) {
    Path path = Path()
      ..moveTo(left, top)
      ..lineTo(left + (width / 2), top + height)
      ..lineTo(left + width, top)
      ..lineTo(left, top);
    bCanvas.drawPath(path, paint);
  }

  drawRightTriangle(
      Paint paint, double left, double top, double width, double height) {
    Path path = Path()
      ..moveTo(left, top + (height / 2))
      ..lineTo(left + (width), top)
      ..lineTo(left + width, top + height)
      ..lineTo(left, top + (height / 2));
    bCanvas.drawPath(path, paint);
  }

  drawCornerCross() {
    //Corner squares & cross
    //Left-Top
    drawSquareWithCross(
        commonPaint,
        commonStroke2,
        commonStroke2,
        bLeftOffset + (5 * bSquareWidth),
        bTopOffset + (5 * bSquareWidth),
        bSquareWidth);

    //Left-Bottom
    drawSquareWithCross(
        commonPaint,
        commonStroke2,
        commonStroke2,
        bLeftOffset + (5 * bSquareWidth),
        bTopOffset + (9 * bSquareWidth),
        bSquareWidth);

    //Right-Top
    drawSquareWithCross(
        commonPaint,
        commonStroke2,
        commonStroke2,
        bLeftOffset + (9 * bSquareWidth),
        bTopOffset + (5 * bSquareWidth),
        bSquareWidth);

    //Right-Bottom
    drawSquareWithCross(
        commonPaint,
        commonStroke2,
        commonStroke2,
        bLeftOffset + (9 * bSquareWidth),
        bTopOffset + (9 * bSquareWidth),
        bSquareWidth);
  }

  drawAllSquares() {
    //Left squares
    for (var i = 0; i <= 5; i++) {
      // fill
      drawSquare(commonPaint, commonStroke, bLeftOffset + (i * bSquareWidth),
          bTopOffset + (6 * bSquareWidth), bSquareWidth);
      if (i == 0 || i == 5) {
        drawSquareWithCross(
            leftPaint,
            commonStroke2,
            commonStroke2,
            bLeftOffset + (i * bSquareWidth),
            bTopOffset + (7 * bSquareWidth),
            bSquareWidth);
      } else {
        drawSquare(leftPaint, commonStroke, bLeftOffset + (i * bSquareWidth),
            bTopOffset + (7 * bSquareWidth), bSquareWidth);
      }

      drawSquare(commonPaint, commonStroke, bLeftOffset + (i * bSquareWidth),
          bTopOffset + (8 * bSquareWidth), bSquareWidth);
    }

    //Top squares
    for (var i = 0; i <= 5; i++) {
      // fill
      drawSquare(commonPaint, commonStroke, bLeftOffset + (6 * bSquareWidth),
          bTopOffset + (i * bSquareWidth), bSquareWidth);
      if (i == 0 || i == 5) {
        drawSquareWithCross(
            topPaint,
            commonStroke,
            commonStroke2,
            bLeftOffset + (7 * bSquareWidth),
            bTopOffset + (i * bSquareWidth),
            bSquareWidth);
      } else {
        drawSquare(topPaint, commonStroke, bLeftOffset + (7 * bSquareWidth),
            bTopOffset + (i * bSquareWidth), bSquareWidth);
      }

      drawSquare(commonPaint, commonStroke, bLeftOffset + (8 * bSquareWidth),
          bTopOffset + (i * bSquareWidth), bSquareWidth);
    }

    //Right squares
    for (var i = 9; i <= 14; i++) {
      // fill
      drawSquare(commonPaint, commonStroke, bLeftOffset + (i * bSquareWidth),
          bTopOffset + (6 * bSquareWidth), bSquareWidth);
      if (i == 9 || i == 14) {
        drawSquareWithCross(
            rightPaint,
            commonStroke,
            commonStroke2,
            bLeftOffset + (i * bSquareWidth),
            bTopOffset + (7 * bSquareWidth),
            bSquareWidth);
      } else {
        drawSquare(rightPaint, commonStroke, bLeftOffset + (i * bSquareWidth),
            bTopOffset + (7 * bSquareWidth), bSquareWidth);
      }
      drawSquare(commonPaint, commonStroke, bLeftOffset + (i * bSquareWidth),
          bTopOffset + (8 * bSquareWidth), bSquareWidth);
    }

    //Bottom squares
    for (var i = 9; i <= 14; i++) {
      // fill
      drawSquare(commonPaint, commonStroke, bLeftOffset + (6 * bSquareWidth),
          bTopOffset + (i * bSquareWidth), bSquareWidth);
      if (i == 9 || i == 14) {
        drawSquareWithCross(
            bottomPaint,
            commonStroke,
            commonStroke2,
            bLeftOffset + (7 * bSquareWidth),
            bTopOffset + (i * bSquareWidth),
            bSquareWidth);
      } else {
        drawSquare(bottomPaint, commonStroke, bLeftOffset + (7 * bSquareWidth),
            bTopOffset + (i * bSquareWidth), bSquareWidth);
      }

      drawSquare(commonPaint, commonStroke, bLeftOffset + (8 * bSquareWidth),
          bTopOffset + (i * bSquareWidth), bSquareWidth);
    }
  }

  drawSmallSquare(Paint paint, double left, double top) {
    var rect = Rect.fromLTWH(left, top, bSquareWidth, bSquareWidth);
    bCanvas.drawRect(rect, paint);
  }

  drawSquare(Paint paint, Paint stroke, double left, double top, double width) {
    var rect = Rect.fromLTWH(left, top, width, width);
    bCanvas.drawRect(rect, paint);
    bCanvas.drawRect(rect, stroke);
  }

  drawSquareWithCross(Paint paint, Paint squareStroke, Paint crossStroke,
      double left, double top, double width) {
    var rect = Rect.fromLTWH(left, top, width, width);
    bCanvas.drawRect(rect, paint);
    bCanvas.drawRect(rect, squareStroke);
    bCanvas.drawLine(
        Offset(left, top), Offset(left + width, top + width), crossStroke);
    bCanvas.drawLine(
        Offset(left, top + width), Offset(left + width, top), crossStroke);
  }

  drawCircle(
      Paint paint, Paint stroke, double left, double top, double radius) {
    bCanvas.drawCircle(Offset(left, top), radius, paint);
    bCanvas.drawCircle(Offset(left, top), radius, stroke);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
