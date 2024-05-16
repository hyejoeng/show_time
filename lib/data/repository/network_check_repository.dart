import 'package:flutter/services.dart';

class NetworkCheckRepository {
  static const MethodChannel _channel = MethodChannel('com.yourcompany/network');

  Future<bool> getConnected() async {
    final bool isConnected = await _channel.invokeMethod('isConnected');
    return isConnected;
  }

  Future<void> openWifiSettings() async {
    try {
      final result = await _channel.invokeMethod('openWifiSettings');
      print(result);
    } on PlatformException catch (e) {
      print("Failed to Open Wifi Settings: '${e.message}'.");
      throw Exception("Failed to open Wifi Settings");
    }
  }
}