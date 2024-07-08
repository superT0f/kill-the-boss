import 'package:flutter/material.dart';
import 'theme.dart';
import 'util.dart';

const appName = 'Kill The Boss';

void main() {
  runApp(const MyApp());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _try = 0;
  final int _secretNumber = random(200);
  int _randomInc = random(20);
  bool _victory = false;

  void _decrementCounter() {
    setState(() {
      (_counter <= 0) ? _counter = 0 : _counter=_counter-_randomInc;
      _randomInc = random(20);
      _victory = (_counter == 42);
      _try++;
    }); // setState
  }

  void _incrementCounter() {
    setState(() {
      _counter=_counter+_randomInc;
      _try++;
      _randomInc = random(20);
      _victory = (_counter == _secretNumber);
    }); // setState
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _try = 0;
      _victory = false;
    }); // setState
  }

  @override
  Widget build(BuildContext context) {
    var pushMsg =
        '$_try try.'
        'You have to reach the magic number : $_secretNumber';
    if (_victory) {
      pushMsg = "\u2665 -= \\o/ Victory in $_try try \\o/ =- \u2665";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(appName,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                )),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(pushMsg),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'random Increment ${getRandomUnicode()}',
              child: const Icon(Icons.add),
            ),
            
            FloatingActionButton(
              onPressed: _resetCounter,
              tooltip: 'Reset ${getRandomUnicode()}',
              mini: true,
              child: const Icon(Icons.lock_reset),
            ),
            FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'random Decrase ${getRandomUnicode()}',
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment ${getRandomUnicode()}',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      darkTheme: ThemeData.dark(),
      theme: theme,
      home: const MyHomePage(
        title: appName,
      ),
    );
  }
}
