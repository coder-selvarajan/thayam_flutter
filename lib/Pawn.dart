import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/painting.dart' show decodeImageFromList;

class Pawn extends CustomPainter {
  Pawn({this.pawnImage});
  final ui.Image pawnImage;

  Canvas bCanvas;
  double bWidth = 0;
  double bHeight = 0;
  double squareWidth = 0;

  @override
  void paint(Canvas canvas, Size size) {
    bCanvas = canvas;
    bWidth = size.width - 20;
    bHeight = size.height;
    squareWidth = bWidth / 15;

    double pawnWidth = squareWidth * 1.4;
    double leftAdjustment = squareWidth * 0.7;
    double topAdjustment = squareWidth * 0.9;

    paintImage(
        pawnImage,
        Rect.fromLTWH((11.25 * squareWidth) - leftAdjustment,
            (2.25 * squareWidth) - topAdjustment, pawnWidth, pawnWidth));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void paintImage(ui.Image image, Rect outputRect) {
    final Size imageSize =
        Size(image.width.toDouble(), image.height.toDouble());
    final FittedSizes sizes =
        applyBoxFit(BoxFit.fill, imageSize, outputRect.size);
    final Rect inputSubrect =
        Alignment.center.inscribe(sizes.source, Offset.zero & imageSize);
    final Rect outputSubrect =
        Alignment.center.inscribe(sizes.destination, outputRect);
    bCanvas.drawImageRect(image, inputSubrect, outputSubrect, new Paint());
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
}
