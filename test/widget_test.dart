import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_design_system/main.dart';

void main() {
  testWidgets('Design system showcase smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const DesignSystemApp());

    // Verify that the showcase title is present.
    expect(find.text('DESIGN SYSTEM v1.1'), findsOneWidget);
    expect(find.text('Visual Spec'), findsOneWidget);
  });
}
