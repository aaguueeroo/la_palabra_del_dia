import 'package:flutter/material.dart';
import 'package:la_palabra_del_dia/view/palabra/palabra_input.dart';
import 'package:la_palabra_del_dia/view/teclado/teclado.dart';

class GuessWordView extends StatelessWidget {
  const GuessWordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('La Palabra del Día'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Palabra(intento: 0),
              Palabra(intento: 1),
              Palabra(intento: 2),
              Palabra(intento: 3),
              Palabra(intento: 4),
              Palabra(intento: 5),
              Spacer(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: Teclado(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
