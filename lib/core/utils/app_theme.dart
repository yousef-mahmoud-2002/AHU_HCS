import 'package:ahu_hcs/constants.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    useMaterial3: false,
    fontFamily: 'Cairo',
    primarySwatch: kPrimaryMaterialColor,
    appBarTheme: const AppBarTheme(foregroundColor: kWhiteColor, elevation: 0),
    scaffoldBackgroundColor: kSecondaryColor,
    inputDecorationTheme: const InputDecorationTheme(
      suffixIconColor: Colors.black,
      hintStyle: TextStyle(color: Colors.black, fontSize: 15),
      border: UnderlineInputBorder(),
      enabledBorder: UnderlineInputBorder(),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
      ),
    ),
  );
}
