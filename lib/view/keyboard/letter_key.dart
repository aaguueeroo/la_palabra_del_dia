import 'package:flutter/material.dart';

import '../../controller/game_controller.dart';

class LetterKey extends StatelessWidget {
  const LetterKey({Key? key, required this.letter}) : super(key: key);
  final String letter;

  @override
  Widget build(BuildContext context) {
    GameController controller = GameController();
    Color color = Colors.grey;
    //TODO: change color of key when send: dark, green or yellow

    return Expanded(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextButton(
          onPressed: () => controller.inputLetter(letter),
          child: Text(
            letter,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
