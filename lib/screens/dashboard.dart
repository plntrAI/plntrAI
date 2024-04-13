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

  @override
  void initState() {
    super.initState();
    moistureData = arduinoService.getMoistureData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
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
                  return Text('Moisture: ${snapshot.data!['value']}');
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
          ],
        ),
      ),
    );
  }
}
