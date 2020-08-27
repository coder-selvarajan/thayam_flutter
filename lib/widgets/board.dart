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

    drawCircle(leftPaint, commonStroke, boardOffsetLeft + (3 * bSquareWidth),
        boardOffsetTop + (3 * bSquareWidth), bSquareWidth * 2);
    drawCircle(topPaint, commonStroke, boardOffsetLeft + (12 * bSquareWidth),
        boardOffsetTop + (3 * bSquareWidth), bSquareWidth * 2);
    drawCircle(rightPaint, commonStroke, boardOffsetLeft + (12 * bSquareWidth),
        boardOffsetTop + (12 * bSquareWidth), bSquareWidth * 2);
    drawCircle(bottomPaint, commonStroke, boardOffsetLeft + (3 * bSquareWidth),
        boardOffsetTop + (12 * bSquareWidth), bSquareWidth * 2);

    //Left - inner circles
    drawCircle(
        commonPaint2,
        commonStroke,
        boardOffsetLeft + (2.25 * bSquareWidth),
        boardOffsetTop + (2.25 * bSquareWidth),
        bSquareWidth * 0.6);
    drawCircle(
        commonPaint2,
        commonStroke,
        boardOffsetLeft + (3.75 * bSquareWidth),
        boardOffsetTop + (2.25 * bSquareWidth),
        bSquareWidth * 0.6);
    drawCircle(
        commonPaint2,
        commonStroke,
        boardOffsetLeft + (2.25 * bSquareWidth),
        boardOffsetTop + (3.75 * bSquareWidth),
        bSquareWidth * 0.6);
    drawCircle(
        commonPaint2,
        commonStroke,
        boardOffsetLeft + (3.75 * bSquareWidth),
        boardOffsetTop + (3.75 * bSquareWidth),
        bSquareWidth * 0.6);

    //Top - inner circles
    drawCircle(
        commonPaint2,
        commonStroke,
        boardOffsetLeft + (11.25 * bSquareWidth),
        boardOffsetTop + (2.25 * bSquareWidth),
        bSquareWidth * 0.6);
    drawCircle(
        commonPaint2,
        commonStroke,
        boardOffsetLeft + (12.75 * bSquareWidth),
        boardOffsetTop + (2.25 * bSquareWidth),
        bSquareWidth * 0.6);
    drawCircle(
        commonPaint2,
        commonStroke,
        boardOffsetLeft + (11.25 * bSquareWidth),
        boardOffsetTop + (3.75 * bSquareWidth),
        bSquareWidth * 0.6);
    drawCircle(
        commonPaint2,
        commonStroke,
        boardOffsetLeft + (12.75 * bSquareWidth),
        boardOffsetTop + (3.75 * bSquareWidth),
        bSquareWidth * 0.6);

    //Right - inner circles
    drawCircle(
        commonPaint2,
        commonStroke,
        boardOffsetLeft + (11.25 * bSquareWidth),
        boardOffsetTop + (11.25 * bSquareWidth),
        bSquareWidth * 0.6);
    drawCircle(
        commonPaint2,
        commonStroke,
        boardOffsetLeft + (12.75 * bSquareWidth),
        boardOffsetTop + (11.25 * bSquareWidth),
        bSquareWidth * 0.6);
    drawCircle(
        commonPaint2,
        commonStroke,
        boardOffsetLeft + (11.25 * bSquareWidth),
        boardOffsetTop + (12.75 * bSquareWidth),
        bSquareWidth * 0.6);
    drawCircle(
        commonPaint2,
        commonStroke,
        boardOffsetLeft + (12.75 * bSquareWidth),
        boardOffsetTop + (12.75 * bSquareWidth),
        bSquareWidth * 0.6);

    //Bottom - inner circles
    drawCircle(
        commonPaint2,
        commonStroke,
        boardOffsetLeft + (2.25 * bSquareWidth),
        boardOffsetTop + (11.25 * bSquareWidth),
        bSquareWidth * 0.6);
    drawCircle(
        commonPaint2,
        commonStroke,
        boardOffsetLeft + (3.75 * bSquareWidth),
        boardOffsetTop + (11.25 * bSquareWidth),
        bSquareWidth * 0.6);
    drawCircle(
        commonPaint2,
        commonStroke,
        boardOffsetLeft + (2.25 * bSquareWidth),
        boardOffsetTop + (12.75 * bSquareWidth),
        bSquareWidth * 0.6);
    drawCircle(
        commonPaint2,
        commonStroke,
        boardOffsetLeft + (3.75 * bSquareWidth),
        boardOffsetTop + (12.75 * bSquareWidth),
        bSquareWidth * 0.6);

