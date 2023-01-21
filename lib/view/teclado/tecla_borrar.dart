import 'package:flutter/material.dart';
import 'package:la_palabra_del_dia/controller/input_provider.dart';
import 'package:provider/provider.dart';

class TeclaBorrar extends StatelessWidget {
  const TeclaBorrar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputProvider controller = Provider.of<InputProvider>(context);
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
        onPressed: controller.deleteLetterFromInput,
        icon: const Icon(
          Icons.backspace,
          color: Colors.white,
        ),
      ),
    );
  }
}
