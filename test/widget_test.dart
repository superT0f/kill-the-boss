import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myapp/screens/scores.dart';
import 'package:myapp/screens/home.dart';

void main() {
  testWidgets('Score page has a back button', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scores()));
    expect(find.text('Go back!'), findsOneWidget);
  });

  testWidgets('Score page has two scores', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scores()));

    expect(find.text('Bob 42 Try'), findsOneWidget);
    expect(find.text('Clement 43 Try'), findsOneWidget);
  });

}
