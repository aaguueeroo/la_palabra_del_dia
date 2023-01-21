import 'package:flutter/material.dart';

class PalabraAdivinar {
  Characters letras;

  PalabraAdivinar({required this.letras});

  bool containsLetter(String letter) {
    return letras.contains(letter);
  }
}
