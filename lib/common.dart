import 'package:flutter/material.dart';
import 'constants.dart';

class Spot {
  Offset offset = Offset(0, 0);
  String type;

  Spot(double x, double y) {
    offset = Offset(x, y);
    type = "normal";
  }

  double dx() {
    return offset.dx;
  }

  double dy() {
    return offset.dy;
  }

  Spot.withType(double x, double y, String typ) {
    offset = Offset(x, y);
    type = typ;
  }
}

class Common {
  List<Spot> getBottomTrack() {
    double leftOffset = boardOffsetLeft - pawnOffsetLeft;
    double topOffset = boardOffsetTop - pawnOffsetTop;
    List<Spot> leftMountain = [
      // starting from mountain top
      Spot((5 * bSquareWidth) + leftOffset, 6 * bSquareWidth + topOffset),
      Spot((4 * bSquareWidth) + leftOffset, 6 * bSquareWidth + topOffset),
      Spot((3 * bSquareWidth) + leftOffset, 6 * bSquareWidth + topOffset),
      Spot((2 * bSquareWidth) + leftOffset, 6 * bSquareWidth + topOffset),
      Spot((1 * bSquareWidth) + leftOffset, 6 * bSquareWidth + topOffset),
      Spot((0 * bSquareWidth) + leftOffset, 6 * bSquareWidth + topOffset),
      //turn
      Spot.withType((0 * bSquareWidth) + leftOffset,
          7 * bSquareWidth + topOffset, 'cross'),
      // left bottom corner
      Spot((0 * bSquareWidth) + leftOffset, 8 * bSquareWidth + topOffset),
      Spot((1 * bSquareWidth) + leftOffset, 8 * bSquareWidth + topOffset),
      Spot((2 * bSquareWidth) + leftOffset, 8 * bSquareWidth + topOffset),
      Spot((3 * bSquareWidth) + leftOffset, 8 * bSquareWidth + topOffset),
      Spot((4 * bSquareWidth) + leftOffset, 8 * bSquareWidth + topOffset),
      Spot((5 * bSquareWidth) + leftOffset, 8 * bSquareWidth + topOffset),
      // left bottom cross turn
      Spot.withType((5 * bSquareWidth) + leftOffset,
          9 * bSquareWidth + topOffset, 'cross'),
    ];

    List<Spot> topMountain = [
      Spot(8 * bSquareWidth + leftOffset, 5 * bSquareWidth + topOffset),
      Spot(8 * bSquareWidth + leftOffset, 4 * bSquareWidth + topOffset),
      Spot(8 * bSquareWidth + leftOffset, 3 * bSquareWidth + topOffset),
      Spot(8 * bSquareWidth + leftOffset, 2 * bSquareWidth + topOffset),
      Spot(8 * bSquareWidth + leftOffset, 1 * bSquareWidth + topOffset),
      Spot(8 * bSquareWidth + leftOffset, 0 * bSquareWidth + topOffset),
      // turn
      Spot.withType(
          7 * bSquareWidth + leftOffset, 0 * bSquareWidth + topOffset, 'cross'),
      // top left corner
      Spot(6 * bSquareWidth + leftOffset, 0 * bSquareWidth + topOffset),
      Spot(6 * bSquareWidth + leftOffset, 1 * bSquareWidth + topOffset),
      Spot(6 * bSquareWidth + leftOffset, 2 * bSquareWidth + topOffset),
      Spot(6 * bSquareWidth + leftOffset, 3 * bSquareWidth + topOffset),
      Spot(6 * bSquareWidth + leftOffset, 4 * bSquareWidth + topOffset),
      Spot(6 * bSquareWidth + leftOffset, 5 * bSquareWidth + topOffset),
      // top left cross
      Spot.withType(
          5 * bSquareWidth + leftOffset, 5 * bSquareWidth + topOffset, 'cross'),
    ];

    List<Spot> rightMountain = [
      Spot(9 * bSquareWidth + leftOffset, 8 * bSquareWidth + topOffset),
      Spot(10 * bSquareWidth + leftOffset, 8 * bSquareWidth + topOffset),
      Spot(11 * bSquareWidth + leftOffset, 8 * bSquareWidth + topOffset),
      Spot(12 * bSquareWidth + leftOffset, 8 * bSquareWidth + topOffset),
      Spot(13 * bSquareWidth + leftOffset, 8 * bSquareWidth + topOffset),
      Spot(14 * bSquareWidth + leftOffset, 8 * bSquareWidth + topOffset),
      //turn
      Spot.withType(14 * bSquareWidth + leftOffset,
          7 * bSquareWidth + topOffset, 'cross'),
      // right top corner
      Spot(14 * bSquareWidth + leftOffset, 6 * bSquareWidth + topOffset),
      Spot(13 * bSquareWidth + leftOffset, 6 * bSquareWidth + topOffset),
      Spot(12 * bSquareWidth + leftOffset, 6 * bSquareWidth + topOffset),
      Spot(11 * bSquareWidth + leftOffset, 6 * bSquareWidth + topOffset),
      Spot(10 * bSquareWidth + leftOffset, 6 * bSquareWidth + topOffset),
      Spot(9 * bSquareWidth + leftOffset, 6 * bSquareWidth + topOffset),
      // top right cross turn
      Spot.withType(
          9 * bSquareWidth + leftOffset, 5 * bSquareWidth + topOffset, 'cross'),
    ];

    List<Spot> bottomMountain = [
      Spot(6 * bSquareWidth + leftOffset, 9 * bSquareWidth + topOffset),
      Spot(6 * bSquareWidth + leftOffset, 10 * bSquareWidth + topOffset),
      Spot(6 * bSquareWidth + leftOffset, 11 * bSquareWidth + topOffset),
      Spot(6 * bSquareWidth + leftOffset, 12 * bSquareWidth + topOffset),
      Spot(6 * bSquareWidth + leftOffset, 13 * bSquareWidth + topOffset),
      Spot(6 * bSquareWidth + leftOffset, 14 * bSquareWidth + topOffset),
      // turn
      Spot.withType(7 * bSquareWidth + leftOffset,
          14 * bSquareWidth + topOffset, 'cross'),
      // bottom right corner
      Spot(8 * bSquareWidth + leftOffset, 14 * bSquareWidth + topOffset),
      Spot(8 * bSquareWidth + leftOffset, 13 * bSquareWidth + topOffset),
      Spot(8 * bSquareWidth + leftOffset, 12 * bSquareWidth + topOffset),
      Spot(8 * bSquareWidth + leftOffset, 11 * bSquareWidth + topOffset),
      Spot(8 * bSquareWidth + leftOffset, 10 * bSquareWidth + topOffset),
      Spot(8 * bSquareWidth + leftOffset, 9 * bSquareWidth + topOffset),
      // bottom right cross
      Spot.withType(
          9 * bSquareWidth + leftOffset, 9 * bSquareWidth + topOffset, 'cross'),
    ];

    List<Spot> bottomStart = [
      //Position is stage
      Spot.withType((2 * bSquareWidth) + leftOffset,
          11 * bSquareWidth + topOffset, 'stage'),

      // starting from mountain top
      Spot.withType(7 * bSquareWidth + leftOffset, 9 * bSquareWidth + topOffset,
          'first5'),
      Spot.withType(7 * bSquareWidth + leftOffset,
          10 * bSquareWidth + topOffset, 'first5'),
      Spot.withType(7 * bSquareWidth + leftOffset,
          11 * bSquareWidth + topOffset, 'first5'),
      Spot.withType(7 * bSquareWidth + leftOffset,
          12 * bSquareWidth + topOffset, 'first5'),
      Spot.withType(7 * bSquareWidth + leftOffset,
          13 * bSquareWidth + topOffset, 'first5'),
      Spot.withType(7 * bSquareWidth + leftOffset,
          14 * bSquareWidth + topOffset, 'cross'),
      // u-turn
      Spot(8 * bSquareWidth + leftOffset, 14 * bSquareWidth + topOffset),
      Spot(8 * bSquareWidth + leftOffset, 13 * bSquareWidth + topOffset),
      Spot(8 * bSquareWidth + leftOffset, 12 * bSquareWidth + topOffset),
      Spot(8 * bSquareWidth + leftOffset, 11 * bSquareWidth + topOffset),
      Spot(8 * bSquareWidth + leftOffset, 10 * bSquareWidth + topOffset),
      Spot(8 * bSquareWidth + leftOffset, 9 * bSquareWidth + topOffset),
      // bottom right cross turn
      Spot.withType(
          9 * bSquareWidth + leftOffset, 9 * bSquareWidth + topOffset, 'cross'),
    ];
    List<Spot> bottonEnd = [
      Spot(6 * bSquareWidth + leftOffset, 9 * bSquareWidth + topOffset),
      Spot(6 * bSquareWidth + leftOffset, 10 * bSquareWidth + topOffset),
      Spot(6 * bSquareWidth + leftOffset, 11 * bSquareWidth + topOffset),
      Spot(6 * bSquareWidth + leftOffset, 12 * bSquareWidth + topOffset),
      Spot(6 * bSquareWidth + leftOffset, 13 * bSquareWidth + topOffset),
      Spot(6 * bSquareWidth + leftOffset, 14 * bSquareWidth + topOffset),
      // u-turn
      Spot.withType(7 * bSquareWidth + leftOffset,
          14 * bSquareWidth + topOffset, 'last6'),
      Spot.withType(7 * bSquareWidth + leftOffset,
          13 * bSquareWidth + topOffset, 'last6'),
      Spot.withType(7 * bSquareWidth + leftOffset,
          12 * bSquareWidth + topOffset, 'last6'),
      Spot.withType(7 * bSquareWidth + leftOffset,
          11 * bSquareWidth + topOffset, 'last6'),
      Spot.withType(7 * bSquareWidth + leftOffset,
          10 * bSquareWidth + topOffset, 'last6'),
      Spot.withType(
          7 * bSquareWidth + leftOffset, 9 * bSquareWidth + topOffset, 'last6'),
      // bottom fruit
      Spot.withType(
          7 * bSquareWidth + leftOffset, 8 * bSquareWidth + topOffset, 'fruit'),
    ];

    return [
      ...bottomStart,
//      ...rightMountain,
//      ...topMountain,
//      ...leftMountain,
//      ...bottonEnd
    ];
  }
}
