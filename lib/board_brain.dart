import 'package:flutter/material.dart';
import 'package:tic_tac_toe/const.dart';
import 'package:tic_tac_toe/icon_view.dart';

class BoardBrain extends ChangeNotifier {
  int drawScoreCount = 0;
  int crossScoreCount = 0;
  int roundScoreCount = 0;
  bool switchState = userCross;
  int boardInputCount = 0;
  bool isStopBoard = false; // to freeze the board
  List<bool> userCrossInputs = List.filled(9, false);
  List<bool> userRoundInputs = List.filled(9, false);
  List<IconView> tttInputs = List.filled(9, IconView(icon: null));

  // For the winning line

  final double boardWidth;
  Offset winLineP1 = Offset(50, 50);
  Offset winLineP2 = Offset(200, 200);
  bool winStatus = false;

  BoardBrain(this.boardWidth);

  void onUserTap(int index) {
    boardInputCount++;
    bool isValid = tttInputs[index].icon == null;
    if (isValid) {
      tttInputs[index] = switchState == userCross
          ? IconView(
              icon: Icons.clear,
              iconColor: Colors.amber.shade900,
            )
          : IconView(
              icon: Icons.radio_button_unchecked,
              iconColor: Colors.green.shade900,
            );

      if (switchState == userCross) {
        userCrossInputs[index] = true;
        bool isWon = checkForWin(userCrossInputs);
        if (isWon) {
          crossScoreCount++;
          winStatus = true;
        }
      } else {
        userRoundInputs[index] = true;
        bool isWon = checkForWin(userRoundInputs);
        if (isWon) {
          roundScoreCount++;
          winStatus = true;
        }
      }
      if (!winStatus && boardInputCount == 9) drawScoreCount++;
      if (winStatus) isStopBoard = true;
      switchState = !switchState;
      notifyListeners();
    }
  }

  bool checkForWin(List<bool> userInputs) {
    double unitL = boardWidth / 6;

    bool checkTrio(int a, int b, int c) {
      return userInputs[a] && userInputs[b] && userInputs[c];
    }

    bool setPoints(int x1, int y1, int x2, int y2) {
      winLineP1 = Offset(unitL * x1, unitL * y1);
      winLineP2 = Offset(unitL * x2, unitL * y2);
      return true;
    }

    if (checkTrio(0, 1, 2))
      return setPoints(1, 1, 5, 1);
    else if (checkTrio(0, 3, 6))
      return setPoints(1, 1, 1, 5);
    else if (checkTrio(0, 4, 8))
      return setPoints(1, 1, 5, 5);
    else if (checkTrio(1, 4, 7))
      return setPoints(3, 1, 3, 5);
    else if (checkTrio(2, 4, 6))
      return setPoints(5, 1, 1, 5);
    else if (checkTrio(2, 5, 8))
      return setPoints(5, 1, 5, 5);
    else if (checkTrio(3, 4, 5))
      return setPoints(1, 3, 5, 3);
    else if (checkTrio(6, 7, 8))
      return setPoints(1, 5, 5, 5);
    else
      return false;
  }

  void resetBoard() {
    winStatus = false;
    isStopBoard = false;
    boardInputCount = 0;
    userCrossInputs = List.filled(9, false);
    userRoundInputs = List.filled(9, false);
    tttInputs = List.filled(9, IconView(icon: null));
    notifyListeners();
  }
}
