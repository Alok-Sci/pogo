import 'package:flutter/material.dart';

class Palette {
  static const white = Color(0xffffffff);
  static const warmOffWhite = Color(0xffF7F6F2); // background
  static const lightStoneGrey = Color(0xffe6e8e4); // status chip
  static const lightGrey = Color(0xffEFEFEF); // empty rating star
  static const mutedGold = Color(0xffB7A96F);
  static const lighYellow = Color(0xffFFF7CB);

  static const dark = Color(0xff121212);
  static const charcoalGrey = Color(0xff2e2e2e);
  static const subtitleCharcoalGrey = Color.fromRGBO(46, 46, 46, .6);

  static const iphoneColor = Color(0xff7d62a6);
  static const forText = charcoalGrey;

  static const green = Color(0xff81c21e);
  static const ratingStar = Color(0xffFF6D44); // rating star

  static const darkMedium = Color(0xff121212);
  static const darkLight = Color(0xff1f1f1f);
  static const black = Color(0xff000000);

  static const innerShadow = Color(0x0DEAEAEA);
  static const dropShadow = Color(0x66000000);

  static const navbarGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xE0171717), Color(0xEB0D0D0D)],
    stops: [0.0, 1.0],
  );

  static const headerGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xff6E8F7B), Color(0x006E8F7B)],
    stops: [0.0, 0.8],
  );

  static const onboardingGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xffffffff), Color(0x00ffffff)],
    stops: [0.0, 1.0],
  );

  static const overlayGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0x002e2e2e), Color(0xff2e2e2e)],
    stops: [0.0, 1.0],
  );
}
