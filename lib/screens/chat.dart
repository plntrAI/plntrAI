import 'package:flutter/material.dart';

import '../widgets/chat.dart';
import '../widgets/api_key.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.title});

  final String title;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String? apiKey =
      'AIzaSyD5IkhK2M_63AKWbSEVt9jZNRgeZKhVdSI'; // replace 'your-api-key-here' with your actual API key

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text(
                  'Development build: changes are not final and subject to change'),
            ),
            ListTile(
              title: const Text('Dashboard'),
              leading: const Icon(Icons.dashboard),
              selected: _selectedIndex == 0,
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Converse'),
              leading: const Icon(Icons.auto_awesome),
              selected: _selectedIndex == 1,
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
      body: switch (apiKey) {
        final providedKey? => ChatWidget(apiKey: providedKey),
        _ => ApiKeyWidget(onSubmitted: (key) {
          setState(() => apiKey = key);
        }),
      },
    );
  }
}
