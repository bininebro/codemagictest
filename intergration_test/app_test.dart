import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testflutt/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    "Not inputting a text and wanting to go to the display page shows"
    "an error and prevent form going to the display page.",
    (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle(); // for waiting
      expect(find.byType((TypingPage)), findsOneWidget);
      expect(find.byType((DisplayPage)), findsNothing);
      expect(find.text('Input at least one character'), findsOneWidget);
    },
  );
  testWidgets(
      "After inputting a text, go to the display page which that some text"
      "and the navigate back to the typing page where the input should be clear",
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    final inputText = 'Hello there, this is an input.';

    await tester.enterText(find.byKey(Key('your-text-field')), inputText);
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle(); // for waiting to next page

    expect(find.byType((TypingPage)), findsNothing);
    expect(find.byType((DisplayPage)), findsOneWidget);
    expect(find.text(inputText), findsOneWidget);

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    expect(find.byType((TypingPage)), findsOneWidget);
    expect(find.byType((DisplayPage)), findsNothing);
    expect(find.text(inputText), findsNothing);
  });
}
