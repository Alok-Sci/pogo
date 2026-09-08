import 'package:flutter/material.dart';

abstract class AppTextStyles {
  AppTextStyles._();

  static const String _family = 'MonaSans';

  static const TextStyle displayHuge = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w800,
    fontSize: 60,
    height: 62 / 60,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w800,
    fontSize: 20,
    height: 1.0,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 1.0,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w700,
    fontSize: 18,
    height: 1.0,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 1.0,
  );

  static const TextStyle titleItalic12 = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    fontSize: 12,
    height: 1.0,
  );


  static const TextStyle labelBold14 = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 1.0,
  );

  static const TextStyle labelBold12 = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w700,
    fontSize: 12,
    height: 1.0,
    letterSpacing: 0.12,
  );


  static const TextStyle headingSemiBold16 = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 1.0,
  );

  static const TextStyle headingSemiBold16Tall = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 24 / 16,
  );

  static const TextStyle headingSemiBold14 = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 1.0,
  );

  static const TextStyle headingSemiBold14Tall = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 20 / 14,
  );

  static const TextStyle labelSemiBold12 = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w600,
    fontSize: 12,
    height: 1.0,
    letterSpacing: 0.12,
  );


  static const TextStyle bodyMedium16 = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 1.0,
  );

  static const TextStyle bodyMedium14 = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.0,
  );

  static const TextStyle bodyMedium12 = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 1.0,
  );


  static const TextStyle bodyRegular16 = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.0,
  );

  static const TextStyle bodyRegular14 = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.0,
  );

  static const TextStyle bodyRegular14Tall = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 20 / 14,
  );

  static const TextStyle bodyRegular12 = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.0,
  );

  static const TextStyle bodyRegular12Tall = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 16 / 12,
  );


  static const TextStyle bodyLight16 = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w300,
    fontSize: 16,
    height: 1.0,
  );

  static const TextStyle bodyLight14 = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w300,
    fontSize: 14,
    height: 1.0,
  );

  static const TextStyle bodyLight12 = TextStyle(
    fontFamily: _family,
    fontWeight: FontWeight.w300,
    fontSize: 12,
    height: 1.0,
  );
}