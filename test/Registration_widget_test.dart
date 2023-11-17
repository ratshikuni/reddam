import 'package:app/screens/Registration.dart'; // Assuming the file is named RegistrationScreen.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Registration screen widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: RegistrationScreen(),
    ));

    // Verify that the text fields are rendered.
    expect(find.text('First Name'), findsOneWidget);
    expect(find.text('Last Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Confirm Password'), findsOneWidget);

    // Test validation by submitting an empty form.
    await tester.tap(find.text('Sign Up'));
    await tester.pump();
    expect(find.text('First Name'), findsOneWidget);
    expect(find.text('Last Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Confirm Password'), findsOneWidget);

    // Fill in the form with valid data.
    await tester.enterText(find.byType(TextFormField).at(0), 'John');
    await tester.enterText(find.byType(TextFormField).at(1), 'Doe');
    await tester.enterText(
        find.byType(TextFormField).at(2), 'john.doe@example.com');
    await tester.enterText(find.byType(TextFormField).at(3), 'password');
    await tester.enterText(find.byType(TextFormField).at(4), 'password');
    await tester.tap(
      find.text('Sign Up'),
      warnIfMissed: false,
    );
    await tester.pump();
  });
}
