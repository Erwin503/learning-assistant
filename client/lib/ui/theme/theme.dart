import 'package:flutter/material.dart';

final themeData = ThemeData(
  fontFamily: 'Jost',
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: 24.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 18.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      fontSize: 16.0,
      color: Color.fromARGB(255, 65, 65, 65),
    ),
    bodyLarge: TextStyle(fontSize: 12.0, color: Colors.black),
  ),
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    brightness: Brightness.light,
    background: Color(0xFF007171),
  ),
);
