import 'package:flutter_test/flutter_test.dart';
import 'package:shakeit_recipes/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const ShakeItApp());
    expect(find.text('Home'), findsOneWidget);
  });
}