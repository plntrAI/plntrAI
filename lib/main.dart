// Copyright 2024 the Dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license
// that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:plntrai/screens/home.dart';
import 'theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  final MaterialTheme materialTheme = const MaterialTheme(TextTheme());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'plntrAI',
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      home: const HomeScreen(),
    );
  }
}
