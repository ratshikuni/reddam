import 'package:app/screens/LogHrs.dart'; // Replace with the correct import path
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LogHrs screen renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: LogHrs(),
    ));

    // Verify that the screen renders correctly.
    expect(find.text('Log Hours'), findsOneWidget);
    expect(find.byType(MyRadios), findsOneWidget);
    expect(find.byType(DropdownWidget), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('Selecting radio button updates UI', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: LogHrs(),
    ));

    // Tap on the 'Active Time' radio button.
    await tester.tap(find.text('Active Time'));
    await tester.pump();

    // Verify that the UI updates accordingly.
    expect(find.byType(DropdownWidget), findsOneWidget);
    expect(find.text('Enter Slip Number'), findsOneWidget);
  });

  testWidgets('Tapping on Select File opens file picker',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: LogHrs(),
    ));

    // Tap on the 'Select File' container.
    await tester.tap(
      find.text('Select File'),
      warnIfMissed: false,
    );
    await tester.pump();
  });
}
