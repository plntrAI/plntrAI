import 'package:flutter/material.dart';

class AuthorsScreen extends StatelessWidget {
  final String title;

  const AuthorsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: const Center(
      child: Text('Dashboard'),
    ),
  );
}