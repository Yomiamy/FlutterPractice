import 'package:flutter/animation.dart';

class TypeTween extends Tween<String> {

  TypeTween({String super.begin = '', super.end});

  @override
  String lerp(double t) {
    final endStringLength = end?.length ?? 0;
    final cutPosition = (endStringLength * t).round();
    final displayedText = end?.substring(0, cutPosition) ?? '';

    return displayedText;
  }
}