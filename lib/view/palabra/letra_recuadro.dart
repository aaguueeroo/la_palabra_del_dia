import 'package:flutter/material.dart';
import 'package:la_palabra_del_dia/controller/input_provider.dart';
import 'package:provider/provider.dart';

class LetraRecuadro extends StatelessWidget {
  final int index;
  final int intento;

  LetraRecuadro({Key? key, required this.index, required this.intento})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputProvider controller = Provider.of<InputProvider>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double teclaWidth = width / 5.5;
    double teclaHeight = height / 14;

    String? letra = controller.getLetterInIndex(index);

    return Container(
      alignment: Alignment.center,
      height: teclaHeight,
      width: teclaWidth,
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: Colors.yellow.shade100,
        border: Border.all(
          color: Colors.black87,
          width: 1,
        ),
      ),
      child: letra != null
          ? Text(
              letra,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 54,
                fontWeight: FontWeight.w300,
              ),
            )
          : null,
    );
  }
}
