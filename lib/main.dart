// import 'dart:math';
import 'package:flutter/material.dart';
// import 'models.dart';
// import 'objectbox.dart';
import 'theme.dart';
import 'util.dart';

const appName = 'Kill The Boss';
final myTextEditingController = TextEditingController();

/// Provides access to the ObjectBox Store throughout the app.
//late ObjectBox objectbox;

Future<void> main() async {
  // objectbox = await ObjectBox.create();
  runApp(const MyApp());
}


class KillTheBoss extends StatefulWidget {
  const KillTheBoss({super.key, required this.title});
  final String title;

  @override
  State<KillTheBoss> createState() => _KillTheBossState();
}

class _KillTheBossState extends State<KillTheBoss> {
  int _counter = 0;
  int _try = 0;
  final int _secretNumber = random(200);
  int _randomInc = random(20);
  bool _victory = false;
  //ObjectBox.init();

  //final userBox = store.box<User>();

  void _decrementCounter() {
    setState(() {
      (_counter-_randomInc <= 0) ? _counter = 0 : _counter=_counter-_randomInc;
      _randomInc = random(20);
      _victory = (_counter == _secretNumber);
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
    var guessColor = _counter < _secretNumber ? Colors.yellowAccent : Colors.red;
    var name = (myTextEditingController.text.isEmpty) ? 'John DOE' : myTextEditingController.text;
    var pushMsg =
        '$_try try.'
        'Hello $name, you have to reach the magic number : $_secretNumber (current is $_counter)';
    var img = Image(image: AssetImage('img/title.png'));
    if (_victory) {
      pushMsg = "\u2665 -= \\o/ Victory in $_try try : $_secretNumber VS $_counter \\o/ =- \u2665";
      guessColor = Colors.deepOrange;
      img = Image(image: AssetImage('img/victory.png'));
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
              tooltip: 'random Increment $_randomInc',

              child: const Icon(Icons.add),
            ),
            AnimatedContainer(
              width: _counter.toDouble()*5,
              height: 42,
              decoration: BoxDecoration(
                color: guessColor,
              borderRadius: BorderRadius.circular(50.0)
              ),
              duration: Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
            ),
            img,
            AnimatedContainer(
              width: _secretNumber.toDouble()*5,
              height: 42,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(50.0)
              ),
              duration: Duration(seconds: 0),
              curve: Curves.fastOutSlowIn,
            ),
            const Text('-----'),
            FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'random Decrease $_randomInc}',
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetCounter,
        tooltip: 'new game',
        child: const Icon(Icons.reset_tv),
      ),
      
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/',
      routes: {
        '/': (context) => const FirstScreen(),
        '/config': (context) => const Config(),
        '/game': (context) => const KillTheBoss(title: appName),
      },
      title: appName,
      darkTheme: ThemeData.light(),
      theme: theme,
      // home: const KillTheBoss(
      //  title: appName,
      //)
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Image(image: AssetImage('img/title.png')),
          TextFormField(
          controller: myTextEditingController,
          decoration: const InputDecoration(
            labelText: 'please Enter your username',
          ),
        ),
              ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/game');
          },
          child: const Text('Launch game !'),
        ),

      ],
    )
    )
    );
  }
}

class Config extends StatelessWidget {
  const Config({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuration Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/game');
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}