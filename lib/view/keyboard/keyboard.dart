import 'package:flutter/material.dart';
import 'package:la_palabra_del_dia/view/keyboard/delete_key.dart';
import 'package:la_palabra_del_dia/view/keyboard/send_key.dart';

import 'letter_key.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);
  static const teclaHeight = 65.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: teclaHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              LetterKey(letter: 'Q'),
              LetterKey(letter: 'W'),
              LetterKey(letter: 'E'),
              LetterKey(letter: 'R'),
              LetterKey(letter: 'T'),
              LetterKey(letter: 'Y'),
              LetterKey(letter: 'U'),
              LetterKey(letter: 'I'),
              LetterKey(letter: 'O'),
              LetterKey(letter: 'P'),
            ],
          ),
        ),
        SizedBox(
          height: teclaHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              LetterKey(letter: 'A'),
              LetterKey(letter: 'S'),
              LetterKey(letter: 'D'),
              LetterKey(letter: 'F'),
              LetterKey(letter: 'G'),
              LetterKey(letter: 'H'),
              LetterKey(letter: 'J'),
              LetterKey(letter: 'K'),
              LetterKey(letter: 'L'),
              LetterKey(letter: 'Ñ'),
            ],
          ),
        ),
        SizedBox(
          height: teclaHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              SendKey(),
              LetterKey(letter: 'Z'),
              LetterKey(letter: 'X'),
              LetterKey(letter: 'C'),
              LetterKey(letter: 'V'),
              LetterKey(letter: 'B'),
              LetterKey(letter: 'N'),
              LetterKey(letter: 'M'),
              DeleteKey(),
            ],
          ),
        ),
      ],
    );
  }
}
