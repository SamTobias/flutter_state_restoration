import 'package:flutter/material.dart';
import 'package:flutter_state_restoration/src/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter state restoration test', (WidgetTester tester) async {
    // Build app and trigger a frame
    await tester.pumpWidget(const App());

    // Navigate to second page
    await tester.tap(find.text('With state restoration'));
    await tester.pumpAndSettle();

    // Verify that counter starts at 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that counter has incremented
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    // Force app restart and restore state
    await tester.restartAndRestore();

    // Verify that counter state is restored
    expect(find.text('1'), findsOneWidget);
  });
}
