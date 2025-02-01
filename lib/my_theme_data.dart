import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class MyThemeData {
  static const Color lightPrimaryColor= Colors.white; //Color(0xFFDFECDB);
  static const defaultColor=kDefaultColor;



  static var lightTheme=ThemeData(
    primaryColor: lightPrimaryColor,
    primarySwatch: defaultColor,
    scaffoldBackgroundColor: Colors.white,

    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: Colors.black
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
      ),
      bodySmall: TextStyle(
        fontSize: 18
      )
    ),



    //App Bar Theme
    appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: defaultColor,
      foregroundColor: lightPrimaryColor
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: Colors.blue,
    ),
  );


  static var darkTheme=ThemeData(
    primaryColor: const Color(0xFFDFECDB),
    primarySwatch: defaultColor,
    scaffoldBackgroundColor: Colors.transparent,


    //App Bar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: Colors.blue,
    ),
  );
}