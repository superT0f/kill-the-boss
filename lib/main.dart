// import 'dart:math';
import 'package:flutter/material.dart';
import 'screens/ktb.dart';
import 'screens/scores.dart';
import 'theme.dart';
import 'screens/gtn.dart';
import 'screens/home.dart';
import 'screens/config.dart';

const appName = 'Guess The Number';
final myTextEditingController = TextEditingController();
// late SharedPreferences prefs;

Future<void> main() async {
  myTextEditingController.text = "empty";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstScreen(),
        '/config': (context) => const Config(),
        '/scores': (context) => const Scores(),
        '/gtn': (context) => const GuessTheNumber(
              title: 'Guess The Number',
            ),
        '/game': (context) => const KillTheBoss(title: appName),
      },
      title: appName,
      darkTheme: ThemeData.light(),
      theme: theme,
    );
  }
}
