import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogWidget extends StatelessWidget {
  final String title;
  final String content;

  const DialogWidget({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            SystemNavigator.pop();
          },
          child: Text('확인'),
        )
      ],
    );
  }
}
