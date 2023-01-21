import 'package:flutter/material.dart';
import 'package:la_palabra_del_dia/view/palabra/letra_recuadro.dart';

class Palabra extends StatelessWidget {
  const Palabra({Key? key, required this.intento}) : super(key: key);

  final int intento;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LetraRecuadro(index: 0, intento: intento),
        LetraRecuadro(index: 1, intento: intento),
        LetraRecuadro(index: 2, intento: intento),
        LetraRecuadro(index: 3, intento: intento),
        LetraRecuadro(index: 4, intento: intento),
      ],
    );
  }
}
