import 'package:flutter/material.dart';

class Scores extends StatelessWidget {
  const Scores({super.key});

  List<Widget> getScore() {
    return <Widget>[
      Text('Bob 42 Try'),
      Text('Clement 43 Try'),
    ];
  }

  List<Widget> addElementToList(List<Widget> myList, Widget newElement) {
    myList.add(newElement);
    return myList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Score'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: addElementToList(
              getScore(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Text('Go back!'),
              )),
        ),
      ),
    );
  }
}
