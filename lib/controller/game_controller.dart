import 'dart:math';

import 'package:flutter/material.dart';
import 'package:la_palabra_del_dia/main.dart';
import '../constants/globals.dart';
import '../model/letter.dart';

class GameController with ChangeNotifier {
  static final GameController _singleton = GameController._internal();

  factory GameController() {
    // _singleton._game = Provider.of<Game>(context);

    return _singleton;
  }

  GameController._internal() {
    _currentAttempt = 0;
    _attemptedWords = [[]];
  }

  //VARIABLES
  late List<List<Letter>> _attemptedWords;
  late int _currentAttempt;

  get currentAttempt => _currentAttempt;
  get attemptedWords => _attemptedWords;

  Future<void> setNewWordToGuess() async {
    final random = await Random().nextInt(wordList.length);
    wordToGuess = wordList[random];
    print(wordToGuess);
  }

  void inputLetter(String letter) {
    int position = _attemptedWords[_currentAttempt].length;
    if (_attemptedWords[currentAttempt].length < wordToGuess!.length) {
      _attemptedWords[currentAttempt].add(Letter(
        character: letter,
        position: position,
      ));
    }
    notifyListeners();
  }

  void deleteLetter() {
    if (_attemptedWords[currentAttempt].isNotEmpty) {
      _attemptedWords[currentAttempt].removeLast();
    }
    notifyListeners();
  }

  void sendAttempt() {
    // if the word is complete
    if (_attemptedWords[currentAttempt].length == wordToGuess!.length) {
      if (WordIsCorrect()) {
        _currentAttempt++;
        scaffoldMessengerKey.currentState!
            .showSnackBar(const SnackBar(content: Text('Enhorabuena!')));
      } else {
        //show wrong and right letters
      }
      addAttemptedWord();
    }

    //if there are letters missing
    else {
      scaffoldMessengerKey.currentState!
          .showSnackBar(const SnackBar(content: Text('Not enough letters')));
    }
  }

  /// Called when a word is guessed incorrectly.
  void addAttemptedWord() {
    _attemptedWords.add([]);
    _currentAttempt++;
    if (_currentAttempt > maxAttempts) {
      endGame();
    }
    notifyListeners();
  }

  bool WordIsCorrect() {
    for (int i = 0; i < wordToGuess!.length; i++) {
      if (_attemptedWords[_currentAttempt][i].character !=
          wordToGuess!.elementAt(i)) {
        return false;
      }
    }
    return true;
  }

  /// Finishes the game.
  ///
  ///
  void endGame() {}

  ///VIEW
  Letter? getLetterInIndex({required int index, required int attempt}) {
    try {
      return _attemptedWords[attempt][index];
    } catch (e) {
      return null;
    }
  }

  Color getLetterColor({required int index, required int attempt}) {
    try {
      // Before sending the word
      if (attempt == _currentAttempt && !WordIsCorrect()) {
        return Colors.transparent;
      }
      if (_currentAttempt == attempt) return Colors.transparent;

      Letter currentLetter = _attemptedWords[attempt][index];
      int appearancesInWord = 0;
      //TODO: fix. counts double when the letter is repeated. make a set
      //to count only once
      for (int i = 0; i < wordToGuess!.length; i++) {
        if (wordToGuess!.elementAt(i) == currentLetter.character) {
          appearancesInWord++;
        }
      }

      if (appearancesInWord == 0) return Colors.transparent;

      if (currentLetter.isInRightPosition()) return Colors.green;

      bool isYellow(int totalAppearances) {
        int appearancesBeforeCurrent = 0;
        for (int i = 0; i < currentLetter.position - 1; i++) {
          if (_attemptedWords[attempt][i].character ==
              currentLetter.character) {
            appearancesBeforeCurrent++;
          }
        }
        if (totalAppearances > appearancesBeforeCurrent) return true;
        return false;
      }

      return isYellow(appearancesInWord) ? Colors.yellow : Colors.transparent;
    } catch (e) {
      return Colors.transparent;
    }
  }
}
