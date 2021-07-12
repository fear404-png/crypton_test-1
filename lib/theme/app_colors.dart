import 'package:flutter/material.dart';

abstract class AppColors {
  static const LinearGradient loginBackgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xffE74249),
      Color(0xffBB4E75),
    ],
  );

  static const BoxDecoration loginBackgroundGradientDecoration =
      BoxDecoration(gradient: loginBackgroundGradient);

  static const Color mainScreenSelectedItem = Colors.redAccent;
  static const Color mainScreenUnselectedItem = Colors.grey;
  static const Color mainScreenBackground = Colors.white;
  static const Color mainScreenDefault = Colors.black;
}
