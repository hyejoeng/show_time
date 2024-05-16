import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:show_time/psrentation/view_model/main_tab_view_model.dart';

import '../../../data/repository/network_check_repository.dart';


class DownloadScreen extends StatefulWidget {
  final MainTabViewModel mainTabViewModel;

  const DownloadScreen({super.key, required this.mainTabViewModel});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      widget.mainTabViewModel.updateConnected();

      widget.mainTabViewModel.addListener(updateScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isConnected = widget.mainTabViewModel.isConnected;

    return SafeArea(
      child: Scaffold(
        body: isConnected ? _connectedWifi() : _noConnectedWifi(),
      ),
    );
  }

  Widget _connectedWifi() => SizedBox.expand(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('다운로드 가능한 영화가 없습니다.'),
              Text('다운로드 등록 후 이용하세요.'),
            ],
          ),
        ),
      );

  Widget _noConnectedWifi() => SizedBox.expand(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.wifi_off),
              Text('WIFI가 꺼져 있습니다.'),
              Text('WIFI 연결 후 이용해주세요.'),
              ElevatedButton(
                onPressed: widget.mainTabViewModel.openWifiSettings,
                child: Text('WIFI 설정하기'),
              ),
            ],
          ),
        ),
      );
}