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
      widget.mainTabViewModel.addListener(updateScreen);
    });
  }





  // void checkNetworkAndNavigate(BuildContext context) async {
  //   bool isConnected = await NetworkCheck.isNetworkConnected();
  //
  //   if (isConnected) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => Scaffold(body: Center(child: Text('네트워크 연결 됨')),)),
  //     );
  //   } else {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => Scaffold(body: Center(child: Text('네트워크 연결 안됨')),)),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Text('다운로드 페이지')
      ),
    );
  }

  Widget _connectedWifi() => SizedBox(

  );

  Widget _noConnectedWifi() => SizedBox(
    child: Center(
      child: ElevatedButton(
        onPressed: widget.mainTabViewModel.openWifiSettings,
        child: Text('Open Wifi Settings'),
      ),
    ),
  );

}
