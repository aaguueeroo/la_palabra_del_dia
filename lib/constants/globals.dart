import 'package:flutter/material.dart';

Characters? wordToGuess;

/// The number of max attempts that the user can make.
const int maxAttempts = 6;

/// List of possible words that the user can guess. The word is chosen randomly
/// from this list every time the game view is built.
///
/// By default, all the words have a length of 5 letters.
List<Characters> wordList = [
  Characters('JULIA'),
  Characters('FUEGO'),
  Characters('CIELO'),
  Characters('NIEVE'),
  Characters('PODER'),
  Characters('MENOR'),
  Characters('NOVIO'),
  Characters('JUEGO'),
  Characters('TUNEL'),
  Characters('PASTO'),
  Characters('VICIO'),
  Characters('DROGA'),
  Characters('CREMA'),
  Characters('MOVIL'),
  Characters('CALLO'),
  Characters('FIERA'),
  Characters('EXTRA'),
];
