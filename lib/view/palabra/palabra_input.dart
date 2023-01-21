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
        LetraRecuadro(index: 0, attempt: intento),
        LetraRecuadro(index: 1, attempt: intento),
        LetraRecuadro(index: 2, attempt: intento),
        LetraRecuadro(index: 3, attempt: intento),
        LetraRecuadro(index: 4, attempt: intento),
      ],
    );
  }
}