//    drawSquare(lightPaint, commonStroke2, leftOffset + squareWidth,
//        topOffset + squareWidth, squareWidth * 2);
//    drawSquare(lightPaint, commonStroke2, leftOffset + (3 * squareWidth),
//        topOffset + (3 * squareWidth), squareWidth * 2);
  }

  drawBoard() {
    var rect = Rect.fromLTWH(boardOffsetLeft, boardOffsetTop, bWidth, bWidth);
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
        boardOffsetLeft + (6 * bSquareWidth),
        boardOffsetTop + (7 * bSquareWidth) + (bSquareWidth / 2),
        (bSquareWidth * 3),
        (bSquareWidth * 1.5));

    // left triangle
    drawLeftTriangle(
        leftPaint,
        boardOffsetLeft + (6 * bSquareWidth),
        boardOffsetTop + (6 * bSquareWidth),
        (bSquareWidth * 1.5),
        (bSquareWidth * 3));

    // Top triangle
    drawTopTriangle(
        topPaint,
        boardOffsetLeft + (6 * bSquareWidth),
        boardOffsetTop + (6 * bSquareWidth),
        (bSquareWidth * 3),
        (bSquareWidth * 1.5));

    // Right triangle
    drawRightTriangle(
        rightPaint,
        boardOffsetLeft + (7 * bSquareWidth) + (bSquareWidth / 2),
        boardOffsetTop + (6 * bSquareWidth),
        (bSquareWidth * 1.5),
        (bSquareWidth * 3));

    //Middle Box
    drawSquareWithCross(
        lightPaint,
        commonStroke,
        commonStroke2,
        boardOffsetLeft + (6 * bSquareWidth),
        boardOffsetTop + (6 * bSquareWidth),
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
        boardOffsetLeft + (5 * bSquareWidth),
        boardOffsetTop + (5 * bSquareWidth),
        bSquareWidth);

    //Left-Bottom
    drawSquareWithCross(
        commonPaint,
        commonStroke2,
        commonStroke2,
        boardOffsetLeft + (5 * bSquareWidth),
        boardOffsetTop + (9 * bSquareWidth),
        bSquareWidth);

    //Right-Top
    drawSquareWithCross(
        commonPaint,
        commonStroke2,
        commonStroke2,
        boardOffsetLeft + (9 * bSquareWidth),
        boardOffsetTop + (5 * bSquareWidth),
        bSquareWidth);

    //Right-Bottom
    drawSquareWithCross(
        commonPaint,
        commonStroke2,
        commonStroke2,
        boardOffsetLeft + (9 * bSquareWidth),
        boardOffsetTop + (9 * bSquareWidth),
        bSquareWidth);
  }

  drawAllSquares() {
    //Left squares
    for (var i = 0; i <= 5; i++) {
      // fill
      drawSquare(
          commonPaint,
          commonStroke,
          boardOffsetLeft + (i * bSquareWidth),
          boardOffsetTop + (6 * bSquareWidth),
          bSquareWidth);
      if (i == 0 || i == 5) {
        drawSquareWithCross(
            leftPaint,
            commonStroke2,
            commonStroke2,
            boardOffsetLeft + (i * bSquareWidth),
            boardOffsetTop + (7 * bSquareWidth),
            bSquareWidth);
      } else {
        drawSquare(
            leftPaint,
            commonStroke,
            boardOffsetLeft + (i * bSquareWidth),
            boardOffsetTop + (7 * bSquareWidth),
            bSquareWidth);
      }

      drawSquare(
          commonPaint,
          commonStroke,
          boardOffsetLeft + (i * bSquareWidth),
          boardOffsetTop + (8 * bSquareWidth),
          bSquareWidth);
    }

    //Top squares
    for (var i = 0; i <= 5; i++) {
      // fill
      drawSquare(
          commonPaint,
          commonStroke,
          boardOffsetLeft + (6 * bSquareWidth),
          boardOffsetTop + (i * bSquareWidth),
          bSquareWidth);
      if (i == 0 || i == 5) {
        drawSquareWithCross(
            topPaint,
            commonStroke,
            commonStroke2,
            boardOffsetLeft + (7 * bSquareWidth),
            boardOffsetTop + (i * bSquareWidth),
            bSquareWidth);
      } else {
        drawSquare(topPaint, commonStroke, boardOffsetLeft + (7 * bSquareWidth),
            boardOffsetTop + (i * bSquareWidth), bSquareWidth);
      }

      drawSquare(
          commonPaint,
          commonStroke,
          boardOffsetLeft + (8 * bSquareWidth),
          boardOffsetTop + (i * bSquareWidth),
          bSquareWidth);
    }

    //Right squares
    for (var i = 9; i <= 14; i++) {
      // fill
      drawSquare(
          commonPaint,
          commonStroke,
          boardOffsetLeft + (i * bSquareWidth),
          boardOffsetTop + (6 * bSquareWidth),
          bSquareWidth);
      if (i == 9 || i == 14) {
        drawSquareWithCross(
            rightPaint,
            commonStroke,
            commonStroke2,
            boardOffsetLeft + (i * bSquareWidth),
            boardOffsetTop + (7 * bSquareWidth),
            bSquareWidth);
      } else {
        drawSquare(
            rightPaint,
            commonStroke,
            boardOffsetLeft + (i * bSquareWidth),
            boardOffsetTop + (7 * bSquareWidth),
            bSquareWidth);
      }
      drawSquare(
          commonPaint,
          commonStroke,
          boardOffsetLeft + (i * bSquareWidth),
          boardOffsetTop + (8 * bSquareWidth),
          bSquareWidth);
    }

    //Bottom squares
    for (var i = 9; i <= 14; i++) {
      // fill
      drawSquare(
          commonPaint,
          commonStroke,
          boardOffsetLeft + (6 * bSquareWidth),
          boardOffsetTop + (i * bSquareWidth),
          bSquareWidth);
      if (i == 9 || i == 14) {
        drawSquareWithCross(
            bottomPaint,
            commonStroke,
            commonStroke2,
            boardOffsetLeft + (7 * bSquareWidth),
            boardOffsetTop + (i * bSquareWidth),
            bSquareWidth);
      } else {
        drawSquare(
            bottomPaint,
            commonStroke,
            boardOffsetLeft + (7 * bSquareWidth),
            boardOffsetTop + (i * bSquareWidth),
            bSquareWidth);
      }

      drawSquare(
          commonPaint,
          commonStroke,
          boardOffsetLeft + (8 * bSquareWidth),
          boardOffsetTop + (i * bSquareWidth),
          bSquareWidth);
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
