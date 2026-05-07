import 'package:ceylon_tours_pro/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App renders role selection screen', (WidgetTester tester) async {
    await tester.pumpWidget(const CeylonToursApp());
    expect(find.text('Ceylon Tours Pro'), findsOneWidget);
    expect(find.text('Driver / Guide'), findsOneWidget);
    expect(find.text('Guest / Tourist'), findsOneWidget);
  });
}
