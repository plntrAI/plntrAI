import 'package:flutter/material.dart';

import '../screens/chat.dart';
import '../screens/dashboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class SettingsDialog extends StatefulWidget {
  @override
  _SettingsDialogState createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  String _color = 'default';
  String _theme = 'system';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Settings'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButton<String>(
            value: _color,
            items: ['default', 'system'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _color = newValue!;
              });
            },
          ),
          DropdownButton<String>(
            value: _theme,
            items: ['dark', 'light', 'system'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _theme = newValue!;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text('OK'),
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
                builder: (BuildContext context) => SettingsDialog(),
              );
            },
          )        ],
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
