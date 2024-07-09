import 'package:flutter/material.dart';

import '../main.dart';

class Config extends StatelessWidget {
  const Config({super.key});

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
            TextFormField(
              controller: myTextEditingController,
              decoration: const InputDecoration(
                labelText: 'please Enter your username',
              ),
            ),

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