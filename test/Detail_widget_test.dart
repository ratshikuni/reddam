import 'package:app/screens/Detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DetailScreen UI test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: DetailScreen(id: null,),
    ));

    // Verify that the image is displayed.
    expect(find.byType(Image), findsOneWidget);

    // Verify the presence of the dropdowns.
    expect(find.text('Select Grade'), findsOneWidget);
    expect(find.text('Select Class'), findsOneWidget);
    expect(find.text('Select House'), findsOneWidget);

    // Verify the presence of the submit button.
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Tap the submit button and trigger a frame.
    await tester.tap(find.text(' Submit '));
    await tester.pump();

    // You can add more test cases as needed based on your UI.
  });
}
