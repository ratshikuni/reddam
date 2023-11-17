import 'package:app/screens/Home.dart'; // Adjust the import path accordingly
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HomeScreen UI test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: HomeScreen(),
    ));

    // Verify that the welcome text is displayed.
    expect(find.text('Welcome shoba'), findsOneWidget);

    // Verify that the total hours text is displayed.
    expect(find.text('Total hours : 50'), findsOneWidget);

    // Verify the presence of the Log Hours button.
    expect(find.text('Log Hours'), findsOneWidget);

    // Verify the presence of the WeekCalendar.
    expect(find.byType(WeekCalendar), findsOneWidget);

    // Verify the presence of the Teachers and Activities card.
    expect(find.text('Teachers and Activities'), findsOneWidget);
  });
}
