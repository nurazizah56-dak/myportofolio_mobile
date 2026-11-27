import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/models/education.dart';
import 'package:myportofolio_mobile/screens/education_detail_screen.dart';
import 'package:myportofolio_mobile/screens/education_list_screen.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

class MockApiClient extends Fake implements ApiClient {
  @override
  Future<List<Education>> getEducations() async {
    return [
      const Education(
        id: '1',
        institutionName: 'Universitas Indonesia',
        degree: 'Bachelor (S1)',
        location: 'Depok',
        startYear: 2022,
        endYear: 2026,
        isOngoing: false,
      ),
    ];
  }
}

void main() {
  testWidgets('In-App Back: Home → List → Detail → List → Home',
      (WidgetTester tester) async {
    final mockClient = MockApiClient();
    await tester.pumpWidget(MyApp(apiClient: mockClient));
    await tester.pumpAndSettle();

    // 1. Verify on Home
    expect(find.byType(MyHomePage), findsOneWidget);

    // 2. Home → List
    await tester.tap(find.text('View Education'));
    await tester.pumpAndSettle();
    expect(find.byType(EducationListScreen), findsOneWidget);

    // 3. List → Detail
    await tester.tap(find.text('Universitas Indonesia'));
    await tester.pumpAndSettle();
    expect(find.byType(EducationDetailScreen), findsOneWidget);

    // 4. In-App Back (AppBar ← button): Detail → List
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
    expect(find.byType(EducationListScreen), findsOneWidget);
    expect(find.byType(EducationDetailScreen), findsNothing);

    // 5. In-App Back (AppBar ← button): List → Home
    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();
    expect(find.byType(MyHomePage), findsOneWidget);
    expect(find.byType(EducationListScreen), findsNothing);
  });

  testWidgets('GoRouter context.pop() (Browser Back equivalent): Detail → List → Home',
      (WidgetTester tester) async {
    final mockClient = MockApiClient();
    await tester.pumpWidget(MyApp(apiClient: mockClient));
    await tester.pumpAndSettle();

    expect(find.byType(MyHomePage), findsOneWidget);

    // Home → List → Detail
    await tester.tap(find.text('View Education'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Universitas Indonesia'));
    await tester.pumpAndSettle();
    expect(find.byType(EducationDetailScreen), findsOneWidget);

    // Browser Back equivalent: context.pop() — Detail → List
    final ctx = tester.element(find.byType(EducationDetailScreen));
    GoRouter.of(ctx).pop();
    await tester.pumpAndSettle();
    expect(find.byType(EducationListScreen), findsOneWidget);
    expect(find.byType(EducationDetailScreen), findsNothing);

    // Browser Back equivalent: context.pop() — List → Home
    final ctx2 = tester.element(find.byType(EducationListScreen));
    GoRouter.of(ctx2).pop();
    await tester.pumpAndSettle();
    expect(find.byType(MyHomePage), findsOneWidget);
    expect(find.byType(EducationListScreen), findsNothing);
  });

  testWidgets('Dialog dismissal does not corrupt navigation stack',
      (WidgetTester tester) async {
    final mockClient = MockApiClient();
    await tester.pumpWidget(MyApp(apiClient: mockClient));
    await tester.pumpAndSettle();

    // Home → List
    await tester.tap(find.text('View Education'));
    await tester.pumpAndSettle();
    expect(find.byType(EducationListScreen), findsOneWidget);

    // Show dialog
    final ctx = tester.element(find.byType(EducationListScreen));
    showDialog(
      context: ctx,
      builder: (dialogCtx) => AlertDialog(
        title: const Text('Test Dialog'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx),
            child: const Text('OK'),
          ),
        ],
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Test Dialog'), findsOneWidget);

    // Dismiss dialog
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
    expect(find.text('Test Dialog'), findsNothing);

    // List masih ada (stack tidak rusak setelah dialog)
    expect(find.byType(EducationListScreen), findsOneWidget);

    // Browser Back: List → Home masih berfungsi
    GoRouter.of(ctx).pop();
    await tester.pumpAndSettle();
    expect(find.byType(MyHomePage), findsOneWidget);
    expect(find.byType(EducationListScreen), findsNothing);
  });
}
