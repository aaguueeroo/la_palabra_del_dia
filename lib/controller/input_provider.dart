import 'package:flutter/cupertino.dart';
import 'package:la_palabra_del_dia/model/palabra_adivinar.dart';

class InputProvider with ChangeNotifier {
  Characters palabraAdivinar = Characters('Julia');
  List<Characters?> palabrasInput = [];

  int intento = 0;

  void addLetterToInput(String letter) {
    palabrasInput[intento] = palabrasInput[intento]! + letter.characters;
    notifyListeners();
  }

  void deleteLetterFromInput() {
    palabrasInput[intento] =
        palabrasInput[intento]!.getRange(0, palabrasInput[intento]!.length - 1);
    notifyListeners();
  }

  String? getLetterInIndex(int index) {
    if (index >= palabrasInput[intento]!.length) {
      return null;
    }
    return palabrasInput[intento]!.elementAt(index);
  }

  void nextIntento() {
    intento++;
    notifyListeners();
  }
}
