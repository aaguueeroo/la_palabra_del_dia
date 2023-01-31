import 'package:flutter/material.dart';
import 'package:la_palabra_del_dia/controller/game_controller.dart';

class DeleteKey extends StatelessWidget {
  const DeleteKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameController controller = GameController();
    double width = MediaQuery.of(context).size.width;
    double teclaWidth = width / 8;

    return Container(
      margin: const EdgeInsets.all(2),
      width: teclaWidth,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        onPressed: controller.deleteLetter,
        icon: const Icon(
          Icons.backspace,
          color: Colors.white,
        ),
      ),
    );
  }
}
