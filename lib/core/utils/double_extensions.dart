import 'package:flutter/material.dart';

extension BorderRadiusExtensions on double {
  BorderRadius get circular => BorderRadius.circular(this);

  BorderRadius get topCircular => BorderRadius.vertical(top: Radius.circular(this));
  BorderRadius get bottomCircular => BorderRadius.vertical(bottom: Radius.circular(this));
  BorderRadius get verticalCircular => BorderRadius.vertical(top: Radius.circular(this),bottom: Radius.circular(this));
  
  BorderRadius get leftCircular => BorderRadius.horizontal(left: Radius.circular(this));
  BorderRadius get rightCircular => BorderRadius.horizontal(right: Radius.circular(this));
  BorderRadius get horizontalCircular => BorderRadius.horizontal(left: Radius.circular(this),right: Radius.circular(this));
}