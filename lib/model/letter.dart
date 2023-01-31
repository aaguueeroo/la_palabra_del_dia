import 'package:flutter/cupertino.dart';

import '../constants/globals.dart';

class Letter {
  /// The character of the [Letter].
  String character;

  int position;

  /// Boolean that indicates if the [Letter] is contained in the word to be guessed.

  /// Boolean that indicates if the [Letter] is contained in the word to be guessed
  /// and is in the same position.

  Letter({required this.character, required this.position});

  /// Checks if the [Letra] is in the word.
  bool isInWord() {
    for (int i = 0; i < wordToGuess!.length; i++) {
      if (Characters(character) == wordToGuess!.characterAt(i)) {
        return true;
      }
    }

    return false;
  }

  /// Checks if the [Letra] is in the right position.
  bool isInRightPosition() {
    if (Characters(character) == wordToGuess!.characterAt(position)) {
      return true;
    }

    return false;
  }
}
