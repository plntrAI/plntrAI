import 'package:flutter/material.dart';

import '../screens/chat.dart';
import '../screens/dashboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.useLightMode,
    required this.handleBrightnessChange,
    required this.handleThemeChange,
  });

  final bool useLightMode;
  final void Function(bool useLightMode) handleBrightnessChange;
  final void Function(bool useDynamic) handleThemeChange;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class SettingsDialog extends StatefulWidget {
  final void Function(bool useLightMode) handleBrightnessChange;
  final void Function(bool useDynamic) handleThemeChange;

  const SettingsDialog(
      {super.key,
      required this.handleBrightnessChange,
      required this.handleThemeChange});

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  String _color = 'System';
  String _theme = 'System';
  final List<String> _colors = ['System', 'Default'];
  final List<String> _themes = ['System', 'Light', 'Dark'];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Settings'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'App Theme',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          ..._colors.map((String theme) {
            // Add this block
            return Align(
              alignment: Alignment.centerLeft,
              child: RadioListTile<String>(
                title: Text(theme),
                value: theme,
                groupValue: _color,
                onChanged: (String? value) {
                  setState(() {
                    _color = value!;
                  });
                  widget.handleThemeChange(_color == 'System');
                },
              ),
            );
          }),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Dark mode preference',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          ..._themes.map((String theme) {
            return Align(
              alignment: Alignment.centerLeft,
              child: RadioListTile<String>(
                title: Text(theme),
                value: theme,
                groupValue: _theme,
                onChanged: (String? value) {
                  setState(() {
                    _theme = value!;
                  });
                  ThemeMode mode;
                  switch (_theme) {
                    case 'Light':
                      mode = ThemeMode.light;
                      break;
                    case 'Dark':
                      mode = ThemeMode.dark;
                      break;
                    default:
                      mode = ThemeMode.system;
                  }
                  widget.handleBrightnessChange(mode == ThemeMode.light);
                },
              ),
            );
          }),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
            // Here you can handle the selected options
            // For example, you can save them to shared preferences
          },
        ),
      ],
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final _pageOptions = [
    const ChatScreen(title: 'Chat'),
    const DashboardScreen(title: 'Dashboard'),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: AppBar(
        title: const Text('plntrAI'),
        centerTitle: true,
        // scrolledUnderElevation: 0,
        // shadowColor: Theme.of(context).colorScheme.shadow,
        primary: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => SettingsDialog(
                  handleBrightnessChange: widget.handleBrightnessChange,
                  handleThemeChange: widget.handleThemeChange,
                ),
              );
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.chat_outlined),
              title: const Text('Chat'),
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.dashboard_outlined),
              title: const Text('Dashboard'),
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: _pageOptions[_selectedIndex],
      ),
    );
  }
}
