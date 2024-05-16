import 'package:flutter/material.dart';
import 'package:show_time/data/repository/profile_reposotory.dart';
import 'package:show_time/psrentation/view/intro_screen.dart';
import 'package:show_time/psrentation/view/tab_screen/download_screen.dart';
import 'package:show_time/psrentation/view_model/main_tab_view_model.dart';
import 'package:show_time/psrentation/view_model/profile_view_model.dart';
import 'package:show_time/utils/color.dart';

import 'data/repository/moive_repository.dart';
import 'data/repository/network_check_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final mainTabViewModel = MainTabViewModel(movieRepository: MovieRepository(), networkCheckRepository: NetworkCheckRepository());
    final profileViewModel = ProfileViewModel(profileRepository: ProfileRepository());

    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
        scaffoldBackgroundColor: bgColor,
        textTheme: TextTheme(
          bodySmall: TextStyle(fontSize: 14, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: IntroScreen(profileViewModel: profileViewModel, mainTabViewModel: mainTabViewModel),
    );
  }
}

