import 'package:flutter/material.dart';

class PlaygroundScreen extends StatefulWidget {
  final String title;

  const PlaygroundScreen({super.key, required this.title});

  @override
  State<PlaygroundScreen> createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends State<PlaygroundScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Playground'),
          ],
        ),
      ),
    );
  }
}
