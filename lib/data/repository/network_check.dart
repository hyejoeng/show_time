import 'package:flutter/services.dart';

// class NetworkCheck {
//   static const MethodChannel _channel = MethodChannel('com.example.network/check');
//
//   static Future<bool> isNetworkConnected() async {
//     final bool isConnected = await _channel.invokeMethod('isNetworkConnected');
//     return isConnected;
//   }
// }


class NetworkCheck {
  static const MethodChannel _channel = MethodChannel('com.yourcompany/network');

  static Future<bool> get isConnected async {
    final bool isConnected = await _channel.invokeMethod('isConnected');
    return isConnected;
  }
}