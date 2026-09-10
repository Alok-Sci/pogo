import 'package:flutter/material.dart';

extension GapExtensions on num {
  Widget get gap => SizedBox(height: toDouble(), width: toDouble());
  Widget get vGap => SizedBox(height: toDouble());
  Widget get hGap => SizedBox(width: toDouble());
}

extension ShortNumberStringExtensions on num {
  String get toShortString {
    if (this < 1000) return toStringAsFixed(0);
    if (this < 1000000) return '${(this / 1000).toStringAsFixed(1)}K';
    if (this < 1000000000) return '${(this / 1000000).toStringAsFixed(1)}M';
    return '${(this / 1000000000).toStringAsFixed(1)}B';
  }
}