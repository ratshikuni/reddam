import 'package:app/screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Login screen renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // To find all the widgets on the screen or UI
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    // typical user login interaction.
    await tester.enterText(
        find.byType(TextFormField).first, 'testuser@example.com');
    await tester.enterText(find.byType(TextFormField).last, 'testpassword');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
  });
}
