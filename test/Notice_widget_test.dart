import 'package:app/screens/Notice.dart'; // Update the import path if necessary
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('NoticeScreen UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: NoticeScreen(),
    ));

    // Wait for any animations or asynchronous operations to complete.
    await tester.pumpAndSettle();

    // Verify that the app bar has the correct title.
    expect(find.text('Notice'), findsOneWidget);

    // Verify that the body contains the expected text.
    expect(find.text('Empty'), findsOneWidget);
  });
}
