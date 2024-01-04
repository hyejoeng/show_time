import 'package:flutter/material.dart';
import 'package:show_time/presentation/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Container(
                    height: screensize(context).height,
                    width: screensize(context).width,
                    color: Color(0xff080E1E),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    width: screensize(context).width,
                    height: screensize(context).height * 0.15,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xffEDECEA),
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(25))),
                    child: Image.asset(
                      'asset/images/worldSkills_logo.png',
                      width: screensize(context).width * 0.7,
                    ),
                  ),
                ),
                Positioned(
                  top: screensize(context).height * 0.3,
                  child: Container(
                    width: screensize(context).width * 0.7,
                    height: screensize(context).height * 0.3,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(9999),
                      color: Colors.white.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                Positioned(child: Image.asset(
                  'asset/images/showTime_logo.png',
                  alignment: Alignment.center,
                  width: screensize(context).width * 0.5,
                ),),
              ],
            ),
          ),
        ),
      );
}

// child: Stack(
// children: [
// Positioned(
// height: screensize(context).height * 0.3,
// child: Container(
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// color: Colors.white.withOpacity(0.3),
// ),
// )),
// ],
// ),
