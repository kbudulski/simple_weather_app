import 'package:flutter_test/flutter_test.dart';
import 'package:simple_weather_app/app/simple_weather_app.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const SimpleWeatherApp());
  });
}
