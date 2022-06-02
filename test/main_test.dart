import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:startup_namer/main.dart';

void main() {
  testWidgets(
    'Should pass the splash screen',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: AppWidget()));
      await tester.pumpAndSettle(const Duration(seconds: 7));

      final titleFinder = find.text('Startup Name Generator');

      expect(titleFinder, findsOneWidget);
    },
  );
}
