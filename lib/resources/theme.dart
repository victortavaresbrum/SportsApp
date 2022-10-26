import 'package:flutter/material.dart';

class SportsGymTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.grey[200],
    textTheme: _textTheme,
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.green,
    textTheme: _textTheme,
  );

  static const _textTheme = TextTheme(
    bodyMedium: TextStyle(fontSize: 20.0),
  );
}