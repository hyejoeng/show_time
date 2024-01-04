import 'package:flutter/material.dart';
import 'package:show_time/presentation/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.transparent,
            child: Column(
              children: [
                Container(
                  width: screensize(context).width,
                  height: screensize(context).height * 0.15,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(15))),
                  child: Image.asset('asset/images/worldSkills_logo.png', width: screensize(context).width * 0.7,),
                ),
              ],
            ),
          ),
        ),
      );
}
