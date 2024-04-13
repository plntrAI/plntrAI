import 'dart:convert';

import 'package:http/http.dart' as http;

class ArduinoService {
  final String deviceId = 'your-device-id';
  final String moistureSensorId = 'your-moisture-sensor-id';
  final String pumpId = 'your-pump-id';
  final String token = 'your-token';
  final String baseUrl = 'https://api2.arduino.cc/iot/v1';

  Future<Map<String, dynamic>> getMoistureData() async {
    final response = await http.get(
      Uri.parse('$baseUrl/devices/$deviceId/sensors/$moistureSensorId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load moisture data');
    }
  }

  Future<void> turnOnPump() async {
    final response = await http.put(
      Uri.parse('$baseUrl/devices/$deviceId/properties/$pumpId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'value': true}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to turn on pump');
    }
  }
}
