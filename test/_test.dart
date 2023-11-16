import 'package:app/screens/Registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/screens/Login.dart'; // Update this import based on your project structure

void main() {
  testWidgets('Login screen UI test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: LoginScreen(),
    ));

    // Verify that the logo is rendered
    expect(find.byType(Image), findsOneWidget);

    // Verify that the 'C C E' text is rendered
    expect(find.text('C C E'), findsOneWidget);

    // Verify that the 'Co-ordinate Community Engagement' text is rendered
    expect(find.text('Co-ordinate Community Engagement'), findsOneWidget);

    // Verify that the email and password fields are rendered
    expect(find.byType(TextFormField), findsNWidgets(2));

    // Verify that the login button is rendered
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Verify that the 'Forgot Password?' text is rendered
    expect(find.text('Forgot Password?'), findsOneWidget);

    // Verify that the 'Don't have an account? Sign Up' text is rendered
    expect(find.text("Don't have an account? "), findsOneWidget);
    expect(find.text('Sign Up '), findsOneWidget);

    // Tap the 'Sign Up' text and trigger a frame.
    // await tester.tap(find.text('Sign Up '));
    // await tester.pump();

    // // Verify that navigation to the registration screen happened
    // expect(find.byType(RegistrationScreen), findsOneWidget);
  });
}
