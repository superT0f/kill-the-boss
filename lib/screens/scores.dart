import 'package:flutter/material.dart';


class Scores extends StatelessWidget {
  const Scores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuration Screen'),
      ),
      body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text('Bob 2 Try'),
              Text('Clement 4 Try'),


            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}