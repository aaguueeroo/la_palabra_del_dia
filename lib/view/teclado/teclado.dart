import 'package:flutter/material.dart';
import 'package:la_palabra_del_dia/view/teclado/tecla.dart';
import 'package:la_palabra_del_dia/view/teclado/tecla_borrar.dart';
import 'package:la_palabra_del_dia/view/teclado/tecla_enviar.dart';

class Teclado extends StatelessWidget {
  const Teclado({Key? key}) : super(key: key);
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
              Tecla(letra: 'Q'),
              Tecla(letra: 'W'),
              Tecla(letra: 'E'),
              Tecla(letra: 'R'),
              Tecla(letra: 'T'),
              Tecla(letra: 'Y'),
              Tecla(letra: 'U'),
              Tecla(letra: 'I'),
              Tecla(letra: 'O'),
              Tecla(letra: 'P'),
            ],
          ),
        ),
        SizedBox(
          height: teclaHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Tecla(letra: 'A'),
              Tecla(letra: 'S'),
              Tecla(letra: 'D'),
              Tecla(letra: 'F'),
              Tecla(letra: 'G'),
              Tecla(letra: 'H'),
              Tecla(letra: 'J'),
              Tecla(letra: 'K'),
              Tecla(letra: 'L'),
              Tecla(letra: 'Ñ'),
            ],
          ),
        ),
        SizedBox(
          height: teclaHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              TeclaEnviar(),
              Tecla(letra: 'Z'),
              Tecla(letra: 'X'),
              Tecla(letra: 'C'),
              Tecla(letra: 'V'),
              Tecla(letra: 'B'),
              Tecla(letra: 'N'),
              Tecla(letra: 'M'),
              TeclaBorrar(),
            ],
          ),
        ),
      ],
    );
  }
}
