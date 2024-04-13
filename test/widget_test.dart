import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:plntrai/screens/home.dart';

void main() {
  final mockHandleBrightnessChange = (bool useLightMode) {};
  final mockHandleThemeChange = (bool useDynamic) {};

  testWidgets('HomeScreen can be created', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: HomeScreen(
        useLightMode: true,
        handleBrightnessChange: mockHandleBrightnessChange,
        handleThemeChange: mockHandleThemeChange,
      ),
    ));

    expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('SettingsDialog can be created', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SettingsDialog(
          handleBrightnessChange: mockHandleBrightnessChange,
          handleThemeChange: mockHandleThemeChange,
        ),
      ),
    ));

    expect(find.byType(SettingsDialog), findsOneWidget);
  });
}
