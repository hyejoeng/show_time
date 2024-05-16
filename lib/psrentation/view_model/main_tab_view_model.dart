import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:show_time/data/repository/moive_repository.dart';

import '../../data/repository/network_check_repository.dart';

class MainTabViewModel extends ChangeNotifier {
  final MovieRepository _movieRepository;

  MainTabViewModel({required MovieRepository movieRepository}) : _movieRepository = movieRepository;

  bool _isVisible = true;


  bool get isVisible => _isVisible;

  // wifi 연결확인
  static const MethodChannel _channel = MethodChannel('com.yourcompany/network');

  static Future<bool> get isConnected async {
    final bool isConnected = await _channel.invokeMethod('isConnected');
    return isConnected;
  }

  // MethodChannel 생성
  static const platform = MethodChannel('com.yourcompany/network');

  Future<void> openWifiSettings() async {
    try {
      final result = await platform.invokeMethod('openWifiSettings');
      print(result);
    } on PlatformException catch (e) {
      print("Failed to Open Wifi Settings: '${e.message}'.");
    }
  }

  // NetworkCheck.isConnected.then((isConnected) {
  // if (isConnected) {
  // print("네트워크에 연결되어 있습니다");
  // } else {
  // print("네트워크에 연결되어 있지 않습니다");
  // }
  // });


// bool _isConnected = false;
  //
  // bool get isConnected => _isConnected;
  //
  // void checkNetwork() async {
  //   _isConnected = await NetworkCheck.isNetworkConnected();
  //   notifyListeners();
  // }

  // void checkNetworkAndNavigate(BuildContext context) async {
  //   bool isConnected = await NetworkCheck.isNetworkConnected();
  //   if (isConnected) {
  //     // 네트워크 연결 됨
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => ConnectedScreen()),
  //     );
  //   } else {
  //     // 네트워크 연결 안됨
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => NoNetworkScreen()),
  //     );
  //   }
  // }
}