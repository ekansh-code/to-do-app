import 'package:flutter/material.dart';

class GlobalAppTheme {
  static final ThemeData _appThemeData = ThemeData(
    primaryColor: Colors.teal,
    appBarTheme: const AppBarTheme(
      color: Colors.white70,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: TextStyle(fontSize: 20, color: Colors.teal, fontWeight: FontWeight.bold),
    ),
    splashColor: Colors.tealAccent,
    dividerTheme: const DividerThemeData(
      color: Colors.teal,
      thickness: 1.1,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
      ),
    ),
  );

  static ThemeData get appThemeData => _appThemeData;
}
