// Basic Flutter widget test for BullyButton app

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bullybutton/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: BullyButtonApp()));

    // Verify that the home screen loads
    expect(find.text('BullyButton'), findsOneWidget);
  });
}
