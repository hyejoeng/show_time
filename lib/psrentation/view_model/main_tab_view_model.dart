import 'package:flutter/material.dart';
import 'package:show_time/data/repository/moive_repository.dart';

import '../../data/repository/network_check.dart';

class MainTabViewModel extends ChangeNotifier {
  final MovieRepository _movieRepository;

  MainTabViewModel({required MovieRepository movieRepository}) : _movieRepository = movieRepository;

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