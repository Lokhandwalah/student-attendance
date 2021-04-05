import 'package:flutter/material.dart';

class AppTheme {
  static final Color primary = Color(0xff548DF9);
  static final Color secondary = Color(0xffFF4880);
  static final Color accent = Color(0xffFDCB6E);
  static final Color white = Colors.white;
  static final Color black = Colors.black;
  static final gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xff3383cd),
      Color(0xff11249f),
    ],
  );
}
