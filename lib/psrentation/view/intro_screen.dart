// import 'package:flutter/material.dart';
//
// class IntroScreen extends StatefulWidget {
//   const IntroScreen({super.key});
//
//   @override
//   State<IntroScreen> createState() => _IntroScreenState();
// }
//
// class _IntroScreenState extends State<IntroScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Text('intro screen'),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> with SingleTickerProviderStateMixin {
  // 애니메이션 컨트롤러
  late AnimationController _controller;
  // 애니메이션
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // 애니메이션 컨트롤러 초기화
    _controller = AnimationController(
      duration: const Duration(seconds: 4), // 애니메이션 지속 시간
      vsync: this,
    );

    // 애니메이션 정의 (위치와 크기 변화)
    _animation = Tween<double>(begin: 0, end: 200).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut, // 쫀득한 효과
      ),
    )..addListener(() {
      setState(() {});
    });

    // 애니메이션 시작
    _controller.forward();
  }

  @override
  void dispose() {
    // 애니메이션 컨트롤러 정리
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // Transform을 사용하여 이미지의 위치 조정
          child: Transform.translate(
            offset: Offset(0, -_animation.value), // Y축으로 이동
            child: Container(
              // 이미지 크기 조절
              width: 100 + _animation.value,
              height: 100 + _animation.value,
              // 이미지 삽입
              child: Image.asset('assets/showtime_logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
