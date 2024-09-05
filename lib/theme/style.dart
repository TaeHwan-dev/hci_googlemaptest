import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: const Color(0xff007aff),
    hintColor: Colors.white,
    dividerColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    canvasColor: Colors.black,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
  );
}
