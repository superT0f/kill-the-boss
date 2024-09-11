// import 'dart:math';
import 'package:flutter/material.dart';
import 'screens/scores.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'theme.dart';
import 'screens/gtn.dart';
import 'screens/home.dart';
import 'screens/config.dart';

const appName = 'Guess The Number';
final myTextEditingController = TextEditingController();
// late SharedPreferences prefs;

Future<void> main() async {
  // prefs = await SharedPreferences.getInstance();
  // myTextEditingController.text = prefs.getString('username') ?? "empty";
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
        '/game': (context) => const KillTheBoss(title: appName),
      },
      title: appName,
      darkTheme: ThemeData.light(),
      theme: theme,
    );
  }
}
