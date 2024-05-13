import 'package:flutter/cupertino.dart';

extension IntExtension on int? {
  int validate({int value = 0}) {
    return this ?? value;
  }

  Widget get sizeBoxHeight => SizedBox(height: this?.toDouble());
  Widget get sizeBoxWidth => SizedBox(width: this?.toDouble());
}

double screenSizeWidth(BuildContext context) => MediaQuery.sizeOf(context).width;
double screenSizeHeight(BuildContext context) => MediaQuery.sizeOf(context).height;