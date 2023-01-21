import 'package:flutter/material.dart';

class TeclaEnviar extends StatelessWidget {
  const TeclaEnviar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        onPressed: () {},
        child: const Text(
          'Enviar',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
