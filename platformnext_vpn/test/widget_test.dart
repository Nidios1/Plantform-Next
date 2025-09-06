import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:platformnext_vpn/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('Platform Next'), findsOneWidget);
    expect(find.text('Disconnected'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.play_arrow));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Connected'), findsOneWidget);
  });
}
