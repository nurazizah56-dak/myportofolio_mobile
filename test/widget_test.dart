import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

void main() {
  testWidgets('MyApp renders home page smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(apiClient: ApiClient()));
    // Just verify the app starts without crashing
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
