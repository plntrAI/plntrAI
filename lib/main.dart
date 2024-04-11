import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    const MaterialTheme materialTheme = MaterialTheme(TextTheme());

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ));

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'plntrAI',
      themeMode: themeMode,
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      home: HomeScreen(
        useLightMode: useLightMode,
        handleBrightnessChange: handleBrightnessChange,
      ),
    );
  }
}