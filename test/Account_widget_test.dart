import 'package:app/screens/Account.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Account screen renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const Account());

    // Verify that the title text is displayed.
    expect(find.text('John Doe'), findsOneWidget);

    // Verify that the Personal Details section is rendered.
    expect(find.text('Personal Details'), findsOneWidget);
    expect(find.text('Full Name: John Doe'), findsOneWidget);
    expect(find.text('Grade: 10'), findsOneWidget);
    expect(find.text('Class: A'), findsOneWidget);
    expect(find.text('House: Gryffindor'), findsOneWidget);

    // Verify that the Progress section is rendered.
    expect(find.text('Progress'), findsOneWidget);
    expect(find.text('Prefect'), findsOneWidget);
    expect(find.text('480/600HRS'), findsOneWidget);
    expect(find.text('Colours'), findsOneWidget);
    expect(find.text('50/250HRS'), findsOneWidget);

    // Verify that the Historical Hours section is rendered.
    expect(find.text('Historical Hours'), findsOneWidget);
    expect(find.byType(charts.BarChart), findsOneWidget);
  });
}
