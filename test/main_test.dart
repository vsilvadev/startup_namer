// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:startup_namer/main.dart';

void main() {
  testWidgets(
    'Should render the app',
    (tester) async {
      await tester.pumpWidget(const MyApp());
      final titleFinder = find.text('Startup Name Generator');

      expect(titleFinder, findsOneWidget);
    },
  );

  testWidgets(
    'Should enter in the favorites list screen when click on the list IconButton',
    (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();

      expect(find.text('Saved Suggestions'), findsOneWidget);
    },
  );
}
