import 'package:flutter/material.dart';

import '../services/arduino_service.dart';

class DashboardScreen extends StatefulWidget {
  final String title;

  const DashboardScreen({super.key, required this.title});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ArduinoService arduinoService = ArduinoService();
  Future<Map<String, dynamic>>? moistureData;
  bool isPumpOn = false;
  double pumpTime = 0.0; // New state variable for pump time

  @override
  void initState() {
    super.initState();
    moistureData = arduinoService.getMoistureData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<Map<String, dynamic>>(
              future: moistureData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Card(
                    // New Card widget for moisture percentage
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Text('Moisture'),
                          Text('${snapshot.data!['value']}%'),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
            SwitchListTile(
              title: const Text('Pump Control'),
              value: isPumpOn,
              onChanged: (bool value) {
                setState(() {
                  isPumpOn = value;
                  if (isPumpOn) {
                    arduinoService.turnOnPump();
                  }
                });
              },
            ),
            Slider(
              value: pumpTime,
              min: 0,
              max: 60,
              divisions: 12,
              label: '$pumpTime seconds',
              onChanged: (double value) {
                setState(() {
                  pumpTime = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
