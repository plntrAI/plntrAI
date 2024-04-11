import 'package:flutter/material.dart';

import 'screens/home.dart';

import 'theme.dart';

void main() {
  runApp(const App());
}
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeMode themeMode = ThemeMode.system;

  bool get useLightMode => switch (themeMode) {
    ThemeMode.system =>
    View.of(context).platformDispatcher.platformBrightness ==
        Brightness.light,
    ThemeMode.light => true,
    ThemeMode.dark => false
  };

  void handleBrightnessChange(bool useLightMode) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'plntrAI',
      themeMode: themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomeScreen(
        useLightMode: useLightMode,
        handleBrightnessChange: handleBrightnessChange,
      ),
    );
  }
}