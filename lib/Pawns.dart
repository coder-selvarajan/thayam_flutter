import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/painting.dart' show decodeImageFromList;

class Pawns extends CustomPainter {
  Pawns();

  // load the image async and then draw with `canvas.drawImage(image, Offset.zero, Paint());`
  Future<Null> loadImageAsset(String assetName) async {
    final data = await rootBundle.load(assetName);
    pawnimage = await decodeImageFromList(data.buffer.asUint8List());
  }

  ui.Image pawnimage = null;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = new Paint()
      ..color = Color(0xFFFF0000)
      ..style = PaintingStyle.fill;
    var rect = Rect.fromLTWH(50, 50, 50, 50);
//    canvas.drawRect(rect, paint);

    loadImageAsset("assets/images/maroon-pawn.png");
    canvas.drawImage(pawnimage, new Offset(100.0, 100.0), new Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
