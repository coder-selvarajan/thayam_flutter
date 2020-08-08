import "package:flutter/material.dart";

class Board extends CustomPainter {
  Board() {
    commonStroke = new Paint()
      ..color = Colors.black26
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    commonPaint = new Paint()
      ..color = Colors.white54
      ..style = PaintingStyle.fill;

    leftPaint = new Paint()
      ..color = Colors.redAccent
      ..style = PaintingStyle.fill;

    topPaint = new Paint()
      ..color = Colors.lightGreen
      ..style = PaintingStyle.fill;

    rightPaint = new Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    bottomPaint = new Paint()
      ..color = Colors.yellow
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
  Paint leftPaint;
  Paint topPaint;
  Paint rightPaint;
  Paint bottomPaint;
  Paint commonStroke;

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
  }

  drawBoard() {
    var rect = Rect.fromLTWH(leftOffset, topOffset, bWidth, bWidth);
    var paint = Paint()..color = Colors.white.withOpacity(0.5);
    bCanvas.drawRect(rect, paint);
  }

  drawAllSquares() {
    //Left squares
    for (var i = 0; i <= 5; i++) {
      // fill
      drawSquare(commonPaint, leftOffset + (i * squareWidth),
          topOffset + (6 * squareWidth));
      drawSquare(leftPaint, leftOffset + (i * squareWidth),
          topOffset + (7 * squareWidth));
      drawSquare(commonPaint, leftOffset + (i * squareWidth),
          topOffset + (8 * squareWidth));

      // stroke
      drawSquare(commonStroke, leftOffset + (i * squareWidth),
          topOffset + (6 * squareWidth));
      drawSquare(commonStroke, leftOffset + (i * squareWidth),
          topOffset + (7 * squareWidth));
      drawSquare(commonStroke, leftOffset + (i * squareWidth),
          topOffset + (8 * squareWidth));
    }

    //Top squares
    for (var i = 0; i <= 5; i++) {
      // fill
      drawSquare(commonPaint, leftOffset + (6 * squareWidth),
          topOffset + (i * squareWidth));
      drawSquare(topPaint, leftOffset + (7 * squareWidth),
          topOffset + (i * squareWidth));
      drawSquare(commonPaint, leftOffset + (8 * squareWidth),
          topOffset + (i * squareWidth));

      // stroke
      drawSquare(commonStroke, leftOffset + (6 * squareWidth),
          topOffset + (i * squareWidth));
      drawSquare(commonStroke, leftOffset + (7 * squareWidth),
          topOffset + (i * squareWidth));
      drawSquare(commonStroke, leftOffset + (8 * squareWidth),
          topOffset + (i * squareWidth));
    }

    //Right squares
    for (var i = 9; i <= 14; i++) {
      // fill
      drawSquare(commonPaint, leftOffset + (i * squareWidth),
          topOffset + (6 * squareWidth));
      drawSquare(rightPaint, leftOffset + (i * squareWidth),
          topOffset + (7 * squareWidth));
      drawSquare(commonPaint, leftOffset + (i * squareWidth),
          topOffset + (8 * squareWidth));

      // stroke
      drawSquare(commonStroke, leftOffset + (i * squareWidth),
          topOffset + (6 * squareWidth));
      drawSquare(commonStroke, leftOffset + (i * squareWidth),
          topOffset + (7 * squareWidth));
      drawSquare(commonStroke, leftOffset + (i * squareWidth),
          topOffset + (8 * squareWidth));
    }

    //Bottom squares
    for (var i = 9; i <= 14; i++) {
      // fill
      drawSquare(commonPaint, leftOffset + (6 * squareWidth),
          topOffset + (i * squareWidth));
      drawSquare(bottomPaint, leftOffset + (7 * squareWidth),
          topOffset + (i * squareWidth));
      drawSquare(commonPaint, leftOffset + (8 * squareWidth),
          topOffset + (i * squareWidth));

      // stroke
      drawSquare(commonStroke, leftOffset + (6 * squareWidth),
          topOffset + (i * squareWidth));
      drawSquare(commonStroke, leftOffset + (7 * squareWidth),
          topOffset + (i * squareWidth));
      drawSquare(commonStroke, leftOffset + (8 * squareWidth),
          topOffset + (i * squareWidth));
    }
  }

  drawSquare(Paint paint, double left, double top) {
    var rect = Rect.fromLTWH(left, top, squareWidth, squareWidth);
    bCanvas.drawRect(rect, paint);
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
