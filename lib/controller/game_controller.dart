import 'dart:math';

import 'package:flutter/material.dart';
import 'package:la_palabra_del_dia/guess_word_view.dart';
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
  bool wonGame = false;

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

  // returns true if the attempt is correct (if the user guessed the word) and
  // false if the attempt is incorrect
  sendAttempt(BuildContext context) {
    // if the word is complete
    if (_attemptedWords[currentAttempt].length == wordToGuess!.length) {
      if (wordIsCorrect()) {
        wonGame = true;
        _currentAttempt++;
        scaffoldMessengerKey.currentState!
            .showSnackBar(const SnackBar(content: Text('Enhorabuena!')));
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Ganaste!'),
                  content: const Text('Volver a jugar?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        resetGame(context);
                      },
                      child: const Text('Si'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('No'),
                    ),
                  ],
                ));
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

  bool wordIsCorrect() {
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

  Color getBoxLetterColor({required int index, required int attempt}) {
    try {
      // Before sending the word
      if (attempt == _currentAttempt && !wordIsCorrect()) {
        return Colors.transparent;
      }
      if (_currentAttempt == attempt) return Colors.transparent;

      //once you send
      List<Letter> currentWord = _attemptedWords[attempt];
      Letter currentLetter = currentWord[index];

      //----green----
      if (currentLetter.isInRightPosition()) return Colors.green;

      //----yellow----
      //counts how many times the letter appears in the word in total
      int appearancesTotalInWord = 0;

      for (int i = 0; i < wordToGuess!.length; i++) {
        if ((wordToGuess!.elementAt(i) == currentLetter.character)) {
          appearancesTotalInWord++;
        }
      }

      //if the letter is not in the word --> no color
      if (appearancesTotalInWord == 0) return Colors.transparent;

      //counts how many times the letter appears before the current position
      int appearancesBeforePosition = 0;
      for (int i = 0; i < currentLetter.position; i++) {
        if (currentWord[i].character == currentLetter.character) {
          appearancesBeforePosition++;
        }
      }

      //counts how many times the letter is in right place after the current position
      int appearancesCorrectAfterPosition = 0;
      for (int i = currentLetter.position + 1; i < wordToGuess!.length; i++) {
        if (currentWord[i].isInRightPosition() &&
            currentWord[i] == currentLetter) {
          appearancesCorrectAfterPosition++;
        }
      }

      bool isYellow = appearancesTotalInWord >
          appearancesCorrectAfterPosition + appearancesBeforePosition;

      return isYellow ? Colors.yellow : Colors.transparent;
    } catch (e) {
      return Colors.transparent;
    }
  }

  Color getKeyLetterColor(String letter) {
    if (wonGame && wordToGuess!.contains(letter))
      return Colors.green;
    else if (wonGame) return Colors.grey;

    if (_currentAttempt > 0) {
      for (int attempt = 1; attempt <= currentAttempt; attempt++) {
        List<Letter> currentWord = _attemptedWords[attempt - 1];

        for (int i = 0; i < wordToGuess!.length; i++) {
          if (currentWord[i].character == wordToGuess!.elementAt(i) &&
              currentWord[i].character == letter) {
            return Colors.green;
          }
        }
      }

      for (int attempt = 1; attempt <= currentAttempt; attempt++) {
        List<Letter> currentWord = _attemptedWords[attempt - 1];

        for (int i = 0; i < wordToGuess!.length; i++) {
          if (wordToGuess!.contains(letter) &&
              currentWord[i].character == letter) return Colors.yellow;
        }
      }

      if (!wordToGuess!.contains(letter)) {
        return Colors.grey;
      }
    }
    return Colors.grey;
  }

  void resetGame(BuildContext context) {
    setNewWordToGuess();
    _currentAttempt = 0;
    _attemptedWords = [[]];
    wonGame = false;

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const GuessWordView()));
  }
}
