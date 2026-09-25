import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xfffcd1a8);
  static const Color backgroundColor = Color(0xff2a2a2a);
  static const Color greyColor = Color(0xffABABAB);

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: primaryColor,
      useMaterial3: true,
      scaffoldBackgroundColor: backgroundColor,
      fontFamily: 'Montserrat',
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundColor,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(color: Colors.white),
        hintStyle: const TextStyle(color: greyColor),
        prefixIconColor: greyColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: greyColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: greyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: primaryColor),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
        ),
      ),
    );
  }
}
