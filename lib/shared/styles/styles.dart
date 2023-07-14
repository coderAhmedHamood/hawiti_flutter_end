import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
class Themes {
  static ThemeData darkTheme=ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: colorMain2,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: colorMain,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(colorMain2),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 18),
      titleSmall:  TextStyle(fontSize: 12),
      titleMedium:  TextStyle(fontSize: 14),
    ),
    cardColor: Colors.black,
    primaryColor:colorMain2,
  );

  static ThemeData lightTheme=
  ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: colorMain2,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: colorMain,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(colorMain2),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 18),
      titleSmall:  TextStyle(fontSize: 12),
      titleMedium:  TextStyle(fontSize: 14),
    ),
    cardColor: Colors.white,
    primaryColor:colorMain2,
  );

  static BorderRadius borderRadiusBottomLeftTopRight=   BorderRadius.only(
    bottomLeft: Radius.circular(10),
    topRight: Radius.circular(10),
  );
//  Get.changeTheme()
// Get.isDarkMode()
}