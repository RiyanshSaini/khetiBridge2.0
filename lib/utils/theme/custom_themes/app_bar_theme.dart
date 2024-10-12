import 'package:flutter/material.dart';

class RAppBarTheme {
  RAppBarTheme._(); // To avoid creating instances

  /// Light Theme
  static const lightAppBarTheme = AppBarTheme(
    elevation: 6,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: 24),
    actionsIconTheme: IconThemeData(color: Colors.black, size: 24),
    titleTextStyle: TextStyle(
      fontSize: 18.8,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  /// Dark Theme
  static const darkAppBarTheme = AppBarTheme(
    elevation: 8,
    centerTitle: false,
    scrolledUnderElevation: 8,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.white, size: 24),
    actionsIconTheme: IconThemeData(color: Colors.white, size: 24),
    titleTextStyle: TextStyle(
      fontSize: 18.8,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );
}
