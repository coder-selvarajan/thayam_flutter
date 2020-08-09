import "package:flutter/material.dart";

class Board extends CustomPainter {
  Board() {
    commonStroke = new Paint()
      ..color = Colors.black26
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    commonStroke2 = new Paint()
      ..color = Colors.black45.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    commonPaint = new Paint()
      ..color = Colors.white54
      ..style = PaintingStyle.fill;

    lightPaint = new Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    leftPaint = new Paint()
      ..color = Color(0xEE860303)
      ..style = PaintingStyle.fill;

    topPaint = new Paint()
      ..color = Color(0xEE625025)
      ..style = PaintingStyle.fill;

    rightPaint = new Paint()
      ..color = Color(0xEEE87E04)
      ..style = PaintingStyle.fill;

    bottomPaint = new Paint()
      ..color = Color(0xEEF7CA18)
      ..style = PaintingStyle.fill;
  }

  Canvas bCanvas;
  double bWidth = 0;
  double bHeight = 0;
  double squareWidth = 0;

  double leftOffset = 0;
  double topOffset = 0;

  var whitePaint = Paint()..color = Colors.white.withOpacity(0.5);
  Paint commonPaint;
  Paint lightPaint;
  Paint leftPaint;
  Paint topPaint;
  Paint rightPaint;
  Paint bottomPaint;
  Paint commonStroke;
  Paint commonStroke2;

  @override
  void paint(Canvas canvas, Size size) {
    bCanvas = canvas;
    bWidth = size.width - 20;
    bHeight = size.height;
    squareWidth = bWidth / 15;
    leftOffset = 10;
    topOffset = bHeight / 2 - bWidth / 2;

    drawBoard();
    drawAllSquares();
    drawCornerCross();
    drawMidCross();
  }

  drawBoard() {
    var rect = Rect.fromLTWH(leftOffset, topOffset, bWidth, bWidth);
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
        leftOffset + (6 * squareWidth),
        topOffset + (7 * squareWidth) + (squareWidth / 2),
        (squareWidth * 3),
        (squareWidth * 1.5));

    // left triangle
    drawLeftTriangle(leftPaint, leftOffset + (6 * squareWidth),
        topOffset + (6 * squareWidth), (squareWidth * 1.5), (squareWidth * 3));

    // Top triangle
    drawTopTriangle(topPaint, leftOffset + (6 * squareWidth),
        topOffset + (6 * squareWidth), (squareWidth * 3), (squareWidth * 1.5));

    // Right triangle
    drawRightTriangle(
        rightPaint,
        leftOffset + (7 * squareWidth) + (squareWidth / 2),
        topOffset + (6 * squareWidth),
        (squareWidth * 1.5),
        (squareWidth * 3));

    //Middle Box
    drawSquareWithCross(
        lightPaint,
        commonStroke,
        commonStroke2,
        leftOffset + (6 * squareWidth),
        topOffset + (6 * squareWidth),
        squareWidth * 3);
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
        leftOffset + (5 * squareWidth),
        topOffset + (5 * squareWidth),
        squareWidth);

    //Left-Bottom
    drawSquareWithCross(
        commonPaint,
        commonStroke2,
        commonStroke2,
        leftOffset + (5 * squareWidth),
        topOffset + (9 * squareWidth),
        squareWidth);

    //Right-Top
    drawSquareWithCross(
        commonPaint,
        commonStroke2,
        commonStroke2,
        leftOffset + (9 * squareWidth),
        topOffset + (5 * squareWidth),
        squareWidth);

    //Right-Bottom
    drawSquareWithCross(
        commonPaint,
        commonStroke2,
        commonStroke2,
        leftOffset + (9 * squareWidth),
        topOffset + (9 * squareWidth),
        squareWidth);
  }

  drawAllSquares() {
    //Left squares
    for (var i = 0; i <= 5; i++) {
      // fill
      drawSquare(commonPaint, commonStroke, leftOffset + (i * squareWidth),
          topOffset + (6 * squareWidth), squareWidth);
      if (i == 0 || i == 5) {
        drawSquareWithCross(
            leftPaint,
            commonStroke,
            commonStroke2,
            leftOffset + (i * squareWidth),
            topOffset + (7 * squareWidth),
            squareWidth);
      } else {
        drawSquare(leftPaint, commonStroke, leftOffset + (i * squareWidth),
            topOffset + (7 * squareWidth), squareWidth);
      }

      drawSquare(commonPaint, commonStroke, leftOffset + (i * squareWidth),
          topOffset + (8 * squareWidth), squareWidth);
    }

    //Top squares
    for (var i = 0; i <= 5; i++) {
      // fill
      drawSquare(commonPaint, commonStroke, leftOffset + (6 * squareWidth),
          topOffset + (i * squareWidth), squareWidth);
      if (i == 0 || i == 5) {
        drawSquareWithCross(
            topPaint,
            commonStroke,
            commonStroke2,
            leftOffset + (7 * squareWidth),
            topOffset + (i * squareWidth),
            squareWidth);
      } else {
        drawSquare(topPaint, commonStroke, leftOffset + (7 * squareWidth),
            topOffset + (i * squareWidth), squareWidth);
      }

      drawSquare(commonPaint, commonStroke, leftOffset + (8 * squareWidth),
          topOffset + (i * squareWidth), squareWidth);
    }

    //Right squares
    for (var i = 9; i <= 14; i++) {
      // fill
      drawSquare(commonPaint, commonStroke, leftOffset + (i * squareWidth),
          topOffset + (6 * squareWidth), squareWidth);
      if (i == 9 || i == 14) {
        drawSquareWithCross(
            rightPaint,
            commonStroke,
            commonStroke2,
            leftOffset + (i * squareWidth),
            topOffset + (7 * squareWidth),
            squareWidth);
      } else {
        drawSquare(rightPaint, commonStroke, leftOffset + (i * squareWidth),
            topOffset + (7 * squareWidth), squareWidth);
      }
      drawSquare(commonPaint, commonStroke, leftOffset + (i * squareWidth),
          topOffset + (8 * squareWidth), squareWidth);
    }

    //Bottom squares
    for (var i = 9; i <= 14; i++) {
      // fill
      drawSquare(commonPaint, commonStroke, leftOffset + (6 * squareWidth),
          topOffset + (i * squareWidth), squareWidth);
      if (i == 9 || i == 14) {
        drawSquareWithCross(
            bottomPaint,
            commonStroke,
            commonStroke2,
            leftOffset + (7 * squareWidth),
            topOffset + (i * squareWidth),
            squareWidth);
      } else {
        drawSquare(bottomPaint, commonStroke, leftOffset + (7 * squareWidth),
            topOffset + (i * squareWidth), squareWidth);
      }

      drawSquare(commonPaint, commonStroke, leftOffset + (8 * squareWidth),
          topOffset + (i * squareWidth), squareWidth);
    }
  }

  drawSmallSquare(Paint paint, double left, double top) {
    var rect = Rect.fromLTWH(left, top, squareWidth, squareWidth);
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

  drawCircle(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);

    bCanvas.drawCircle(center, 100, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
