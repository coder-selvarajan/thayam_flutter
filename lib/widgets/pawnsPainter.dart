import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:ThayamGame/constants.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/painting.dart' show decodeImageFromList;

class PawnsPainter extends CustomPainter {
  PawnsPainter(this.leftPawn, this.topPawn, this.rightPawn, this.bottomPawn);
  final ui.Image leftPawn;
  final ui.Image topPawn;
  final ui.Image rightPawn;
  final ui.Image bottomPawn;

  Canvas bCanvas;

  @override
  void paint(Canvas canvas, Size size) {
    bCanvas = canvas;
    setupPlayers();
  }

  void setupPlayers() {
    double pawnWidth = bSquareWidth * 1.4;
    double leftAdjustment = -bLeftOffset + (bSquareWidth * 0.7);
    double topAdjustment = -bTopOffset + (bSquareWidth * 0.9);

//    bCanvas.drawRect(
//        Rect.fromLTWH((2.25 * squareWidth) - leftAdjustment,
//            (2.25 * squareWidth) - topAdjustment, pawnWidth, pawnWidth),
//        new Paint());

    // Left players
//    paintImage(
//        leftPawn,
//        Rect.fromLTWH((2.25 * squareWidth) - leftAdjustment,
//            (2.25 * squareWidth) - topAdjustment, pawnWidth, pawnWidth));
//    paintImage(
//        leftPawn,
//        Rect.fromLTWH((3.75 * squareWidth) - leftAdjustment,
//            2.25 * squareWidth - topAdjustment, pawnWidth, pawnWidth));
//    paintImage(
//        leftPawn,
//        Rect.fromLTWH((2.25 * squareWidth) - leftAdjustment,
//            3.75 * squareWidth - topAdjustment, pawnWidth, pawnWidth));
//    paintImage(
//        leftPawn,
//        Rect.fromLTWH((3.75 * squareWidth) - leftAdjustment,
//            3.75 * squareWidth - topAdjustment, pawnWidth, pawnWidth));

    // Top players
    paintImage(
        topPawn,
        Rect.fromLTWH((11.25 * bSquareWidth) - leftAdjustment,
            (2.25 * bSquareWidth) - topAdjustment, pawnWidth, pawnWidth));
    paintImage(
        topPawn,
        Rect.fromLTWH((12.75 * bSquareWidth) - leftAdjustment,
            2.25 * bSquareWidth - topAdjustment, pawnWidth, pawnWidth));
    paintImage(
        topPawn,
        Rect.fromLTWH((11.25 * bSquareWidth) - leftAdjustment,
            3.75 * bSquareWidth - topAdjustment, pawnWidth, pawnWidth));
    paintImage(
        topPawn,
        Rect.fromLTWH((12.75 * bSquareWidth) - leftAdjustment,
            3.75 * bSquareWidth - topAdjustment, pawnWidth, pawnWidth));

    // Right players
    paintImage(
        rightPawn,
        Rect.fromLTWH((11.25 * bSquareWidth) - leftAdjustment,
            (11.25 * bSquareWidth) - topAdjustment, pawnWidth, pawnWidth));
    paintImage(
        rightPawn,
        Rect.fromLTWH((12.75 * bSquareWidth) - leftAdjustment,
            11.25 * bSquareWidth - topAdjustment, pawnWidth, pawnWidth));
    paintImage(
        rightPawn,
        Rect.fromLTWH((11.25 * bSquareWidth) - leftAdjustment,
            12.75 * bSquareWidth - topAdjustment, pawnWidth, pawnWidth));
    paintImage(
        rightPawn,
        Rect.fromLTWH((12.75 * bSquareWidth) - leftAdjustment,
            12.75 * bSquareWidth - topAdjustment, pawnWidth, pawnWidth));

    // Bottom players
    paintImage(
        bottomPawn,
        Rect.fromLTWH((2.25 * bSquareWidth) - leftAdjustment,
            (11.25 * bSquareWidth) - topAdjustment, pawnWidth, pawnWidth));
    paintImage(
        bottomPawn,
        Rect.fromLTWH((3.75 * bSquareWidth) - leftAdjustment,
            11.25 * bSquareWidth - topAdjustment, pawnWidth, pawnWidth));
    paintImage(
        bottomPawn,
        Rect.fromLTWH((2.25 * bSquareWidth) - leftAdjustment,
            12.75 * bSquareWidth - topAdjustment, pawnWidth, pawnWidth));
    paintImage(
        bottomPawn,
        Rect.fromLTWH((3.75 * bSquareWidth) - leftAdjustment,
            12.75 * bSquareWidth - topAdjustment, pawnWidth, pawnWidth));
  }

