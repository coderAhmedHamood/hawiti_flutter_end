import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Dimensions/Dimensions.dart';
import 'colors.dart';
String fontFamilyAppAr="Cairo";
class ThemeService {


  final lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: colorMain2,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.deepOrange,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    iconTheme:const IconThemeData(
      color: Colors.white,
    ) ,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(colorMain2),
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: colorMain2,
      circularTrackColor: Colors.white,
      // refreshBackgroundColor: Colors.black,
    ),
    textTheme:  TextTheme(
      headlineLarge:  TextStyle(fontSize: 20,color: Colors.white,fontFamily:fontFamilyAppAr),
      titleLarge: TextStyle(fontSize: 18,color: Colors.black,fontFamily:fontFamilyAppAr),
      titleSmall: TextStyle(fontSize:12,color: Colors.black,fontFamily:fontFamilyAppAr),
      labelSmall: TextStyle(fontSize: 12,color: Colors.black,fontFamily:fontFamilyAppAr),
      titleMedium: TextStyle(fontSize: 14,color: Colors.black,fontFamily:fontFamilyAppAr),
      labelLarge:  TextStyle(fontSize:14, color: Colors.white,fontFamily:fontFamilyAppAr,fontWeight: FontWeight.bold),
    ),
    backgroundColor: Colors.white,

    colorScheme: ColorScheme.fromSwatch().copyWith(
      // primary: colorMain2,

      primaryContainer: Colors.white30,
      brightness: Brightness.light,
        secondary: Colors.deepOrange),
  );

// ThemeData.light().copyWith(
//
//   primaryColor: Colors.blueGrey.shade300,
//
//   appBarTheme: constant AppBarTheme(),
//
//   dividerColor: Colors.black12,
//
// );

  final darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    // backgroundColor:  Color(0xff7c94b6),
    // Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: colorMain2,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: colorMain,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(colorMain2),
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: colorMain2,
      circularTrackColor: Colors.white,
      // refreshBackgroundColor: Colors.black,
    ),
    textTheme:  TextTheme(
      headlineLarge:  TextStyle(fontSize: 20,color: Colors.black,fontFamily:fontFamilyAppAr),
      titleLarge: TextStyle(fontSize: 18, color: Colors.white,fontFamily:fontFamilyAppAr),
      titleSmall: TextStyle(fontSize: 12, color: Colors.white,fontFamily:fontFamilyAppAr),
      labelSmall: TextStyle(fontSize: 12,color: Colors.white,fontFamily:fontFamilyAppAr),

      titleMedium: TextStyle(fontSize: 14, color: Colors.white,fontFamily:fontFamilyAppAr),
      labelLarge:  TextStyle(fontSize: 14, color: Colors.black,fontFamily:fontFamilyAppAr,fontWeight: FontWeight.bold),//name restaurant

    ),
    // cardColor: Colors.black,
    // primaryColor: colorMain,
  );

// ThemeData.dark().copyWith(
//
//   primaryColor: Colors.blue,
//
//   appBarTheme: constant AppBarTheme(),
//
//   dividerColor: Colors.white54,
//
// );

  final _getStorage = GetStorage();

  final _darkThemeKey = 'isDarkTheme';

  void saveThemeData(bool isDarkMode) {
    _getStorage.write(_darkThemeKey, isDarkMode);
  }

  bool isSavedDarkMode() {
    return _getStorage.read(_darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    if(Get.isDialogOpen==true){
      Get.back();
    }
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);

    saveThemeData(!isSavedDarkMode());
    if(Get.isDialogOpen==true){
      Get.back();
    }
  }
}