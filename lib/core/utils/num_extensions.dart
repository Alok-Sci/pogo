import 'package:flutter/material.dart';

extension GapExtensions on num {
  Widget get gap => SizedBox(height: toDouble(), width: toDouble());
  Widget get vGap => SizedBox(height: toDouble());
  Widget get hGap => SizedBox(width: toDouble());
}
