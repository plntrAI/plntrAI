import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final String title;

  const DashboardScreen({super.key, required this.title});

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