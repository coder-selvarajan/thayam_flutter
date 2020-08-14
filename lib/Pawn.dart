import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/painting.dart' show decodeImageFromList;
import 'package:ThayamGame/Constants.dart';

class Pawn extends CustomPainter {
  Pawn(this.pawnImage, this.leftSquarePos, this.topSquarePos);
  final ui.Image pawnImage;
  final double leftSquarePos;
  final double topSquarePos;
  Canvas bCanvas;

  @override
  void paint(Canvas canvas, Size size) {
    bCanvas = canvas;

    double pawnWidth = bSquareWidth * 1.4;
    double leftAdjustment = -bLeftOffset + bSquareWidth * 0.7;
    double topAdjustment = -bTopOffset + bSquareWidth * 0.9;

    paintImage(
        pawnImage,
        Rect.fromLTWH(
            (leftSquarePos * bSquareWidth) - leftAdjustment,
            (topSquarePos * bSquareWidth) - topAdjustment,
            pawnWidth,
            pawnWidth));
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
