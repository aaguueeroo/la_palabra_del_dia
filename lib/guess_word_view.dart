import 'package:flutter/material.dart';
import 'package:la_palabra_del_dia/controller/game_controller.dart';
import 'package:la_palabra_del_dia/view/keyboard/keyboard.dart';
import 'package:la_palabra_del_dia/view/word/word_attempt.dart';
import 'package:provider/provider.dart';
import 'constants/globals.dart';

class GuessWordView extends StatefulWidget {
  const GuessWordView({Key? key}) : super(key: key);

  @override
  State<GuessWordView> createState() => _GuessWordViewState();
}

class _GuessWordViewState extends State<GuessWordView> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    await Provider.of<GameController>(context, listen: false)
        .setNewWordToGuess();
    setState(() {
      isLoading = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('La Palabra del Día'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    for (int i = 0; i < maxAttempts; i++)
                      WordAttemptBox(attempt: i),
                    const Spacer(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      child: const Keyboard(),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
