import 'package:flutter/material.dart';
import 'package:la_palabra_del_dia/controller/input_provider.dart';
import 'package:la_palabra_del_dia/guess_word_view.dart';
import 'package:provider/provider.dart';

GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InputProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      title: 'La Palabra del Día',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const GuessWordView(),
    );
  }
}
