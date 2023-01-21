import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/input_provider.dart';

class Tecla extends StatelessWidget {
  const Tecla({Key? key, required this.letra}) : super(key: key);
  final String letra;

  @override
  Widget build(BuildContext context) {
    InputProvider controller = Provider.of<InputProvider>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Color color = Colors.grey;

    return Expanded(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextButton(
          onPressed: () => controller.addLetterToInput(letra),
          child: Text(
            letra,
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
