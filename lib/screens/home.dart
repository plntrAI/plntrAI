import 'package:flutter/material.dart';

import '../screens/chat.dart';
import '../screens/dashboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({super.key});

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
          const Divider(),
          Text(
            'Theme',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          ..._colors.map((String color) {
            return RadioListTile<String>(
              title: Text(color),
              value: color,
              groupValue: _color,
              onChanged: (String? value) {
                setState(() {
                  _color = value!;
                });
              },
            );
          }),
          Text(
            'Dark mode preference',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          ..._themes.map((String theme) {
            return RadioListTile<String>(
              title: Text(theme),
              value: theme,
              groupValue: _theme,
              onChanged: (String? value) {
                setState(() {
                  _theme = value!;
                });
              },
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
              Icons.settings_outlined,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => const SettingsDialog(),
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
