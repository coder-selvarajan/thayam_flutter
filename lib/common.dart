import 'package:flutter/material.dart';

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
  List<Spot> getBottomTrack(double boxWidth) {
    List<Spot> leftMountain = [
      Spot(5 * boxWidth, 6 * boxWidth),
      Spot(4 * boxWidth, 6 * boxWidth),
      Spot(3 * boxWidth, 6 * boxWidth),
      Spot(2 * boxWidth, 6 * boxWidth),
      Spot(1 * boxWidth, 6 * boxWidth),
      Spot(0 * boxWidth, 6 * boxWidth),
      //turn
      Spot.withType(0 * boxWidth, 7 * boxWidth, 'cross'),
      // left bottom corner
      Spot(0 * boxWidth, 8 * boxWidth),
      Spot(1 * boxWidth, 8 * boxWidth),
      Spot(2 * boxWidth, 8 * boxWidth),
      Spot(3 * boxWidth, 8 * boxWidth),
      Spot(4 * boxWidth, 8 * boxWidth),
      Spot(5 * boxWidth, 8 * boxWidth),
      // left bottom cross turn
      Spot.withType(5 * boxWidth, 9 * boxWidth, 'cross'),
    ];

    List<Spot> topMountain = [
      Spot(8 * boxWidth, 5 * boxWidth),
      Spot(8 * boxWidth, 4 * boxWidth),
      Spot(8 * boxWidth, 3 * boxWidth),
      Spot(8 * boxWidth, 2 * boxWidth),
      Spot(8 * boxWidth, 1 * boxWidth),
      Spot(8 * boxWidth, 0 * boxWidth),
      // turn
      Spot.withType(7 * boxWidth, 0 * boxWidth, 'cross'),
      // top left corner
      Spot(6 * boxWidth, 0 * boxWidth),
      Spot(6 * boxWidth, 1 * boxWidth),
      Spot(6 * boxWidth, 2 * boxWidth),
      Spot(6 * boxWidth, 3 * boxWidth),
      Spot(6 * boxWidth, 4 * boxWidth),
      Spot(6 * boxWidth, 5 * boxWidth),
      // top left cross
      Spot.withType(5 * boxWidth, 5 * boxWidth, 'cross'),
    ];

    List<Spot> rightMountain = [
      Spot(9 * boxWidth, 8 * boxWidth),
      Spot(10 * boxWidth, 8 * boxWidth),
      Spot(11 * boxWidth, 8 * boxWidth),
      Spot(12 * boxWidth, 8 * boxWidth),
      Spot(13 * boxWidth, 8 * boxWidth),
      Spot(14 * boxWidth, 8 * boxWidth),
      //turn
      Spot.withType(14 * boxWidth, 7 * boxWidth, 'cross'),
      // right top corner
      Spot(14 * boxWidth, 6 * boxWidth),
      Spot(13 * boxWidth, 6 * boxWidth),
      Spot(12 * boxWidth, 6 * boxWidth),
      Spot(11 * boxWidth, 6 * boxWidth),
      Spot(10 * boxWidth, 6 * boxWidth),
      Spot(9 * boxWidth, 6 * boxWidth),
      // top right cross turn
      Spot.withType(9 * boxWidth, 5 * boxWidth, 'cross'),
    ];

    List<Spot> bottomMountain = [
      Spot(6 * boxWidth, 9 * boxWidth),
      Spot(6 * boxWidth, 10 * boxWidth),
      Spot(6 * boxWidth, 11 * boxWidth),
      Spot(6 * boxWidth, 12 * boxWidth),
      Spot(6 * boxWidth, 13 * boxWidth),
      Spot(6 * boxWidth, 14 * boxWidth),
      // turn
      Spot.withType(7 * boxWidth, 14 * boxWidth, 'cross'),
      // bottom right corner
      Spot(8 * boxWidth, 14 * boxWidth),
      Spot(8 * boxWidth, 13 * boxWidth),
      Spot(8 * boxWidth, 12 * boxWidth),
      Spot(8 * boxWidth, 11 * boxWidth),
      Spot(8 * boxWidth, 10 * boxWidth),
      Spot(8 * boxWidth, 9 * boxWidth),
      // bottom right cross
      Spot.withType(9 * boxWidth, 9 * boxWidth, 'cross'),
    ];

    List<Spot> bottomStart = [
      Spot.withType(7 * boxWidth, 9 * boxWidth, 'first5'),
      Spot.withType(7 * boxWidth, 10 * boxWidth, 'first5'),
      Spot.withType(7 * boxWidth, 11 * boxWidth, 'first5'),
      Spot.withType(7 * boxWidth, 12 * boxWidth, 'first5'),
      Spot.withType(7 * boxWidth, 13 * boxWidth, 'first5'),
      Spot.withType(7 * boxWidth, 14 * boxWidth, 'cross'),
      // u-turn
      Spot(8 * boxWidth, 14 * boxWidth),
      Spot(8 * boxWidth, 13 * boxWidth),
      Spot(8 * boxWidth, 12 * boxWidth),
      Spot(8 * boxWidth, 11 * boxWidth),
      Spot(8 * boxWidth, 10 * boxWidth),
      Spot(8 * boxWidth, 9 * boxWidth),
      // bottom right cross turn
      Spot.withType(9 * boxWidth, 9 * boxWidth, 'cross'),
    ];
    List<Spot> bottonEnd = [
      Spot(6 * boxWidth, 9 * boxWidth),
      Spot(6 * boxWidth, 10 * boxWidth),
      Spot(6 * boxWidth, 11 * boxWidth),
      Spot(6 * boxWidth, 12 * boxWidth),
      Spot(6 * boxWidth, 13 * boxWidth),
      Spot(6 * boxWidth, 14 * boxWidth),
      // u-turn
      Spot.withType(7 * boxWidth, 14 * boxWidth, 'last6'),
      Spot.withType(7 * boxWidth, 13 * boxWidth, 'last6'),
      Spot.withType(7 * boxWidth, 12 * boxWidth, 'last6'),
      Spot.withType(7 * boxWidth, 11 * boxWidth, 'last6'),
      Spot.withType(7 * boxWidth, 10 * boxWidth, 'last6'),
      Spot.withType(7 * boxWidth, 9 * boxWidth, 'last6'),
      // bottom fruit
      Spot.withType(7 * boxWidth, 8 * boxWidth, 'fruit'),
    ];

    return [
      ...bottomStart,
      ...rightMountain,
      ...topMountain,
      ...leftMountain,
      ...bottonEnd
    ];
  }
}
