import 'dart:async';

import 'package:flutter/material.dart';
import 'package:show_time/psrentation/view/profile_screen/all_profile_screen.dart';
import 'package:show_time/psrentation/view/profile_screen/not_profile_screen.dart';
import 'package:show_time/psrentation/view_model/main_tab_view_model.dart';
import 'package:show_time/psrentation/view_model/profile_view_model.dart';

import '../../utils/color.dart';
import '../../utils/context_utils.dart';

class IntroScreen extends StatefulWidget {
  final ProfileViewModel profileViewModel;
  final MainTabViewModel mainTabViewModel;

  const IntroScreen({super.key, required this.profileViewModel, required this.mainTabViewModel});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  bool _opacity = true;

  @override
  void initState() {
    super.initState();

    _initAnimated();
  }

  void _initAnimated() async {
    await widget.profileViewModel.updateGetProfile();

    Timer(Duration(seconds: 2), () {
      setState(() {
        _opacity = !_opacity;
      });

      if (!_opacity) {
        Timer(Duration(seconds: 2), () {
          if (widget.profileViewModel.profileList.isEmpty) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NotProfileScreen()));
          } else {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AllProfileScreen(mainTabViewModel: widget.mainTabViewModel, profileViewModel: widget.profileViewModel,)));
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: screenSizeWidth(context),
          height: screenSizeHeight(context),
          child: AnimatedOpacity(
            opacity: _opacity ? 0.0 : 1.0,
            duration: Duration(seconds: 2),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    width: screenSizeWidth(context),
                    height: screenSizeHeight(context) * 0.15,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
                      color: worldSkillsLogoColor,
                    ),
                    child: Image.asset('assets/world_skills_logo.png', width: screenSizeWidth(context) * 0.7),
                  ),
                ),
                Positioned(
                  child: Container(
                    width: screenSizeWidth(context),
                    height: screenSizeHeight(context),
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      maxRadius: screenSizeWidth(context) * 0.35,
                      child: Image.asset(
                        'assets/showtime_logo.png',
                        width: screenSizeWidth(context) * 0.5,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
