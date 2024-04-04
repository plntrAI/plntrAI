// Copyright 2024 the Dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license
// that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/chat.dart';

void main() {
  runApp(const GenerativeAISample());
}

class GenerativeAISample extends StatelessWidget {
  const GenerativeAISample({super.key});
  final MaterialTheme materialTheme = const MaterialTheme(TextTheme());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'plntrAI',
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      home: const ChatScreen(title: 'plntrAI'),
    );
  }
}
