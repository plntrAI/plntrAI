import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final String title;

  const DashboardScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) => const Scaffold(
    body: Center(
      child: Text('Dashboard'),
    ),
  );
}