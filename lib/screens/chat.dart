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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
