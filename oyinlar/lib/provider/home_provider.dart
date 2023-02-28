import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider();
  double redGamer = 0.5;
  double blueGamer = 0.5;

  bool isRedGamerWin = false;
  bool isBlueGamerWin = false;
  int redGamewinner = 0;
  int blueGamewinner = 0;

  onTeslaGamerTop() {
    if (redGamer <= 0.03 && blueGamer >= 0.03) {
      isBlueGamerWin = true;
      notifyListeners();
    } else {
      redGamer -= 0.03;
      blueGamer += 0.03;
      notifyListeners();
    }
  }

  onFerrariGamerTop() {
    if (redGamer >= 0.03 && blueGamer <= 0.03) {
      isRedGamerWin = true;
      notifyListeners();
    } else {
      redGamer += 0.03;
      blueGamer -= 0.03;
      notifyListeners();
    }
  }

  restartGame() {
    redGamer = 0.5;
    blueGamer = 0.5;
    isRedGamerWin = false;
    isBlueGamerWin = false;
    notifyListeners();
  }

  historyGame() {
    if (redGamer >= 0.03 && blueGamer <= 0.03) {
      return redGamewinner++;
    } else {
      return blueGamewinner++;
    }
  }
}
