import 'package:flutter/material.dart';
import 'package:la_palabra_del_dia/constants/globals.dart';
import 'package:la_palabra_del_dia/controller/game_controller.dart';
import 'package:la_palabra_del_dia/view/word/letter_box.dart';

class WordAttemptBox extends StatelessWidget {
  const WordAttemptBox({Key? key, required this.attempt}) : super(key: key);

  final int attempt;

  @override
  Widget build(BuildContext context) {
    GameController controller = GameController();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < wordToGuess!.length; i++)
          LetterBox(index: i, attempt: attempt),
      ],
    );
  }
}
