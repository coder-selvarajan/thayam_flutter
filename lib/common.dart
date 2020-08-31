import 'tracks.dart';
import 'constants.dart';

class Common {
  Tracks tracks = Tracks();

  void initBoardSizes(double screenWidth, double screenHeight) {
    if (screenWidth > screenHeight) {
      bWidth = screenHeight - (screenHeight * 0.4);
      bHeight = bWidth;
    } else {
      bWidth = screenWidth - 20;
      bHeight = bWidth;
    }

    boardOffsetLeft = (screenWidth - bWidth) / 2;
    boardOffsetTop = (screenHeight - bHeight) / 2;
    bSquareWidth = bWidth / 15;

    pawnWidth = bSquareWidth * 1.2;
    pawnOffsetLeft = bSquareWidth * 0.1;
    pawnOffsetTop = bSquareWidth * 0.3;

    playerStageWidth = bWidth * 0.45;
    playerStageHeight = bWidth * 0.15;
    playerStageGap = bWidth * 0.05;

    diceWidth = bSquareWidth * 1.5;
    diceHeight = bSquareWidth;

    initTracks();
  }

  Tracks initTracks() {
    tracks.initializeTracks();

    trackLeft = tracks.getLeftTrack(4);
    trackTop = tracks.getTopTrack(4);
    trackRight = tracks.getRightTrack(4);
    trackBottom = tracks.getBottomTrack(1);

    return tracks;
  }
}
