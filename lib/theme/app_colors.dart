import 'package:flutter/cupertino.dart';

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
}
