import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome'),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage('img/title.png')),
              Spacer(),
              ElevatedButton(
                style: TextButton.styleFrom(minimumSize: Size(200, 50)),
                onPressed: () {
                  Navigator.pushNamed(context, '/ktb');
                },
                child: const Text('play Guess the number!'),
              ),
              ElevatedButton(
                style: TextButton.styleFrom(minimumSize: Size(200, 50)),
                onPressed: () {
                  Navigator.pushNamed(context, '/game');
                },
                child: const Text('play Kill the boss !'),
              ),
              ElevatedButton(
                style: TextButton.styleFrom(minimumSize: Size(200, 50)),
                onPressed: () {
                  Navigator.pushNamed(context, '/scores');
                },
                child: Text('high scores'),
              ),
              ElevatedButton(
                style: TextButton.styleFrom(minimumSize: Size(200, 50)),
                onPressed: () {
                  Navigator.pushNamed(context, '/config');
                },
                child: const Text('settings'),
              ),
              Spacer(),
            ],
          ),
        )));
  }
}
