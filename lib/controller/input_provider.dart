import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_palabra_del_dia/main.dart';

class InputProvider with ChangeNotifier {
  /// The number of letters that the word to guess has.
  static const int numberOfLetters = 5;

  /// The word that the user must guess.
  Characters wordToGuess = Characters('JULIA');

  /// The number of max attempts that the user can make.
  static const int maxAttempts = 6;

  /// The current attempt that the user is trying.
  int attempt = 0;

  /// List of words that the user has guessed so far. Every time the user
  /// inputs a key on the keyboard, this list is updated.
  List<Characters?> attemptedWords = [
    Characters(''),
    Characters(''),
    Characters(''),
    Characters(''),
    Characters(''),
    Characters(''),
  ];

  /// Adds the letter that the user presses on the keyboard to the current
  /// attempt. Checks if all the letters of the word have been inputted. In
  /// that case, it returns.
  ///
  /// Called every time the user presses a letter on the keyboard.
  ///
  /// It takes the parameter [letter] which is the letter that the user pressed
  /// in the keyboard.
  void addLetterToCurrentAttempt(String letter) {
    if (attemptedWords[attempt]?.length == numberOfLetters) {
      return;
    }

    attemptedWords[attempt] = attemptedWords[attempt]! + letter.characters;
    notifyListeners();
  }

  /// Removes the last letter that the user pressed on the keyboard from the
  /// current attempt. If the current attempt is empty, it doesn't do anything.
  ///
  /// Called when the user presses the backspace button on the keyboard.
  void deleteLetterFromCurrentAttempt() {
    if (attemptedWords[attempt]!.isEmpty) {
      return;
    }

    attemptedWords[attempt] = attemptedWords[attempt]!
        .getRange(0, attemptedWords[attempt]!.length - 1);

    notifyListeners();
  }

  /// Called when the user presses the enter button on the keyboard.
  ///
  /// Checks if the current attempt has all the words. If it does, it checks if
  /// the current attempt is correct. If it is, the user wins the game.
  /// If it is not, it adds the current attempt to the list of attempted words
  /// using [addWordToAttemptedWords] and increments the attempt counter.
  void sendCurrentAttempt() {
    // Check for length.
    if (attemptedWords[attempt]!.length != numberOfLetters) {
      return;
    }

    // If the word is correct.
    if (attemptedWords[attempt] == wordToGuess) {
      //TODO win the game
      scaffoldMessengerKey.currentState!
          .showSnackBar(SnackBar(content: Text('Correcto!')));
    }
    // If the word is not correct
    else {
      incrementAttempt();
    }

    print(attemptedWords);
    print(wordToGuess);
  }

  // Sets [intento] to the next attempt. It is called when user presses the
  // "Enviar" button.
  void incrementAttempt() {
    attempt++;

    // When the user reaches the max number of attempts, the game finishes
    if (attempt > maxAttempts) {
      attempt = maxAttempts;
      endGame();
    }
    notifyListeners();
  }

  /// Returns the letter in the [index] position of the [attempt] attempt to
  /// fill the letter boxes showing the attempts.
  ///
  /// It takes the parameters [index] which is the index of the letter to get
  /// and [attempt] which is the attempt from the list of attempted words.
  ///
  /// Returns the letter in the requested position or null if the letter has not
  /// been typed yet.
  String? getLetterInIndex({required int index, required int attempt}) {
    // Case when the user has not introduced a try yet
    if (attemptedWords.length - 1 < attempt) {
      return null;
    }
    //
    else if (index >= attemptedWords[attempt]!.length) {
      return null;
    }
    return attemptedWords[attempt]!.elementAt(index);
  }

  /// Finishes the game.
  ///
  ///
  void endGame() {}
}
