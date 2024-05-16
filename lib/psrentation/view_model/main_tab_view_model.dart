import 'package:flutter/material.dart';
import 'package:show_time/data/repository/moive_repository.dart';
import 'package:show_time/data/repository/network_check_repository.dart';


class MainTabViewModel extends ChangeNotifier {
  final MovieRepository _movieRepository;
  final NetworkCheckRepository _networkCheckRepository;

  MainTabViewModel({required MovieRepository movieRepository, required NetworkCheckRepository networkCheckRepository}) : _movieRepository = movieRepository, _networkCheckRepository = networkCheckRepository;

  bool _isConnected = false;

  bool get isConnected => _isConnected;

  Future<void> updateConnected() async {
    _isConnected = await _networkCheckRepository.getConnected();
    notifyListeners();
  }

  Future<void> openWifiSettings() async {
    await _networkCheckRepository.openWifiSettings();
    updateConnected();
  }
}