  void paintImage(ui.Image image, Rect outputRect) {
    final Size imageSize = Size(102, 102);
    final FittedSizes sizes =
        applyBoxFit(BoxFit.fill, imageSize, outputRect.size);
    final Rect inputSubrect =
        Alignment.topLeft.inscribe(sizes.source, Offset.zero & imageSize);
    final Rect outputSubrect =
        Alignment.topLeft.inscribe(sizes.destination, outputRect);
//    bCanvas.drawImageRect(image, inputSubrect, outputSubrect, new Paint());
    bCanvas.drawImageRect(image, inputSubrect, outputRect, new Paint());
  }

  FittedSizes applyBoxFit(BoxFit fit, Size inputSize, Size outputSize) {
    if (inputSize.height <= 0.0 ||
        inputSize.width <= 0.0 ||
        outputSize.height <= 0.0 ||
        outputSize.width <= 0.0) return const FittedSizes(Size.zero, Size.zero);

    Size sourceSize, destinationSize;
    switch (fit) {
      case BoxFit.fill:
        sourceSize = inputSize;
        destinationSize = outputSize;
        break;
      case BoxFit.contain:
        sourceSize = inputSize;
        if (outputSize.width / outputSize.height >
            sourceSize.width / sourceSize.height)
          destinationSize = Size(
              sourceSize.width * outputSize.height / sourceSize.height,
              outputSize.height);
        else
          destinationSize = Size(outputSize.width,
              sourceSize.height * outputSize.width / sourceSize.width);
        break;
      case BoxFit.cover:
        if (outputSize.width / outputSize.height >
            inputSize.width / inputSize.height) {
          sourceSize = Size(inputSize.width,
              inputSize.width * outputSize.height / outputSize.width);
        } else {
          sourceSize = Size(
              inputSize.height * outputSize.width / outputSize.height,
              inputSize.height);
        }
        destinationSize = outputSize;
        break;
      case BoxFit.fitWidth:
        sourceSize = Size(inputSize.width,
            inputSize.width * outputSize.height / outputSize.width);
        destinationSize = Size(outputSize.width,
            sourceSize.height * outputSize.width / sourceSize.width);
        break;
      case BoxFit.fitHeight:
        sourceSize = Size(
            inputSize.height * outputSize.width / outputSize.height,
            inputSize.height);
        destinationSize = Size(
            sourceSize.width * outputSize.height / sourceSize.height,
            outputSize.height);
        break;
      case BoxFit.none:
        sourceSize = Size(math.min(inputSize.width, outputSize.width),
            math.min(inputSize.height, outputSize.height));
        destinationSize = sourceSize;
        break;
      case BoxFit.scaleDown:
        sourceSize = inputSize;
        destinationSize = inputSize;
        final double aspectRatio = inputSize.width / inputSize.height;
        if (destinationSize.height > outputSize.height)
          destinationSize =
              Size(outputSize.height * aspectRatio, outputSize.height);
        if (destinationSize.width > outputSize.width)
          destinationSize =
              Size(outputSize.width, outputSize.width / aspectRatio);
        break;
    }
    return FittedSizes(sourceSize, destinationSize);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
