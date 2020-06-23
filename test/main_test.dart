import 'package:flutter_test/flutter_test.dart';
import 'package:handyclientapp/handy_theme/handy_theme.dart';
import 'package:handyclientapp/main.dart';

void main() {
  group('Main Widget', () {
    testWidgets('Ensure that HandyTheme is loaded ',
        (WidgetTester tester) async {
      //Act
      await tester.pumpWidget(HandyClient());
      //Assert
      expect(find.byType(HandyThemeWidget), findsOneWidget);
    });
  });
}
