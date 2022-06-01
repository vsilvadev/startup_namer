import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:startup_namer/pages/home/home_page.dart';

void main() {
  testWidgets(
    'Should render the app',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      final titleFinder = find.text('Startup Name Generator');

      expect(titleFinder, findsOneWidget);
    },
  );

  testWidgets(
    'Should enter in the favorites list screen when click on the list IconButton',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      await tester.tap(find.byTooltip('Saved Suggestions'));
      await tester.pumpAndSettle();

      expect(find.text('Saved Suggestions'), findsOneWidget);
    },
  );
}
