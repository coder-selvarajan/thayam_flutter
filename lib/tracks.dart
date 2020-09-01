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

class Tracks {
  double leftOffset = 0.0;
  double topOffset = 0.0;

  List<Spot> leftMountain = [];
  List<Spot> topMountain = [];
  List<Spot> rightMountain = [];
  List<Spot> bottomMountain = [];

  List<Spot> bottomStage = [];
  List<Spot> bottomStart = [];
  List<Spot> bottomEnd = [];

  List<Spot> leftStage = [];
  List<Spot> leftStart = [];
  List<Spot> leftEnd = [];

  List<Spot> topStage = [];
  List<Spot> topStart = [];
  List<Spot> topEnd = [];

  List<Spot> rightStage = [];
  List<Spot> rightStart = [];
  List<Spot> rightEnd = [];

  void initMountainPos() {
    leftMountain = [
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

    topMountain = [
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

    rightMountain = [
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

    bottomMountain = [
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
  }

  void initBottomSpecifics() {
    bottomStage = [
      //stage position 1
      Spot.withType(
          (2.25 * bSquareWidth) + boardOffsetLeft - (bSquareWidth * 0.6),
          11.25 * bSquareWidth + boardOffsetTop - (bSquareWidth * 0.7),
          'stage1'),

      //stage position 2
      Spot.withType(
          (3.75 * bSquareWidth) + boardOffsetLeft - (bSquareWidth * 0.6),
          11.25 * bSquareWidth + boardOffsetTop - (bSquareWidth * 0.7),
          'stage2'),

      //stage position 3
      Spot.withType(
          (2.25 * bSquareWidth) + boardOffsetLeft - (bSquareWidth * 0.6),
          12.75 * bSquareWidth + boardOffsetTop - (bSquareWidth * 0.7),
          'stage3'),

      //stage position 4
      Spot.withType(
          (3.75 * bSquareWidth) + boardOffsetLeft - (bSquareWidth * 0.6),
          12.75 * bSquareWidth + boardOffsetTop - (bSquareWidth * 0.7),
          'stage4'),
    ];

    bottomStart = [
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

    bottomEnd = [
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
  }

  void initLeftSpecifics() {
    leftStage = [
      //stage position 1
      Spot.withType(
          (2.25 * bSquareWidth) + boardOffsetLeft - (bSquareWidth * 0.6),
          2.25 * bSquareWidth + boardOffsetTop - (bSquareWidth * 0.7),
          'stage1'),

      //stage position 2
      Spot.withType(
          (3.75 * bSquareWidth) + boardOffsetLeft - (bSquareWidth * 0.6),
          2.25 * bSquareWidth + boardOffsetTop - (bSquareWidth * 0.7),
          'stage2'),

      //stage position 3
      Spot.withType(
          (2.25 * bSquareWidth) + boardOffsetLeft - (bSquareWidth * 0.6),
          3.75 * bSquareWidth + boardOffsetTop - (bSquareWidth * 0.7),
          'stage3'),

      //stage position 4
      Spot.withType(
          (3.75 * bSquareWidth) + boardOffsetLeft - (bSquareWidth * 0.6),
          3.75 * bSquareWidth + boardOffsetTop - (bSquareWidth * 0.7),
          'stage4'),
    ];

    leftStart = [
      // starting from mountain top
      Spot.withType(5 * bSquareWidth + leftOffset, 7 * bSquareWidth + topOffset,
          'first5'),
      Spot.withType(4 * bSquareWidth + leftOffset, 7 * bSquareWidth + topOffset,
          'first5'),
      Spot.withType(3 * bSquareWidth + leftOffset, 7 * bSquareWidth + topOffset,
          'first5'),
      Spot.withType(2 * bSquareWidth + leftOffset, 7 * bSquareWidth + topOffset,
          'first5'),
      Spot.withType(1 * bSquareWidth + leftOffset, 7 * bSquareWidth + topOffset,
          'first5'),
      Spot.withType(
          0 * bSquareWidth + leftOffset, 7 * bSquareWidth + topOffset, 'cross'),
      // u-turn
      Spot(0 * bSquareWidth + leftOffset, 8 * bSquareWidth + topOffset),
      Spot(1 * bSquareWidth + leftOffset, 8 * bSquareWidth + topOffset),
      Spot(2 * bSquareWidth + leftOffset, 8 * bSquareWidth + topOffset),
      Spot(3 * bSquareWidth + leftOffset, 8 * bSquareWidth + topOffset),
      Spot(4 * bSquareWidth + leftOffset, 8 * bSquareWidth + topOffset),
      Spot(5 * bSquareWidth + leftOffset, 8 * bSquareWidth + topOffset),
      // bottom right cross turn
      Spot.withType(
          5 * bSquareWidth + leftOffset, 9 * bSquareWidth + topOffset, 'cross'),
    ];

    leftEnd = [
      Spot(5 * bSquareWidth + leftOffset, 6 * bSquareWidth + topOffset),
      Spot(4 * bSquareWidth + leftOffset, 6 * bSquareWidth + topOffset),
      Spot(3 * bSquareWidth + leftOffset, 6 * bSquareWidth + topOffset),
      Spot(2 * bSquareWidth + leftOffset, 6 * bSquareWidth + topOffset),
      Spot(1 * bSquareWidth + leftOffset, 6 * bSquareWidth + topOffset),
      Spot(0 * bSquareWidth + leftOffset, 6 * bSquareWidth + topOffset),
      // u-turn
      Spot.withType(
          1 * bSquareWidth + leftOffset, 7 * bSquareWidth + topOffset, 'last6'),
      Spot.withType(
          2 * bSquareWidth + leftOffset, 7 * bSquareWidth + topOffset, 'last6'),
      Spot.withType(
          3 * bSquareWidth + leftOffset, 7 * bSquareWidth + topOffset, 'last6'),
      Spot.withType(
          4 * bSquareWidth + leftOffset, 7 * bSquareWidth + topOffset, 'last6'),
      Spot.withType(
          5 * bSquareWidth + leftOffset, 7 * bSquareWidth + topOffset, 'last6'),
      Spot.withType(
          6 * bSquareWidth + leftOffset, 7 * bSquareWidth + topOffset, 'last6'),
      // bottom fruit
      Spot.withType(
          7 * bSquareWidth + leftOffset, 7 * bSquareWidth + topOffset, 'fruit'),
    ];
  }

  void initTopSpecifics() {
    topStage = [
      //stage position 1
      Spot.withType(
          (11.25 * bSquareWidth) + boardOffsetLeft - (bSquareWidth * 0.6),
          2.25 * bSquareWidth + boardOffsetTop - (bSquareWidth * 0.7),
          'stage1'),

      //stage position 2
      Spot.withType(
          (12.75 * bSquareWidth) + boardOffsetLeft - (bSquareWidth * 0.6),
          2.25 * bSquareWidth + boardOffsetTop - (bSquareWidth * 0.7),
          'stage2'),

      //stage position 3
      Spot.withType(
          (11.25 * bSquareWidth) + boardOffsetLeft - (bSquareWidth * 0.6),
          3.75 * bSquareWidth + boardOffsetTop - (bSquareWidth * 0.7),
          'stage3'),

      //stage position 4
      Spot.withType(
          (12.75 * bSquareWidth) + boardOffsetLeft - (bSquareWidth * 0.6),
          3.75 * bSquareWidth + boardOffsetTop - (bSquareWidth * 0.7),
          'stage4'),
    ];

    topStart = [
      // starting from mountain top
      Spot.withType(7 * bSquareWidth + leftOffset, 5 * bSquareWidth + topOffset,
          'first5'),
      Spot.withType(7 * bSquareWidth + leftOffset, 4 * bSquareWidth + topOffset,
          'first5'),
      Spot.withType(7 * bSquareWidth + leftOffset, 3 * bSquareWidth + topOffset,
          'first5'),
      Spot.withType(7 * bSquareWidth + leftOffset, 2 * bSquareWidth + topOffset,
          'first5'),
      Spot.withType(7 * bSquareWidth + leftOffset, 1 * bSquareWidth + topOffset,
          'first5'),
      Spot.withType(
          7 * bSquareWidth + leftOffset, 0 * bSquareWidth + topOffset, 'cross'),
      // u-turn
      Spot(6 * bSquareWidth + leftOffset, 0 * bSquareWidth + topOffset),
      Spot(6 * bSquareWidth + leftOffset, 1 * bSquareWidth + topOffset),
      Spot(6 * bSquareWidth + leftOffset, 2 * bSquareWidth + topOffset),
      Spot(6 * bSquareWidth + leftOffset, 3 * bSquareWidth + topOffset),
      Spot(6 * bSquareWidth + leftOffset, 4 * bSquareWidth + topOffset),
      Spot(6 * bSquareWidth + leftOffset, 5 * bSquareWidth + topOffset),
      // bottom right cross turn
      Spot.withType(
          5 * bSquareWidth + leftOffset, 5 * bSquareWidth + topOffset, 'cross'),
    ];

    topEnd = [
      Spot(8 * bSquareWidth + leftOffset, 5 * bSquareWidth + topOffset),
      Spot(8 * bSquareWidth + leftOffset, 4 * bSquareWidth + topOffset),
      Spot(8 * bSquareWidth + leftOffset, 3 * bSquareWidth + topOffset),
      Spot(8 * bSquareWidth + leftOffset, 2 * bSquareWidth + topOffset),
      Spot(8 * bSquareWidth + leftOffset, 1 * bSquareWidth + topOffset),
      Spot(8 * bSquareWidth + leftOffset, 0 * bSquareWidth + topOffset),
      // u-turn
      Spot.withType(
          8 * bSquareWidth + leftOffset, 1 * bSquareWidth + topOffset, 'last6'),
      Spot.withType(
          8 * bSquareWidth + leftOffset, 2 * bSquareWidth + topOffset, 'last6'),
      Spot.withType(
          8 * bSquareWidth + leftOffset, 3 * bSquareWidth + topOffset, 'last6'),
      Spot.withType(
          8 * bSquareWidth + leftOffset, 4 * bSquareWidth + topOffset, 'last6'),
      Spot.withType(
          8 * bSquareWidth + leftOffset, 5 * bSquareWidth + topOffset, 'last6'),
      Spot.withType(
          8 * bSquareWidth + leftOffset, 6 * bSquareWidth + topOffset, 'last6'),
      // bottom fruit
      Spot.withType(
          7 * bSquareWidth + leftOffset, 7 * bSquareWidth + topOffset, 'fruit'),
    ];
  }

  void initRightSpecifics() {
    rightStage = [
      //stage position 1
      Spot.withType(
          (11.25 * bSquareWidth) + boardOffsetLeft - (bSquareWidth * 0.6),
          11.25 * bSquareWidth + boardOffsetTop - (bSquareWidth * 0.7),
          'stage1'),

      //stage position 2
      Spot.withType(
          (12.75 * bSquareWidth) + boardOffsetLeft - (bSquareWidth * 0.6),
          11.25 * bSquareWidth + boardOffsetTop - (bSquareWidth * 0.7),
          'stage2'),

      //stage position 3
      Spot.withType(
          (11.25 * bSquareWidth) + boardOffsetLeft - (bSquareWidth * 0.6),
          12.75 * bSquareWidth + boardOffsetTop - (bSquareWidth * 0.7),
          'stage3'),

      //stage position 4
      Spot.withType(
          (12.75 * bSquareWidth) + boardOffsetLeft - (bSquareWidth * 0.6),
          12.75 * bSquareWidth + boardOffsetTop - (bSquareWidth * 0.7),
          'stage4'),
    ];

    rightStart = [
      // starting from mountain top
      Spot.withType(9 * bSquareWidth + leftOffset, 7 * bSquareWidth + topOffset,
          'first5'),
      Spot.withType(10 * bSquareWidth + leftOffset,
          7 * bSquareWidth + topOffset, 'first5'),
      Spot.withType(11 * bSquareWidth + leftOffset,
          7 * bSquareWidth + topOffset, 'first5'),
      Spot.withType(12 * bSquareWidth + leftOffset,
          7 * bSquareWidth + topOffset, 'first5'),
      Spot.withType(13 * bSquareWidth + leftOffset,
          7 * bSquareWidth + topOffset, 'first5'),
      Spot.withType(14 * bSquareWidth + leftOffset,
          7 * bSquareWidth + topOffset, 'cross'),
      // u-turn
      Spot(14 * bSquareWidth + leftOffset, 6 * bSquareWidth + topOffset),
      Spot(13 * bSquareWidth + leftOffset, 6 * bSquareWidth + topOffset),
      Spot(12 * bSquareWidth + leftOffset, 6 * bSquareWidth + topOffset),
      Spot(11 * bSquareWidth + leftOffset, 6 * bSquareWidth + topOffset),
      Spot(10 * bSquareWidth + leftOffset, 6 * bSquareWidth + topOffset),
      Spot(9 * bSquareWidth + leftOffset, 6 * bSquareWidth + topOffset),
      // bottom right cross turn
      Spot.withType(
          9 * bSquareWidth + leftOffset, 5 * bSquareWidth + topOffset, 'cross'),
    ];

    rightEnd = [
      Spot(9 * bSquareWidth + leftOffset, 8 * bSquareWidth + topOffset),
      Spot(10 * bSquareWidth + leftOffset, 8 * bSquareWidth + topOffset),
      Spot(11 * bSquareWidth + leftOffset, 8 * bSquareWidth + topOffset),
      Spot(12 * bSquareWidth + leftOffset, 8 * bSquareWidth + topOffset),
      Spot(13 * bSquareWidth + leftOffset, 8 * bSquareWidth + topOffset),
      Spot(14 * bSquareWidth + leftOffset, 8 * bSquareWidth + topOffset),
      // u-turn
      Spot.withType(14 * bSquareWidth + leftOffset,
          8 * bSquareWidth + topOffset, 'last6'),
      Spot.withType(13 * bSquareWidth + leftOffset,
          8 * bSquareWidth + topOffset, 'last6'),
      Spot.withType(12 * bSquareWidth + leftOffset,
          8 * bSquareWidth + topOffset, 'last6'),
      Spot.withType(11 * bSquareWidth + leftOffset,
          8 * bSquareWidth + topOffset, 'last6'),
      Spot.withType(10 * bSquareWidth + leftOffset,
          8 * bSquareWidth + topOffset, 'last6'),
      Spot.withType(
          9 * bSquareWidth + leftOffset, 8 * bSquareWidth + topOffset, 'last6'),
      // bottom fruit
      Spot.withType(
          7 * bSquareWidth + leftOffset, 7 * bSquareWidth + topOffset, 'fruit'),
    ];
  }

  void initializeTracks() {
    leftOffset = boardOffsetLeft - pawnOffsetLeft;
    topOffset = boardOffsetTop - pawnOffsetTop;

    initMountainPos();
    initBottomSpecifics();
    initLeftSpecifics();
    initTopSpecifics();
    initRightSpecifics();
  }

  List<Spot> getBottomTrack(int pawnNumber) {
    return [
      bottomStage[pawnNumber - 1],
      ...bottomStart,
      ...rightMountain,
      ...topMountain,
      ...leftMountain,
      ...bottomEnd
    ];
  }

  List<Spot> getLeftTrack(int pawnNumber) {
    return [
      leftStage[pawnNumber - 1],
      ...leftStart,
      ...bottomMountain,
      ...rightMountain,
      ...topMountain,
      ...leftEnd
    ];
  }

  List<Spot> getTopTrack(int pawnNumber) {
    return [
      topStage[pawnNumber - 1],
      ...topStart,
      ...leftMountain,
      ...bottomMountain,
      ...rightMountain,
      ...topEnd
    ];
  }

  List<Spot> getRightTrack(int pawnNumber) {
    return [
      rightStage[pawnNumber - 1],
      ...rightStart,
      ...topMountain,
      ...leftMountain,
      ...bottomMountain,
      ...rightEnd
    ];
  }
}
