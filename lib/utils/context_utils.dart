import 'package:flutter/cupertino.dart';

extension IntExtension on int? {
  int validate({int value = 0}) {
    return this ?? value;
  }

  Widget get KH => SizedBox(height: this?.toDouble());
  Widget get KW => SizedBox(width: this?.toDouble());
}

