import 'package:flutter/material.dart';
import 'package:la_palabra_del_dia/controller/game_controller.dart';
import 'package:provider/provider.dart';

class SendKey extends StatelessWidget {
  const SendKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameController controller = GameController();
    double width = MediaQuery.of(context).size.width;
    double teclaWidth = width / 7;

    return Container(
      margin: const EdgeInsets.all(2),
      width: teclaWidth,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: controller.sendAttempt,
        child: const Text(
          'Enviar',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
