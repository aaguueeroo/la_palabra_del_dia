import 'package:flutter/material.dart';
import 'package:la_palabra_del_dia/controller/game_controller.dart';
import 'package:provider/provider.dart';

import '../../model/letter.dart';

class LetterBox extends StatelessWidget {
  final int index;
  final int attempt;

  const LetterBox({Key? key, required this.index, required this.attempt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameController controller = Provider.of<GameController>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double teclaWidth = width / 5.5;
    double teclaHeight = height / 14;

    Letter? letter =
        controller.getLetterInIndex(index: index, attempt: attempt);
    Color color = controller.getLetterColor(index: index, attempt: attempt);
    // Color color = Colors.transparent;

    return Container(
      alignment: Alignment.center,
      height: teclaHeight,
      width: teclaWidth,
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black87,
          width: 1,
        ),
      ),
      child: letter != null
          ? Text(
              letter.character,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 54,
                fontWeight: FontWeight.w300,
              ),
            )
          : null,
    );
  }
}
