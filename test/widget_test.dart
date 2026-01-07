// 📚 CONCEPT FLUTTER: Widget Testing
// Les tests de widgets vérifient que l'UI se comporte correctement

import 'package:flutter_test/flutter_test.dart';
import 'package:imc_app/main.dart';

void main() {
  testWidgets('BMI Calculator app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const BMICalculatorApp());

    // Verify that the title is displayed
    expect(find.text('BMI CALCULATOR'), findsOneWidget);
    
    // Verify that gender selection cards are present
    expect(find.text('MALE'), findsOneWidget);
    expect(find.text('FEMALE'), findsOneWidget);
    
    // Verify that the calculate button is present
    expect(find.text('CALCULATE'), findsOneWidget);
  });
}

